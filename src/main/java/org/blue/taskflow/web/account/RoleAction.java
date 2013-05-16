package org.blue.taskflow.web.account;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.blue.taskflow.domain.entity.account.Authority;
import org.blue.taskflow.domain.entity.account.Role;
import org.blue.taskflow.service.account.AccountService;
import org.blue.taskflow.web.CrudActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.blue.taskflow.domain.dao.HibernateUtils;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-9-8
 * Time: 9:03:11
 */
@Namespace("/account")
@Results({@Result(name = CrudActionSupport.RELOAD, location = "role.action", type = "redirect")})
public class RoleAction extends CrudActionSupport<Role> {

    @Autowired
    private AccountService accountService;

    //-- ҳ������ --//
	private Long id;
	private Role entity;
	private List<Role> allRoleList;//��ɫ�б�
	private List<Long> checkedAuthIds;//ҳ���й�ѡ��Ȩ��id�б�

    //-- ModelDriven �� Preparable���� --//
    public void setId(Long id) {
		this.id = id;
	}

    @Override
	public Role getModel() {
		return entity;
	}

	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = accountService.getRole(id);
		} else {
			entity = new Role();
		}
	}

	//-- CRUD Action ���� --//
	@Override
	public String list() throws Exception {
		allRoleList = accountService.getAllRole();
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		checkedAuthIds = entity.getAuthIds();
		return INPUT;
	}

	@Override
	public String save() throws Exception {
		//����ҳ���ϵ�checkbox ����Role��Authorities Set.
		HibernateUtils.mergeByCheckedIds(entity.getAuthorityList(), checkedAuthIds, Authority.class);
		//�����û�������ɹ���Ϣ.
		accountService.saveRole(entity);
		addActionMessage("�����ɫ�ɹ�");
		return RELOAD;
	}

	@Override
	public String delete() throws Exception {
		accountService.deleteRole(id);
		addActionMessage("ɾ����ɫ�ɹ�");
		return RELOAD;
	}

	//-- ҳ�����Է��ʺ��� --//
	/**
	 * listҳ����ʾ���н�ɫ�б�.
	 */
	public List<Role> getAllRoleList() {
		return allRoleList;
	}

	/**
	 * inputҳ����ʾ������Ȩ�б�.
	 */
	public List<Authority> getAllAuthorityList() {
		return accountService.getAllAuthority();
	}

	/**
	 * inputҳ����ʾ��ɫӵ�е���Ȩ.
	 */
	public List<Long> getCheckedAuthIds() {
		return checkedAuthIds;
	}

	/**
	 * inputҳ���ύ��ɫӵ�е���Ȩ.
	 */
	public void setCheckedAuthIds(List<Long> checkedAuthIds) {
		this.checkedAuthIds = checkedAuthIds;
	}
}
