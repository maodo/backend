<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tags.jsp"%>
<!-- JSTL START -->
<c:set var="parentCategory"/>
<c:forEach items="${parent}" var="p">
<c:set var="groupId"><spring:message code="text.unknow"/></c:set>
	<c:if test="${p.categoryGroupId eq 1}">
		<c:set var="groupId"><spring:message code="text.nonLoginUser"/></c:set>
	</c:if>
	<c:if test="${p.categoryGroupId eq 3}">
		<c:set var="groupId"><spring:message code="text.media"/></c:set>
	</c:if>
	<c:if test="${p.categoryGroupId eq 5}">
		<c:set var="groupId"><spring:message code="text.loginUser"/></c:set>
	</c:if>
	<c:if test="${p.categoryGroupId eq 10}">
		<c:set var="groupId"><spring:message code="text.projectUser"/></c:set>
	</c:if>
	<c:set var="parentCategory">
		${parentCategory}<option value="${p.id}">${p.description}(${groupId})</option>
	</c:set>
</c:forEach>

<c:set var="subCategory">
	<select name="documentCategoryId">
</c:set>
<c:forEach items="${sub}" var="s">
	<c:set var="groupId"><spring:message code="text.unknow"/></c:set>
	<c:if test="${s.categoryGroupId eq 1}">
		<c:set var="groupId"><spring:message code="text.nonLoginUser"/></c:set>
	</c:if>
	<c:if test="${s.categoryGroupId eq 3}">
		<c:set var="groupId"><spring:message code="text.media"/></c:set>
	</c:if>
	<c:if test="${s.categoryGroupId eq 5}">
		<c:set var="groupId"><spring:message code="text.loginUser"/></c:set>
	</c:if>
	<c:if test="${s.categoryGroupId eq 10}">
		<c:set var="groupId"><spring:message code="text.projectUser"/></c:set>
	</c:if>
	<c:set var="subCategory">
		${subCategory}<option value="${s.id}">${s.description}(${groupId})</option>
	</c:set>
</c:forEach>


<!-- JSTL END -->
<script type='text/javascript' src='<c:url value="dwr/interface/dwrUtil.js"/>'></script>
<script type='text/javascript' src='<c:url value="dwr/engine.js"/>'></script>
<script type='text/javascript' src='<c:url value="dwr/util.js"/>'></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#first_input').focus();
	$('.need').addClass('required');
	$('#result').html('${subCategory}');
});

function getCategory() {
	var parentId = document.getElementById('parentId').value;
    dwrUtil.getCategory(parentId, function(ret){
        if (ret == '0') {
            alert("<spring:message code="text.no.subcategory"/>");
        } else {
        	document.getElementById("result").innerHTML = ret;
        }
    });
}

function callback(msg) {
	DWRUtil.setValue('result', msg);
}
</script>
<center>
  <form name="documentEditForm" method="POST" enctype="multipart/form-data" action="<c:url value="doc.htm?act=doInsert"/>">
  <div class="login">
  	<table>
  		<tr>
  			<spring:bind path="command.description">
  			<td class="label"><spring:message code="text.en.description"/></td>
  			<td class="field"><input type="text" name="description" value="${status.value}" size="50" id="first_input"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.parentId">
  			<td class="label"><spring:message code="text.en.parentId"/></td>
  			<td class="field">
  				<select name="parentId" id="parentId" onChange="getCategory()">
  					${parentCategory}
  				</select>
  			</td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.documentCategoryId">
  			<td class="label"><spring:message code="text.en.documentCategoryId"/></td>
  			<td class="field"><div id="result"></div></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.attachment">
  			<td class="label"><spring:message code="text.en.attachment"/></td>
  			<td class="field"><input type="file" name="attachment"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.issuuId">
  			<td class="label"><spring:message code="text.en.issuu"/></td>
  			<td class="field"><input type="text" name="issuuId" value="${status.value}"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<spring:bind path="command.groupIds">
  			<td class="label"><spring:message code="text.groupIds"/></td>
  			<td class="field"><input type="text" name="groupIds" value="${status.value}"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		</table>
  	</div>
  	<br/>
  	<div class="login">
  		<table>
  		<tr>
  			<td class="column">&nbsp;</td>
  			<td class="column" align="center"><spring:message code="text.en.topic"/></td>
  			<td class="column" align="center"><spring:message code="text.en.source"/></td>
  			<td class="column" align="center"><spring:message code="text.en.visible"/></td>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="text.nameTW"/></td>
  			<spring:bind path="command.topicTW">
  			<td><input type="text" name="topicTW"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.sourceTW">
  			<td><input type="text" name="sourceTW"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.visibleTW">
  			<td>
  				<input type="radio" name="visibleTW"  value="Y"/>Y
  				<input type="radio" name="visibleTW"  value="N" checked/>N
  			</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="text.nameEN"/></td>
  			<spring:bind path="command.topicEN">
  			<td><input type="text" name="topicEN"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.sourceEN">
  			<td><input type="text" name="sourceEN"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.visibleEN">
  			<td>
  				<input type="radio" name="visibleEN"  value="Y"/>Y
  				<input type="radio" name="visibleEN"  value="N" checked/>N
  			</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="text.nameCN"/></td>
  			<spring:bind path="command.topicCN">
  			<td><input type="text" name="topicCN"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.sourceCN">
  			<td><input type="text" name="sourceCN"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.visibleCN">
  			<td>
  				<input type="radio" name="visibleCN"  value="Y"/>Y
  				<input type="radio" name="visibleCN"  value="N" checked/>N
  			</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="text.nameJP"/></td>
  			<spring:bind path="command.topicJP">
  			<td><input type="text" name="topicJP"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.sourceJP">
  			<td><input type="text" name="sourceJP"  value="${status.value}"/>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.visibleJP">
  			<td>
  				<c:set var="checked_Y" value=""/>
  			    <c:set var="checked_N" value=""/>
  			    <c:choose>
	  			    <c:when test="${status.value == 'Y'}">
	  			    	<c:set var="checked_Y" value="checked"/>
	  			    </c:when>
	  			    <c:otherwise>
	  			    	<c:set var="checked_N" value="checked"/>
	  			    </c:otherwise>
  			    </c:choose>
  				<input type="radio" name="visibleJP"  value="Y"/>Y
  				<input type="radio" name="visibleJP"  value="N" checked/>N
  			</td>
  			</spring:bind>
  		</tr>	
  		</table>
  		</div>
  		<br/>
  		<div class="login">
  		<table>
  		<tr>
  			<spring:bind path="command.downloadable">
  			<td class="label"><spring:message code="text.downloadable"/></td>
  			<td>
  				<input type="radio" name="downloadable" value="Y" checked/><spring:message code="text.yes"/>
  				<input type="radio" name="downloadable" value="N"/><spring:message code="text.no"/>
  			</td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  			<spring:bind path="command.copyRight">
  			<td class="label"><spring:message code="text.copyRight"/></td>
  			<td>
  				<input type="radio" name="copyRight" value="Y" checked/><spring:message code="text.yes"/>
  				<input type="radio" name="copyRight" value="N"/><spring:message code="text.no"/>
  			</td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  			<tr>
  				<spring:bind path="command.documentId"><input type="hidden" name="documentId" value="${status.value}"/></spring:bind>
				<td colspan="6" align="right">
					<input type="submit" value="<spring:message code="text.submit"/>">
					<input type="button" value="<spring:message code="text.back"/>" onClick="window.history.back()">
				</td>
			</tr>
  		</table>
  		</div>
  </form>
</center>
