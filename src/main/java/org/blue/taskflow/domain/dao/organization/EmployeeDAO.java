package org.blue.taskflow.domain.dao.organization;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Component;
import org.springside.modules.orm.hibernate.HibernateDao;

import org.blue.taskflow.domain.entity.organization.Employee;

@Component
public class EmployeeDAO extends HibernateDao<Employee, Long> {
	/**
	 * LazyLoad��������ĳ�ʼ������.
	 */
	public void initAllProperties(List<Employee> employeeList) {
		for (Employee employee : employeeList) {
			initAllProperties(employee);
		}
	}
	
	public void initAllProperties(Employee employee) {
		if (employee != null) {
			Hibernate.initialize(employee.getUsers());
			Hibernate.initialize(employee.getOrganization());
		}
	}
}
