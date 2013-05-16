package org.blue.taskflow.domain.entity.log;

// Generated 2009-12-17 11:09:01 by Hibernate Tools 3.2.5.Beta

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.blue.taskflow.domain.entity.IdEntity;

/**
 * OperateLog generated by hbm2java
 * 
 * ������־
 */
@Entity
@Table(name = "LOG_OPERATELOG")
public class OperateLog extends IdEntity implements java.io.Serializable {
	
	private String userLoginName;
	private String employeeName;
	private String organizationName;
	private Date operateTime;
	private String operateType;

	public OperateLog() {
	}

	@Column(name = "USER_LOGIN_NAME", length = 20)
	public String getUserLoginName() {
		return this.userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	@Column(name = "EMPLOYEE_NAME", length = 100)
	public String getEmployeeName() {
		return this.employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	@Column(name = "ORGANIZATION_NAME", length = 100)
	public String getOrganizationName() {
		return this.organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	@Temporal(TemporalType.TIMESTAMP)
    @Column(name = "OPERATE_TIME")
	public Date getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Column(name = "OPERATE_TYPE", length = 3)
	public String getOperateType() {
		return this.operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

}
