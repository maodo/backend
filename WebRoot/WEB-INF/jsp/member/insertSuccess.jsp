<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tags.jsp"%>
<center>
 <div>
  	<table class="login">
  		<tr>
  			<td align="center">
				<h1><spring:message code="text.insert.user.success" arguments="${account}, ${password}"/></h1>
			</td>
		</tr>
		<tr>
  			<td align="center">
				<input type="button" onClick="add('<c:url value="docmem.htm?act=list"/>')" value="<spring:message code="text.back.list"/>">&nbsp;&nbsp;
				<input type="button" onClick="add('<c:url value="docmem.htm?act=insert"/>')" value="<spring:message code="text.readd"/>">
			</td>
		</tr>
	</table>
</div>
</center>