package org.blue.taskflow.domain.entity.organization;

// Generated 2009-12-17 11:09:01 by Hibernate Tools 3.2.5.Beta

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.blue.taskflow.domain.entity.IdEntity;

/**
 * Organization generated by hbm2java
 * <p/>
 * 机构
 */
@Entity
@Table(name = "ORG_ORGANIZATION")
public class Organization extends IdEntity implements java.io.Serializable {

    private Organization parent; // 父机构
    private String name; // 名称
    private String shortname; // 简称
    private String no; // 编号
    private String typeCode; // 类型代码
    private String gradeCode; // 级别代码
    private String remark; // 备注
    private Date createTime; // 创建时间
    private Set<Employee> employees = new HashSet<Employee>(0); // 下属职员
    private Set<Organization> organizations = new HashSet<Organization>(0); // 下属机构

    public Organization() {
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PARENT_ID")
    public Organization getParent() {
        return this.parent;
    }

    public void setParent(Organization parent) {
        this.parent = parent;
    }

    @Column(name = "NAME", nullable = false, length = 100)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "SHORTNAME", length = 50)
    public String getShortname() {
        return this.shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname;
    }

    @Column(name = "NO", length = 20)
    public String getNo() {
        return this.no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    @Column(name = "TYPE_CODE", length = 2)
    public String getTypeCode() {
        return this.typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    @Column(name = "GRADE_CODE", length = 2)
    public String getGradeCode() {
        return this.gradeCode;
    }

    public void setGradeCode(String gradeCode) {
        this.gradeCode = gradeCode;
    }

    @Column(name = "REMARK", length = 200)
    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_TIME", nullable = false)
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @OneToMany(mappedBy = "organization", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY, orphanRemoval = true)
    @OrderBy(value = "name ASC")
    public Set<Employee> getEmployees() {
        return this.employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    @OneToMany(mappedBy = "parent", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY, orphanRemoval = true)
    @OrderBy(value = "no ASC")
    public Set<Organization> getOrganizations() {
        return this.organizations;
    }

    public void setOrganizations(Set<Organization> organizations) {
        this.organizations = organizations;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
