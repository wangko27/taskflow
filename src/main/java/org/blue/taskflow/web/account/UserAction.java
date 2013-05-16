package org.blue.taskflow.web.account;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.blue.taskflow.domain.entity.account.Role;
import org.blue.taskflow.domain.entity.account.User;
import org.blue.taskflow.domain.entity.organization.Employee;
import org.blue.taskflow.service.ServiceException;
import org.blue.taskflow.service.account.AccountService;
import org.blue.taskflow.service.organization.OrganizationService;
import org.blue.taskflow.web.CrudActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.blue.taskflow.domain.dao.HibernateUtils;
import org.springside.modules.utils.web.struts2.Struts2Utils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-9-2
 * Time: 17:41:58
 */
@Namespace("/account")
@Results({@Result(name = CrudActionSupport.RELOAD, location = "/organization/employee.action?organizationId=${model.employee.organization.id}", type = "redirect")})
public class UserAction extends CrudActionSupport<User> {

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrganizationService organizationService;

    //-- ҳ������ --//
    private Long id;
    private User entity;
    private Long employeeId;
    private List<Long> checkedRoleIds; //ҳ���й�ѡ�Ľ�ɫid�б�

    //-- ModelDriven �� Preparable���� --//
    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public User getModel() {
        return entity;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = accountService.getUser(id);
        } else {
            entity = new User();
        }
    }

    @Override
    public String list() throws Exception {
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        if (entity != null) {
            checkedRoleIds = entity.getRoleIds();
        }
        return INPUT;
    }

    @Override
    public String save() throws Exception {
        //����ҳ���ϵ�checkboxѡ�� ����User��Roles Set
        HibernateUtils.mergeByCheckedIds(entity.getRoleList(), checkedRoleIds, Role.class);
        if (this.employeeId != null) {
            Employee employee = organizationService.getEmployee(this.employeeId);
            entity.setEmployee(employee);
        }
        accountService.createAndStoreUser(entity);
        addActionMessage("�����û��ɹ�");
        return RELOAD;
    }

    @Override
    public String delete() throws Exception {
        try {
            accountService.deleteUser(id);
            addActionMessage("ɾ���û��ɹ�");
        } catch (ServiceException e) {
            logger.error(e.getMessage(), e);
            addActionMessage("ɾ���û�ʧ��");
        }
        return RELOAD;
    }

    //-- ����Action���� --//

    /**
     * ֧��ʹ��Jquery.validate Ajax�����û����Ƿ��ظ�.
     */
    public String checkLoginName() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String newLoginName = request.getParameter("loginName");
        String oldLoginName = request.getParameter("oldLoginName");

        if (accountService.isLoginNameUnique(newLoginName, oldLoginName)) {
            Struts2Utils.renderText("true");
        } else {
            Struts2Utils.renderText("false");
        }
        //��Ϊֱ��������ݶ�������jsp,��˷���null.
        return null;
    }

    //-- ҳ�����Է��ʺ��� --//
    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    /**
	 * inputҳ����ʾ���н�ɫ�б�.
	 */
	public List<Role> getAllRoleList() {
		return accountService.getAllRole();
	}

    /**
     * inputҳ����ʾ�û�ӵ�еĽ�ɫ.
     */
    public List<Long> getCheckedRoleIds() {
        return checkedRoleIds;
    }

    /**
     * inputҳ���ύ�û�ӵ�еĽ�ɫ.
     */
    public void setCheckedRoleIds(List<Long> checkedRoleIds) {
        this.checkedRoleIds = checkedRoleIds;
    }
}
