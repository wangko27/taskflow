package org.blue.taskflow.domain.dao.account;

import java.util.List;

import org.blue.taskflow.domain.entity.account.Role;
import org.blue.taskflow.domain.entity.account.User;
import org.springframework.stereotype.Component;
import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * ��ɫ����ķ���DAO.
 *
 */
@Component
public class RoleDAO extends HibernateDao<Role, Long> {

    private static final String QUERY_USER_BY_ROLEID = "select u from User u left join u.roleList r where r.id=?";

    /**
     * ���غ���,��ΪRole��û�н�����User�Ĺ���,�����Ҫ�Խϵ�Ч�ʵķ�ʽ����ɾ��User��Role�Ķ�Զ��м��.
     */
    @SuppressWarnings("unchecked")
    @Override
    public void delete(Long id) {
        Role role = get(id);
        //��ѯ��ӵ�иý�ɫ���û�,��ɾ�����û��Ľ�ɫ.
        List<User> users = createQuery(QUERY_USER_BY_ROLEID, role.getId()).list();
        for (User u : users) {
            u.getRoleList().remove(role);
        }
        super.delete(role);
    }
}
