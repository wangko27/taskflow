<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-9-8
  Time: 9:43:02
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- spring security --%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Ȩ�޹���ҳ��</title>

    <link href="${ctx}/css/table.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="GBK">
        $(document).ready(function() {
            $('#roleTable tbody tr').addClass('gradeX');
            var oTable = $('#roleTable').dataTable();
        });
    </script>
</head>
<body>
<form id="mainForm" action="role!input.action">
    <div id="message"><s:actionmessage theme="custom" cssClass="success"/></div>
    <div id="container" class="ex_highlight_row">
        <div class="title"><h2>��ɫ�б�</h2></div>
        <div class="grid">
            <table id="roleTable" class="display">
                <thead title="��ɫ�б�">
                <tr>
                    <th>���</th>
                    <th>����</th>
                    <th>��Ȩ</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="allRoleList" status="stat">
                    <tr>
                        <td><s:property value="#stat.index + 1"/></td>
                        <td>${name}</td>
                        <td>${authNames}</td>
                        <td>&nbsp;
                            <security:authorize ifAnyGranted="ROLE_����˺Ź���">
                                <security:authorize ifNotGranted="ROLE_�޸��˺Ź���">
                                    <a href="role!input.action?id=${id}">�鿴</a>&nbsp;
                                </security:authorize>
                            </security:authorize>

                            <security:authorize ifAnyGranted="ROLE_�޸��˺Ź���">
                                <a href="role!input.action?id=${id}" id="editLink-${name}">�޸�</a>&nbsp;
                                <a href="role!delete.action?id=${id}" id="deleteLink-${name}">ɾ��</a>
                            </security:authorize>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
                <tfoot>
                <tr>
                    <th>���</th>
                    <th>����</th>
                    <th>��Ȩ</th>
                    <th>����</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="button">
            <security:authorize ifAnyGranted="ROLE_�޸��˺Ź���">
                <label><input class="button" type="submit" value="���ӽ�ɫ"/></label>
            </security:authorize>
        </div>
    </div>
</form>
</body>
</html>