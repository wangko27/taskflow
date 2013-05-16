package org.blue.taskflow.domain.entity.account;

// Generated 2009-12-17 11:09:01 by Hibernate Tools 3.2.5.Beta

import javax.persistence.*;

import com.google.common.collect.Lists;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.blue.taskflow.domain.entity.IdEntity;
import org.blue.taskflow.domain.entity.organization.Employee;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springside.modules.utils.reflection.ConvertUtils;

import java.util.List;

/**
 * �û�
 *
 * ʹ��JPA annotation ����ORM��ϵ
 * ʹ��Hibernate annotation ����JPA 1.0δ���ǵĲ���
 */
@Entity
@Table(name = "ACCT_USER")
public class User extends IdEntity implements java.io.Serializable {

    private Employee employee; // ����ְԱ
    private String loginName; // ��¼�û���
    private String password; // �û�����
    private List<Role> roleList = Lists.newArrayList();//����Ĺ������󼯺�

    public User() {
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", unique = true)
    public Employee getEmployee() {
        return this.employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Column(name = "LOGIN_NAME", nullable = false, length = 20, unique = true)
    public String getLoginName() {
        return this.loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(name = "PASSWORD", length = 20)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ManyToMany
    //�м����,��������Ĭ����������
    @JoinTable(name = "ACCT_USER_ROLE", joinColumns = {@JoinColumn(name = "USER_ID")}, inverseJoinColumns = {@JoinColumn(name = "ROLE_ID")})
    //Fecth���Զ���
    @Fetch(FetchMode.SUBSELECT)
    //���ϰ�id����.
    @OrderBy("id")
    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    /**
     * �û�ӵ�еĽ�ɫ�����ַ���, �����ɫ������','�ָ�.
     */
    //�ǳ־û�����.
    @Transient
    public String getRoleNames() {
        return ConvertUtils.convertElementPropertyToString(roleList, "name", ", ");
    }

    /**
     * �û�ӵ�еĽ�ɫid�ַ���, �����ɫid��','�ָ�.
     */
    //�ǳ־û�����.
    @Transient
    @SuppressWarnings("unchecked")
    public List<Long> getRoleIds() {
        return ConvertUtils.convertElementPropertyToList(roleList, "id");
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
