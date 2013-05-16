package org.blue.taskflow.service.account;

import org.blue.taskflow.domain.entity.account.Authority;
import org.blue.taskflow.domain.entity.account.Role;
import org.blue.taskflow.domain.entity.account.User;

import java.util.List;

/**
 * �˺Ź������ӿ�
 * <p/>
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-9-2
 * Time: 17:47:02
 */
public interface AccountService {

    /**
     * �����򱣴��û�
     *
     * @param user �û�
     */
    void createAndStoreUser(User user);

    /**
     * ��ȡ�û�ͨ���û�ID
     *
     * @param id �û�ID
     * @return �û�
     */
    User getUser(Long id);

    /**
     * ɾ���û�
     *
     * @param id �û�ID
     */
    void deleteUser(Long id);

    /**
     * ����û����Ƿ�Ψһ
     *
     * @param newLoginName �û���
     * @param oldLoginName �û���
     * @return loginName�����ݿ���Ψһ�����oldLoginNameʱ����true.
     */
    boolean isLoginNameUnique(String newLoginName, String oldLoginName);

    /**
     * ��ȡ���н�ɫ�б�
     *
     * @return ���н�ɫ�б�
     */
    List<Role> getAllRole();

    /**
     * ��ȡ��ɫͨ����ɫID
     *
     * @param id ��ɫID
     * @return ��ɫ
     */
    Role getRole(Long id);

    /**
     * �����ɫ
     *
     * @param role ��ɫ
     */
    void saveRole(Role role);

    /**
     * ɾ����ɫ
     *
     * @param id ��ɫID
     */
    void deleteRole(Long id);

    /**
     * ��ȡ����Ȩ���б�
     *
     * @return ����Ȩ���б�
     */
    List<Authority> getAllAuthority();
}
