<%--
  Created by IntelliJ IDEA.
  User: blue
  Date: 2010-9-1
  Time: 17:25:40
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- spring security --%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%-- �Զ����ǩ --%>
<%@ taglib prefix="tf" uri="/taskflow-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��������ҳ��</title>
    <link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/js/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/js/validate/messages_cn.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctx}/js/calendar/jscal2.css"/>
    <script type="text/javascript" src="${ctx}/js/calendar/jscal2.js"></script>
    <script type="text/javascript" src="${ctx}/js/calendar/cn.js"></script>
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
                    }
                }
            });

            //�����������
            new Calendar({
                inputField: "birthday",
                dateFormat: "%Y-%m-%d",
                trigger: "birthday",
                bottomBar: false,
                onSelect: function() {
                    this.hide();
                }
            });
        });
    </script>
</head>
<body>
<div id="container">
    <div class="title">
        <h2><s:if test="id == null">����</s:if><s:else>�޸�</s:else>ְԱ</h2>
    </div>
    <form id="inputForm" action="employee!save.action" method="post" class="inputForm">
        <input type="hidden" name="id" value="${id}"/>
        <table class="noborder">
            <tr>
                <td>����:</td>
                <td>
                    <label><input type="text" id="name" name="name" size="40" value="${name}"/></label>
                </td>
                <td>�Ա�:</td>
                <td>
                    <label>
                        <select id="sex" name="sex">
                            <option value="��" <s:if test='"��" == sex'>selected="selected"</s:if>>��</option>
                            <option value="Ů" <s:if test='"Ů" == sex'>selected="selected"</s:if>>Ů</option>
                            <option value="δ֪" <s:if test='"δ֪" == sex'>selected="selected"</s:if>>δ֪</option>
                        </select>
                    </label>
                </td>
            </tr>
            <tr>
                <td>����:</td>
                <td>
                    <label><input type="text" id="birthday" name="birthday" size="40" value="${birthday}"/></label>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>�ֻ�����:</td>
                <td>
                    <label><input type="text" id="phoneNo" name="phoneNo" size="40" value="${phoneNo}"/></label>
                </td>
                <td>��������:</td>
                <td>
                    <label><input type="text" id="email" name="email" size="40" value="${email}"/></label>
                </td>
            </tr>
            <tr>
                <td>֤������:</td>
                <td>
                    <label>
                        <select id="certificateTypeCode" name="certificateTypeCode">
                            <option></option>
                            <tf:codeTableList codeTableName="certificateTypeCodeTable">
                                <s:iterator value="codeTableList">
                                    <option value="${code}"
                                            <s:if test="code == [1].certificateTypeCode">selected="selected"</s:if>>${name}</option>
                                </s:iterator>
                            </tf:codeTableList>
                        </select>
                    </label>
                </td>
                <td>֤������:</td>
                <td>
                    <label>
                        <input type="text" id="certificateNo" name="certificateNo" size="40" value="${certificateNo}"/>
                    </label>
                </td>
            </tr>
            <tr>
                <td>��ע:</td>
                <td colspan="3">
                    <label><textarea rows="3" cols="90" id="remark" name="remark">${remark}</textarea></label>
                </td>
            </tr>
            <tr>
                <td>��������:</td>
                <td colspan="3">
                    <label>
                        <select id="organizationId" name="organizationId">
                            <s:iterator value="organizationList">
                                <option value="${id}"
                                        <s:if test="([1].id != null && id == [1].organization.id) || ([1].id == null && id == [2].organizationId)">selected="selected"</s:if>>${name}</option>
                            </s:iterator>
                        </select>
                    </label>
                </td>
            </tr>
            <tr>
                <td>����ʱ��:</td>
                <td colspan="3">${createTime}</td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="button">
                        <security:authorize ifAnyGranted="ROLE_�޸Ļ�������">
                            <label><input class="button" type="submit" value="�ύ"/>&nbsp;</label>
                        </security:authorize>
                        <label><input class="button" type="button" value="����" onclick="history.back()"/></label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>