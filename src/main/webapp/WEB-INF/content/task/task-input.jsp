<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-9-10
  Time: 16:58:23
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- �Զ����ǩ --%>
<%@ taglib prefix="tf" uri="/taskflow-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>�������</title>
    <link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/js/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/js/validate/messages_cn.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctx}/js/calendar/jscal2.css"/>
    <script type="text/javascript" src="${ctx}/js/calendar/jscal2.js"></script>
    <script type="text/javascript" src="${ctx}/js/calendar/cn.js"></script>
    <link href="${ctx}/css/table.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="GBK">
        $(document).ready(function() {
            //�۽���һ�������
            $("#name").focus();
            //ΪinputFormע��validate����
            $("#inputForm").validate({
                rules: {
                    name: {
                        required: true,
                        maxlength: 100
                    },
                    createEmployeeName: {
                        required: true
                    },
                    startTime: {
                        required: true
                    },
                    endTime: {
                        required: true
                    },
                    content: {
                        required: true
                    }
                }
            });

            //�����������
            new Calendar({
                inputField: "startTime",
                dateFormat: "%Y-%m-%d %H:%M:%S",
                trigger: "startTime",
                bottomBar: false,
                showTime: 24,
                weekNumbers: true,
                onSelect: function() {
                    this.hide();
                }
            });

            new Calendar({
                inputField: "endTime",
                dateFormat: "%Y-%m-%d %H:%M:%S",
                trigger: "endTime",
                bottomBar: false,
                showTime: 24,
                weekNumbers: true,
                onSelect: function() {
                    this.hide();
                }
            });

            $('#taskStateLogTable tbody tr').addClass('gradeA');
            var oTable = $('#taskStateLogTable').dataTable();
        });
    </script>
</head>
<body>
<div id="container" class="ex_highlight_row">
    <div class="title">
        <h2><s:if test="id == null">����</s:if><s:else>����</s:else>����</h2>
    </div>
    <form id="inputForm" action="task!save.action" method="post" class="inputForm">
        <input type="hidden" name="id" value="${id}"/>
        <table class="noborder">
            <tr>
                <td>����:</td>
                <td colspan="3">
                    <label><input type="text" name="name" size="90" id="name" value="${name}"
                                  <s:if test="currentEmployeeId == belongEmployee.id">readonly="readonly"</s:if>/></label>
                </td>
            </tr>
            <tr>
                <td>������:</td>
                <td>
                    <label>
                        <input type="text" id="createEmployeeName" name="createEmployeeName" size="40"
                               value="${createEmployee.name}" readonly="readonly"/>
                    </label>
                </td>
                <td>�����:</td>
                <td>
                    <label>
                        <select id="belongEmployeeId" name="belongEmployeeId"
                                <s:if test="currentEmployeeId == belongEmployee.id && (state == 'complete' || state == 'postpone' || state == 'closed')">disabled="disabled"</s:if>>
                            <s:if test="currentEmployeeId == createEmployee.id">
                                <option value=""></option>
                            </s:if>
                            <tf:organizationList>
                                <s:iterator value="organizationList">
                                    <optgroup label="${name}">
                                        <s:iterator value="employees">
                                            <option value="${id}"
                                                    <s:if test="id == [3].belongEmployee.id">selected="selected"</s:if>>${name}</option>
                                        </s:iterator>
                                    </optgroup>
                                </s:iterator>
                            </tf:organizationList>
                        </select>
                    </label>
                </td>
            </tr>
            <tr>
                <td>��ʼʱ��:</td>
                <td>
                    <label><input type="text" id="startTime" name="startTime" size="40"
                                  value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                  <s:if test="currentEmployeeId == belongEmployee.id">readonly="readonly"</s:if>/></label>
                </td>
                <td>����ʱ��:</td>
                <td>
                    <label><input type="text" id="endTime" name="endTime" size="40"
                                  value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                  <s:if test="currentEmployeeId == belongEmployee.id">readonly="readonly"</s:if>/></label>
                </td>
            </tr>
            <tr>
                <td>����:</td>
                <td colspan="3">
                    <label><textarea rows="3" cols="90" id="content" name="content"
                                     <s:if test="currentEmployeeId == belongEmployee.id">readonly="readonly"</s:if>>${content}</textarea></label>
                </td>
            </tr>
            <tr>
                <td>״̬:</td>
                <td><tf:codeConvertToName codeTableName="taskState" code="${state}" theme="custom"/></td>
                <td>����ʱ��:</td>
                <td><fmt:formatDate value="${createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="button">
                        <tf:taskOperateButton state="${state}" createEmployeeId="${createEmployee.id}"
                                              belongEmployeeId="${belongEmployee.id}"
                                              currentEmployeeId="${currentEmployeeId}" theme="custom"/>
                        <label><input class="button" type="button" value="����" onclick="history.back()"/></label>
                    </div>
                </td>
            </tr>
        </table>
    </form>

    <div id="panel" style="cursor: pointer;"><h5>�鿴����״̬��־</h5></div>
    <div class="grid" style="display:none;">
        <table id="taskStateLogTable" class="display">
            <thead title="����״̬��־�б�">
            <tr>
                <th>���</th>
                <th>����ʱ��</th>
                <th>����״̬</th>
                <th>������</th>
                <th>������</th>
                <th>������</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="taskStateLogList" status="stat">
                <tr>
                    <td><s:property value="#stat.index + 1"/></td>
                    <td><fmt:formatDate value="${operateTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td><tf:codeConvertToName codeTableName="taskState" code="${operateTaskState}"
                                              theme="custom"/></td>
                    <td>${operateEmployeeName}</td>
                    <td>${createEmployeeName}</td>
                    <td>${belongEmployeeName}</td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
    <script type="text/javascript" charset="GBK">
        $(function() {
            $("#panel").toggle(function() {
                $(this).next("div.grid").show();
            }, function() {
                $(this).next("div.grid").hide();
            });
        })
    </script>
</div>
</body>
</html>