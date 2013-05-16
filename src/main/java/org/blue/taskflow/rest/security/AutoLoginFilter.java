package org.blue.taskflow.rest.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.filter.GenericFilterBean;
import org.springside.modules.security.springsecurity.SpringSecurityUtils;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * �Զ���Ĭ���û�����¼��filter, ���ڿ���ʱ����Ҫÿ�ν����¼ҳ��.
 *
 * Created by IntelliJ IDEA.
 * User: blue
 * Date: 2010-9-10
 * Time: 10:30:11
 */
public class AutoLoginFilter extends GenericFilterBean {

    private UserDetailsService userDetailsService;

    private boolean enabled = false;

    private String defaultUserName;

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        //����������ҵ�ǰ�û�δ��¼����е�¼
        if (enabled && SpringSecurityUtils.getCurrentUser() == null) {
            UserDetails userDetails = userDetailsService.loadUserByUsername(defaultUserName);

            if (userDetails == null) {
                throw new RuntimeException("Ĭ���û�" + defaultUserName + "������");
            }

            SpringSecurityUtils.saveUserDetailsToContext(userDetails, (HttpServletRequest) request);
        }

        chain.doFilter(request, response);
    }

    @Autowired
    public void setUserDetailsService(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Required
    public void setDefaultUserName(String defaultUserName) {
        this.defaultUserName = defaultUserName;
    }
}
