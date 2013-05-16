package org.blue.taskflow.service.organization;

import org.blue.taskflow.domain.entity.organization.Employee;
import org.blue.taskflow.domain.entity.organization.Organization;

import java.util.List;

/**
 * �����������ӿ�
 * <p/>
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-8-31
 * Time: 8:50:56
 */
public interface OrganizationService {

    /**
     * �����򱣴����
     *
     * @param organization ����
     */
    void createAndStoreOrganization(Organization organization);

    /**
     * ɾ������
     *
     * @param id ����ID
     */
    void deleteOrganization(Long id);

    /**
     * ��ȡ���л����ļ���
     *
     * @return ���л����ļ���
     */
    List<Organization> getAllOrganization();

    /**
     * ��ȡ���и������ļ���
     *
     * @return ���и������ļ���
     */
    List<Organization> getAllRootOrganization();

    /**
     * ��ȡ����ͨ������ID
     *
     * @param id ����ID
     * @return ����
     */
    Organization getOrganization(Long id);

    /**
     * �����򱣴�ְԱ
     *
     * @param employee ְԱ
     */
    void createAndStoreEmployee(Employee employee);

    /**
     * ��ȡְԱͨ��ְԱID
     *
     * @param id ְԱID
     * @return ְԱ
     */
    Employee getEmployee(Long id);

    /**
     * ɾ��ְԱ
     *
     * @param id ְԱID
     */
    void deleteEmployee(Long id);

    /**
     * ��ȡ����ְԱ�ļ���
     *
     * @return ����ְԱ�ļ���
     */
    List<Employee> getAllEmployees();

    /**
     * ��ȡ�����µ�����ְԱ�ļ���ͨ������ID
     *
     * @param organizationId ����ID
     * @return �����µ�����ְԱ�ļ���
     */
    List<Employee> getEmployeesByOrganizationId(Long organizationId);
}