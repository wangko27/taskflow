package org.blue.taskflow.unit.service.organization;

import org.blue.taskflow.data.OrganizationData;
import org.blue.taskflow.domain.entity.organization.Organization;
import org.blue.taskflow.domain.manager.OrganizationManager;
import org.blue.taskflow.service.organization.OrganizationServiceImpl;
import org.easymock.EasyMock;
import org.easymock.IMocksControl;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * OrganizationServiceImpl�Ĳ�������, ����Service���ҵ���߼�.
 *
 * ʹ��EasyMock��OrganizationManager����ģ��.
 *
 * @author blue
 */
public class OrganizationServiceImplTest {
    private IMocksControl control = EasyMock.createControl();

    private OrganizationServiceImpl organizationService;
    private OrganizationManager mockOrganizationManager;

    @Before
    public void setUp() {
        organizationService = new OrganizationServiceImpl();
        mockOrganizationManager = control.createMock(OrganizationManager.class);
        organizationService.setOrganizationManager(mockOrganizationManager);
    }

    @After
	public void tearDown() {
		control.verify();
	}

    @Test
    public void getAllOrganizationExist() {
        //׼������
        Organization organization = OrganizationData.getRandomOrganizationWithEmployee();
        List<Organization> organizationList = new ArrayList<Organization>();
        organizationList.add(organization);

        //¼�ƽű�
		EasyMock.expect(mockOrganizationManager.getAllOrganization()).andReturn(organizationList);
		control.replay();

        //ִ�в���
        List<Organization> result = organizationService.getAllOrganization();

        //У����
        assertEquals(1, result.size());
    }
}
