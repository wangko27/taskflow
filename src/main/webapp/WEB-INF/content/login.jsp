<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-8-27
  Time: 23:40:49
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- spring security --%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TaskFlow ��¼ҳ</title>
    <style type="text/css" title="currentStyle">
        @import "${ctx}/css/yui/reset.css";
        @import "${ctx}/css/yui/base.css";
        @import "${ctx}/css/yui/fonts.css";
        @import "${ctx}/css/yui/grids.css";
        @import "${ctx}/css/style.css";
    </style>
    <script type="text/javascript" src="${ctx}/js/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="${ctx}/js/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/js/validate/messages_cn.js"></script>
    <script type="text/javascript" charset="GBK">
        $(document).ready(function() {
            $("#loginForm").validate();
        });

        function refreshCaptcha() {
            $('#captchaImg').hide().attr('src', '${ctx}/jcaptcha.jpg?' + Math.floor(Math.random() * 100)).fadeIn();
        }
    </script>
</head>
<body>
<div id="doc3" class="yui-t2">
    <div id="hd">
        <div id="title">
            <h1>BLUE</h1>

            <h2>TaskFlow-������ Demo</h2>
        </div>
        <div id="menu">
            <ul style="text-align: left;">
                <li>���, �����½ϵͳ.</li>
            </ul>
        </div>
    </div>
    <div id="bd">
        <div id="yui-main">
            <div class="yui-b">
                <%if ("1".equals(request.getParameter("error"))) {%>
                <div class="error"> �û����������,������.</div>
                <%
                    }
                    if ("2".equals(request.getParameter("error"))) {
                %>
                <div class="error"> ��֤�����,������.</div>
                <%
                    }
                    if ("3".equals(request.getParameter("error"))) {
                %>
                <div class="error"> ���ʺ��Ѵӱ𴦵�¼.</div>
                <%}%>
                <form id="loginForm" action="${ctx}/j_spring_security_check" method="post" style="margin-top:1em">
                    <table class="noborder">
                        <tr>
                            <td><label>�û���:</label></td>
                            <td><label><input type='text' id='j_username' name='j_username' class="required"
                                    <s:if test="not empty param.error">
                                        value='<%=session.getAttribute(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY)%>'</s:if> /></label>
                            </td>
                            <td rowspan="3"><img id="captchaImg" src="${ctx}/jcaptcha.jpg" alt="��֤��"/></td>
                        </tr>
                        <tr>
                            <td><label>����:</label></td>
                            <td><label><input type='password' id='j_password' name='j_password'
                                              class="required"/></label></td>
                        </tr>
                        <tr>
                            <td>��֤��:</td>
                            <td><label><input type='text' name='j_captcha' size='5'/></label></td>
                        </tr>
                        <tr>
                            <td colspan='3'>
                                <label><input type="checkbox" name="_spring_security_remember_me"/>�����ڼ�ס��</label>
                                <span style="margin-left:25px"><a href="javascript:refreshCaptcha()">���������һ��</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan='3' align="center">
                                <input value="��¼" type="submit" class="button"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <div id="ft">Copyright &copy; 2005-2010 blue</div>
</div>
</body>
</html>