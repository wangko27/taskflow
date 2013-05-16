<#assign create = "create"/>
<#assign assign = "assign"/>
<#assign accept = "accept"/>
<#assign refuse = "refuse"/>
<#assign complete = "complete"/>
<#assign postpone = "postpone"/>
<#assign closed = "closed"/>

<#if parameters.state == "">
<label><input class="button" type="submit" value="����"/>&nbsp;</label>
    <#elseif parameters.state == create><#--����״̬-->
    <label><input class="button" type="submit" value="����"/>&nbsp;</label>
    <#elseif parameters.state == assign && parameters.currentEmployeeId == parameters.belongEmployeeId><#--����״̬-->
    <label><input class="button" type="submit" value="����"/>&nbsp;</label>
    <label><input class="button" type="button" value="����" onclick="turnToAccept()"/>&nbsp;</label>
    <label><input class="button" type="button" value="�ܾ�" onclick="turnToRefuse()"/>&nbsp;</label>
    <#elseif parameters.state == accept && parameters.currentEmployeeId == parameters.belongEmployeeId><#--����״̬-->
    <label><input class="button" type="button" value="���" onclick="turnToComplete()"/>&nbsp;</label>
    <label><input class="button" type="button" value="�ܾ�" onclick="turnToRefuse()"/>&nbsp;</label>
    <#elseif parameters.state == refuse  && parameters.currentEmployeeId == parameters.belongEmployeeId><#--�ܾ�״̬-->
    <label><input class="button" type="submit" value="����"/>&nbsp;</label>
    <label><input class="button" type="button" value="����" onclick="turnToAccept()"/>&nbsp;</label>
    <#elseif parameters.state == complete><#--���״̬-->
        <#if parameters.currentEmployeeId == parameters.belongEmployeeId>
        <label><input class="button" type="button" value="���´�" onclick="turnToAccept()"/>&nbsp;</label>
            <#elseif parameters.currentEmployeeId == parameters.createEmployeeId>
            <label><input class="button" type="submit" value="���·���"/>&nbsp;</label>
            <label><input class="button" type="button" value="�ر�" onclick="turnToClosed()"/>&nbsp;</label>
        </#if>
    <#elseif parameters.state == postpone><#--����״̬-->
        <#if parameters.currentEmployeeId == parameters.belongEmployeeId>
            <#elseif parameters.currentEmployeeId == parameters.createEmployeeId>
            <label><input class="button" type="submit" value="���·���"/>&nbsp;</label>
        </#if>
    <#elseif parameters.state == closed><#--�ر�״̬-->
        <#if parameters.currentEmployeeId == parameters.belongEmployeeId>
            <#elseif parameters.currentEmployeeId == parameters.createEmployeeId>
            <label><input class="button" type="submit" value="���·���"/>&nbsp;</label>
        </#if>
    <#else>
    <label><input class="button" type="submit" value="����"/>&nbsp;</label>
    <label><input class="button" type="button" value="����" onclick="turnToPostpone()"/>&nbsp;</label>
</#if>

<script type="text/javascript" charset="GBK">
    function turnToAccept() {
        $('#inputForm').attr("action", "task!accept.action");
        $('#inputForm').submit();
    }
    function turnToRefuse() {
        $('#inputForm').attr("action", "task!refuse.action");
        $('#inputForm').submit();
    }
    function turnToComplete() {
        $('#inputForm').attr("action", "task!complete.action");
        $('#inputForm').submit();
    }
    function turnToPostpone() {
        $('#inputForm').attr("action", "task!postpone.action");
        $('#inputForm').submit();
    }
    function turnToClosed() {
        $('#inputForm').attr("action", "task!closed.action");
        $('#inputForm').submit();
    }
</script>