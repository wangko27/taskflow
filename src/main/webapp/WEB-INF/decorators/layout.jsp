<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-8-25
  Time: 14:30:24
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- spring security --%>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.blue.taskflow.rest.security.OperatorDetails" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- �ӱ�װ��ҳ���ȡtitle��ǩ����,������Ĭ��ֵ-->
    <title><decorator:title default="ϵͳ��������ģ��"/></title>
    <style type="text/css" title="currentStyle">
        @import "${ctx}/css/yui/reset.css";
        @import "${ctx}/css/yui/base.css";
        @import "${ctx}/css/yui/fonts.css";
        @import "${ctx}/css/yui/grids.css";
        @import "${ctx}/css/style.css";
        @import "${ctx}/css/menu.css";
    </style>
    <script type="text/javascript" src="${ctx}/js/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="${ctx}/js/ddaccordion.js"></script>
    <script type="text/javascript" charset="GBK">
        ddaccordion.init({
            headerclass: "menuheaders",
            contentclass: "menucontents",
            revealtype: "clickgo",
            mouseoverdelay: 200,
            collapseprev: true,
            defaultexpanded: [0],
            onemustopen: false,
            animatedefault: false,
            persiststate: true,
            toggleclass: ["unselected", "selected"],
            togglehtml: ["none", "", ""],
            animatespeed: 500,
            oninit:function(expandedindices) {
            },
            onopenclose:function(header, index, state, isuseractivated) {
            }
        })

    </script>
    <%
        String helloName;
        OperatorDetails operatorDetails = SpringSecurityUtils.getCurrentUser();
        if (operatorDetails.getEmployee() != null) {
            helloName = operatorDetails.getEmployee().getName();
        } else {
            helloName = operatorDetails.getUsername();
        }
    %>
    <!-- �ӱ�װ��ҳ���ȡhead��ǩ���� -->
    <decorator:head/>
</head>
<body>
<div id="doc3" class="yui-t2">
    <div id="hd">
        <div id="title">
            <h1>BLUE</h1>

            <h2>TaskFlow-������ Demo</h2>
        </div>
        <div id="menu">
            <ul>
                <li>���, <%=helloName%>(<%=SpringSecurityUtils.getCurrentUserIp()%>).</li>
                <li><a href="${ctx}/j_spring_security_logout">�˳���¼</a></li>
            </ul>
        </div>
    </div>
    <div id="bd">
        <div id="leftbar" class="yui-b">
            <div class="arrowsidemenu">
                <div><a href="#" title="��ҳ">��ҳ</a></div>
                <security:authorize ifAnyGranted="ROLE_�����������">
                    <div class="menuheaders"><a href="#" title="����ְԱ">����ְԱ</a></div>
                    <ul class="menucontents">
                        <li><a href="${ctx}/organization/organization">����ְԱ����</a></li>
                        <li><a href="${ctx}/organization/organization!tree.action">����ְԱ��</a></li>
                    </ul>
                </security:authorize>
                <security:authorize ifAnyGranted="ROLE_����˺Ź���">
                    <div><a href="${ctx}/account/role" title="�˺�Ȩ��">�˺�Ȩ��</a></div>
                </security:authorize>
                <security:authorize ifAnyGranted="ROLE_����������">
                    <div><a href="${ctx}/task/task" title="�ҵ�����">�ҵ�����</a></div>
                    <div class="menuheaders"><a href="#" title="���񱨱�">�����ѯ��ͳ��</a></div>
                    <ul class="menucontents">
                        <li><a href="#">�����ѯ</a></li>
                        <li><a href="${ctx}/report/report.action">����ͳ��</a></li>
                    </ul>
                </security:authorize>
            </div>
        </div>
        <div id="yui-main">
            <div class="yui-b">
                <!-- �ӱ�װ��ҳ���ȡbody��ǩ���� -->
                <decorator:body/>
            </div>
        </div>
    </div>
    <div id="ft">Copyright &copy; 2005-2010 blue</div>
</div>
</body>
</html>