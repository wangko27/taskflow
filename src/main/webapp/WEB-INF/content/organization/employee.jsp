<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-9-1
  Time: 16:55:13
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- spring security --%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%-- �Զ����ǩ --%>
<%@ taglib prefix="tf" uri="/taskflow-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��������ҳ��</title>
    <link href="${ctx}/css/table.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="GBK">
        $(document).ready(function() {
            var oTable = $('#employeeTable').dataTable();
        });
    </script>
</head>
<body>
<form id="mainForm" action="employee!input.action">
    <input type="hidden" name="organizationId" value="${organizationId}"/>
    <div id="message"><s:actionmessage theme="custom" cssClass="success"/></div>
    <div id="container" class="ex_highlight_row">
        <div class="title"><h2>ְԱ�б�</h2></div>
        <div class="grid">
            <table id="employeeTable" class="display">
                <thead title="ְԱ�б�">
                <tr>
                    <th>���</th>
                    <th>����</th>
                    <th>�Ա�</th>
                    <th>֤������</th>
                    <th>֤������</th>
                    <th>�ֻ�����</th>
                    <th>��������</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="employeeList" status="stat">
                    <tr>
                        <td><s:property value="#stat.index + 1"/></td>
                        <td>${name}</td>
                        <td>${sex}</td>
                        <td><tf:codeConvertToName codeTableName="certificateTypeCodeTable" code="${certificateTypeCode}" theme="custom"/></td>
                        <td>${certificateNo}</td>
                        <td>${phoneNo}</td>
                        <td>${email}</td>
                        <td><fmt:formatDate value="${createTime}" pattern="yyyy-MM-dd"/></td>
                        <td>&nbsp;
                            <security:authorize ifAnyGranted="ROLE_�����������">
                                <security:authorize ifNotGranted="ROLE_�޸Ļ�������">
                                    <a href="employee!input.action?id=${id}">�鿴</a>&nbsp;
                                </security:authorize>
                            </security:authorize>

                            <security:authorize ifAnyGranted="ROLE_�޸Ļ�������">
                                <a href="employee!input.action?id=${id}">�޸�</a>&nbsp;
                                <a href="employee!delete.action?id=${id}">ɾ��</a>&nbsp;
                            </security:authorize>

                            <security:authorize ifAnyGranted="ROLE_����˺Ź���">
                                <a href="${ctx}/account/user!input.action?employeeId=${id}&id=<s:iterator value="users" begin="0" end="0">${id}</s:iterator>">�˺�</a>
                            </security:authorize>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
                <tfoot>
                <tr>
                    <th>���</th>
                    <th>����</th>
                    <th>�Ա�</th>
                    <th>֤������</th>
                    <th>֤������</th>
                    <th>�ֻ�����</th>
                    <th>��������</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="button">
            <security:authorize ifAnyGranted="ROLE_�޸Ļ�������">
                <label><input class="button" type="submit" value="����ְԱ"/></label>
            </security:authorize>
            <label><input class="button" type="button" value="����" onclick="gotoOrganization()"/></label>
            <script type="text/javascript" charset="GBK">
                function gotoOrganization() {
                    $('#mainForm').attr("action", "organization");
                    $('#mainForm').submit();
                }
            </script>
        </div>
    </div>
</form>
</body>
</html>