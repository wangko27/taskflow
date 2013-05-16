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
            $('#organizationTable tbody tr').addClass('gradeA');
            var oTable = $('#organizationTable').dataTable();
        });
    </script>
</head>
<body>
<form id="mainForm" action="organization!input.action">
    <div id="message"><s:actionmessage theme="custom" cssClass="success"/></div>
    <div id="container" class="ex_highlight_row">
        <div class="title"><h2>�����б�</h2></div>
        <div class="grid">
            <table id="organizationTable" class="display">
                <thead title="�����б�">
                <tr>
                    <th>���</th>
                    <th>���</th>
                    <th>����</th>
                    <th>���</th>
                    <th>����</th>
                    <th>����</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="organizationList" status="stat">
                    <tr>
                        <td><s:property value="#stat.index + 1"/></td>
                        <td>${no}</td>
                        <td>${name}</td>
                        <td>${shortname}</td>
                        <td><tf:codeConvertToName codeTableName="organizationTypeCodeTable" code="${typeCode}" theme="custom"/></td>
                        <td><tf:codeConvertToName codeTableName="organizationGradeCodeTable" code="${gradeCode}" theme="custom"/></td>
                        <td><fmt:formatDate value="${createTime}" pattern="yyyy-MM-dd"/></td>
                        <td>&nbsp;
                            <security:authorize ifAnyGranted="ROLE_�����������">
                                <security:authorize ifNotGranted="ROLE_�޸Ļ�������">
                                    <a href="organization!input.action?id=${id}">�鿴</a>&nbsp;
                                    <a href="employee.action?organizationId=${id}">ְԱ</a>
                                </security:authorize>
                            </security:authorize>

                            <security:authorize ifAnyGranted="ROLE_�޸Ļ�������">
                                <a href="organization!input.action?id=${id}">�޸�</a>&nbsp;
                                <a href="organization!delete.action?id=${id}">ɾ��</a>&nbsp;
                                <a href="employee.action?organizationId=${id}">ְԱ</a>
                            </security:authorize>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
                <tfoot>
                <tr>
                    <th>���</th>
                    <th>���</th>
                    <th>����</th>
                    <th>���</th>
                    <th>����</th>
                    <th>����</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="button">
            <security:authorize ifAnyGranted="ROLE_�޸Ļ�������">
                <label><input class="button" type="submit" value="���ӻ���"/></label>
            </security:authorize>
        </div>
    </div>
</form>
</body>
</html>