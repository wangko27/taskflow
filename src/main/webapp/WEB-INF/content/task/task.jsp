<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-9-10
  Time: 16:14:27
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" uri="/taskflow-tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>�ҵ�����</title>
    <link href="${ctx}/css/table.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="GBK">
        $(document).ready(function() {
            $('#myTaskTable tbody tr').addClass('gradeA');
            var oTable = $('#myTaskTable').dataTable();
        });
    </script>
</head>
<body>
<form id="mainForm" action="task!input.action">
    <div id="message"><s:actionmessage theme="custom" cssClass="success"/></div>
    <div id="container" class="ex_highlight_row">
        <div class="title"><h2>�ҵ�����</h2></div>
        <div class="grid">
            <table id="myTaskTable" class="display">
                <thead title="�����б�">
                <tr>
                    <th>���</th>
                    <th>���</th>
                    <th>����</th>
                    <th>������</th>
                    <th>������</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                    <th>״̬</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="taskList" status="stat">
                    <c:set var="dateNow" value="<%=new Date()%>"/>
                    <tr<c:if test="${endTime < dateNow}"> class="gradeX"</c:if>>
                        <td><s:property value="#stat.index + 1"/></td>
                        <td>${id}</td>
                        <td>${name}</td>
                        <td>${createEmployee.name}</td>
                        <td>${belongEmployee.name}</td>
                        <td><fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>${typeCode}</td>
                        <td><tf:codeConvertToName codeTableName="taskState" code="${state}" theme="custom"/></td>
                        <td><fmt:formatDate value="${createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>&nbsp;
                            <a href="task!input.action?id=${id}">����</a>
                            <s:if test="createEmployee.id == [1].currentEmployeeId">&nbsp;<a href="task!delete.action?id=${id}">ɾ��</a></s:if>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
                <tfoot>
                <tr>
                    <th>���</th>
                    <th>���</th>
                    <th>����</th>
                    <th>������</th>
                    <th>������</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                    <th>״̬</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="button">
            <label><input class="button" type="submit" value="��������"/></label>
        </div>
    </div>
</form>
</body>
</html>