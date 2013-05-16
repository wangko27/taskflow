package org.blue.taskflow.unit.domain.dao.organization;

import static org.junit.Assert.*;

import org.blue.taskflow.data.OrganizationData;
import org.blue.taskflow.domain.dao.organization.OrganizationDAO;
import org.blue.taskflow.domain.entity.organization.Organization;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTxTestCase;
import org.springside.modules.test.utils.DbUnitUtils;

import javax.sql.DataSource;

/**
 * OrganizationDAO�Ĳ�������, ����ORMӳ�估�����DAO����.
 *
 * Ĭ����ÿ�����Ժ�������лع�.
 *
 * @author blue
 */
@ContextConfiguration(locations = { "/applicationContext-test.xml" })
public class OrganizationDAOTest extends SpringTxTestCase {
    private static DataSource dataSourceHolder = null;

    @Autowired
    private OrganizationDAO entityDAO;

    @Before
	public void loadDefaultData() throws Exception {
		if (dataSourceHolder == null) {
			DbUnitUtils.loadData(dataSource, "/data/default-data.xml");
			dataSourceHolder = dataSource;
		}
	}

	@AfterClass
	public static void cleanDefaultData() throws Exception {
		DbUnitUtils.removeData(dataSourceHolder, "/data/default-data.xml");
	}

    @Test
	//�������Ҫ�����������ݿ�,��Rollback��Ϊfalse
	//@Rollback(false)
	public void crudEntityWithEmployee() {
		//�½��������ְԱ�Ļ���
		Organization organization = OrganizationData.getRandomOrganizationWithEmployee();
		entityDAO.save(organization);
		//ǿ��ִ��sql���
		entityDAO.flush();

		//��ȡְԱ
		organization = entityDAO.findUniqueBy("id", organization.getId());
		assertEquals(1, organization.getEmployees().size());

		//ɾ��������ְԱ
		organization.getEmployees().clear();
		entityDAO.flush();
		organization = entityDAO.findUniqueBy("id", organization.getId());
		assertEquals(0, organization.getEmployees().size());

		//ɾ������
		entityDAO.delete(organization.getId());
		entityDAO.flush();
		organization = entityDAO.findUniqueBy("id", organization.getId());
		assertNull(organization);
	}
}
