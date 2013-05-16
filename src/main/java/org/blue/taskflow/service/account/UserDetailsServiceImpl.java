package org.blue.taskflow.service.account;

import com.google.common.collect.Sets;
import org.blue.taskflow.domain.entity.account.Authority;
import org.blue.taskflow.domain.entity.account.Role;
import org.blue.taskflow.domain.entity.account.User;
import org.blue.taskflow.domain.manager.AccountManager;
import org.blue.taskflow.rest.security.OperatorDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Set;

/**
 * ʵ��SpringSecurity��UserDetailsService�ӿ�,ʵ�ֻ�ȡ�û�Detail��Ϣ�Ļص�����.
 *
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-8-27
 * Time: 11:08:02
 */
@Transactional(readOnly = true)
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private AccountManager accountManager;

    @Override
    public UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException, DataAccessException {
        User user = accountManager.getUserByLoginName(loginName);
		if (user == null) {
			throw new UsernameNotFoundException("�û�" + loginName + " ������");
		}

		Set<GrantedAuthority> grantedAuths = obtainGrantedAuthorities(user);

		//-- ����������, ��ʱȫ����Ϊtrue. --//
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		OperatorDetails userDetails = new OperatorDetails(user.getLoginName(), user
				.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, grantedAuths);
        //�����¼ʱ����Ϣ��ְԱ�ͽ�ɫ
        userDetails.setLoginTime(new Date());
        userDetails.setEmployee(user.getEmployee());
		userDetails.setRoleList(user.getRoleList());
		return userDetails;    
    }

    /**
	 * ����û����н�ɫ��Ȩ�޼���.
	 */
	private Set<GrantedAuthority> obtainGrantedAuthorities(User user) {
		Set<GrantedAuthority> authSet = Sets.newHashSet();
		for (Role role : user.getRoleList()) {
			for (Authority authority : role.getAuthorityList()) {
				authSet.add(new GrantedAuthorityImpl(authority.getPrefixedName()));
			}
		}
		return authSet;
	}
}
