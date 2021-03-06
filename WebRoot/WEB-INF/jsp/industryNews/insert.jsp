<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tags.jsp"%>
<script src="<c:url value="js/jscal2.js"/>"></script> 
<script src="<c:url value="js/lang/en.js"/>"></script> 
<script src="<c:url value="js/nicEdit.js"/>" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="css/jscal2.css"/>" /> 
<link rel="stylesheet" type="text/css" href="<c:url value="css/border-radius.css"/>" /> 
<link rel="stylesheet" type="text/css" href="<c:url value="css/steel/steel.css"/>" /> 
<script type="text/javascript">
$(document).ready(function() {
	$('#first_input').focus();
	$('.need').addClass('required');
	$('#result').html('${subCategory}');
	new nicEditor({fullPanel : true, maxHeight : 100}).panelInstance('contentTW');
	new nicEditor({fullPanel : true, maxHeight : 100}).panelInstance('contentEN');
	new nicEditor({fullPanel : true, maxHeight : 100}).panelInstance('contentCN');
	new nicEditor({fullPanel : true, maxHeight : 100}).panelInstance('contentJP');
});
</script>
<center>
  <form name="industryNewsEditForm" method="POST" enctype="multipart/form-data" action="<c:url value="industryNews.htm?act=doInsert"/>">
  <div class="login_L">
  	<table style="width:800px">
  		<tr>
  			<spring:bind path="command.description">
  			<td class="label"><spring:message code="industry.news.description"/></td>
  			<td class="field"><input type="text" name="description" value="${status.value}" size="70" id="first_input"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.url">
  			<td class="label"><spring:message code="industry.news.url"/></td>
  			<td class="field"><input type="text" name="url" value="${status.value}" size="100" id="first_input"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.source">
  			<td class="label"><spring:message code="industry.news.source"/></td>
  			<td class="field"><input type="text" name="source" value="${status.value}" size="70" id="source"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.industryNewsCategoryId">
  			<td class="label"><spring:message code="industry.news.category"/></td>
  			<td class="field">
  				<select name="industryNewsCategoryId" id="industryNewsCategoryId">
	  				<c:forEach var="incvo" items="${incvos}" varStatus="status">
	  					<option value="${incvo.id}">${incvo.description}</option>
	  				</c:forEach>
  				</select>
  			</td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>
  		<tr>	
  			<spring:bind path="command.publishDate">
  			<td class="label"><spring:message code="industry.news.publish.date"/></td>
  			<td class="field">
 				<input type="text" name="publishDate" id="publishDate" size="10" value="${status.value}" readonly/><button type="button" id="btn_publish">...</button>
		    	<script type="text/javascript">//<![CDATA[
		      		Calendar.setup({
		        		inputField : "publishDate",
		        		trigger    : "btn_publish",
		        		onSelect   : function() { this.hide() },
		        		showTime   : false,
		        		dateFormat : "%Y-%m-%d"
		      		});
		    	//]]></script>
		  	</td>
		  	<td>${status.errorMessage}</td>
			</spring:bind>
  		</tr>
  		<tr>	
  			<spring:bind path="command.shelveDate">
  			<td class="label"><spring:message code="industry.news.shelve.date"/></td>
  			<td class="field">
 				<input type="text" name="shelveDate" id="shelveDate" size="10" value="${status.value}" readonly/><button type="button" id="btn_shelve">...</button>
		    	<script type="text/javascript">//<![CDATA[
		      		Calendar.setup({
		        		inputField : "shelveDate",
		        		trigger    : "btn_shelve",
		        		onSelect   : function() { this.hide() },
		        		showTime   : false,
		        		dateFormat : "%Y-%m-%d"
		      		});
		    	//]]></script>
		  	</td>
		  	<td>${status.errorMessage}</td>
			</spring:bind>
  		</tr>
  		<tr>	
  			<spring:bind path="command.unshelveDate">
  			<td class="label"><spring:message code="industry.news.unshelve.date"/></td>
  			<td class="field">
 				<input type="text" name="unshelveDate" id="unshelveDate" size="10" value="${status.value}" readonly/><button type="button" id="btn_unshelve">...</button>
		    	<script type="text/javascript">//<![CDATA[
		      		Calendar.setup({
		        		inputField : "unshelveDate",
		        		trigger    : "btn_unshelve",
		        		onSelect   : function() { this.hide() },
		        		showTime   : false,
		        		dateFormat : "%Y-%m-%d"
		      		});
		    	//]]></script>
		  	</td>
		  	<td>${status.errorMessage}</td>
			</spring:bind>
  		</tr>
  		<tr>
  			<spring:bind path="command.showPlace">
  			<td class="label"><spring:message code="industry.news.show.place"/></td>
  			<td class="field">
  				<input type="radio" name="showPlace" value="Y"/><spring:message code="industry.news.inner"/>&nbsp;&nbsp;
  				<input type="radio" name="showPlace" value="N" checked/><spring:message code="industry.news.outter"/>
  			</td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>  	
  		<tr>
  			<spring:bind path="command.photo">
  			<td class="label"><spring:message code="industry.news.photo"/></td>
  			<td class="field"><input type="file" name="photo" class="required"/></td>
  			<td>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>  	
  		
  		</table>
  	</div>
  	<br/>
  	<div class="login_L">
  	<!-- 正體中文 -->
  		<table style="width:800px">
  		<tr>
  			<td colspan="2" class="column"><spring:message code="text.nameTW"/></td>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.visible"/></td>
  			<spring:bind path="command.visibleTW">
  			<td>
  				<input type="radio" name="visibleTW" value="Y" checked/><spring:message code="text.yes"/>
  				<input type="radio" name="visibleTW" value="N"/><spring:message code="text.no"/>
  			</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.topic"/></td>
  			<spring:bind path="command.topicTW">
  			<td><input type="text" name="topicTW" value="${status.value}" size="70"/>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="industry.news.content"/></td>
  			<spring:bind path="command.contentTW">
  			<td>
  				<textarea name="contentTW" id="contentTW" style="width:700px; height:100px;">${status.value}</textarea>
  			</td>
  			</spring:bind>
  		</tr>
  		</table>
  		
  		<hr style="width:600px"/>
  		<!-- 簡體中文 -->
  		<table style="width:800px">
  		<tr>
  			<td colspan="2" class="column"><spring:message code="text.nameCN"/></td>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.visible"/></td>
  			<spring:bind path="command.visibleCN">
  			<td>
  				<input type="radio" name="visibleCN" value="Y" checked/><spring:message code="text.yes"/>
  				<input type="radio" name="visibleCN" value="N"/><spring:message code="text.no"/>
  			</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.topic"/></td>
  			<spring:bind path="command.topicCN">
  			<td><input type="text" name="topicCN" value="${status.value}" size="70"/>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="industry.news.content"/></td>
  			<spring:bind path="command.contentCN">
  			<td>
  				<textarea name="contentCN" id="contentCN" style="width:700px; height:100px;">${status.value}</textarea>
  			</td>
  			</spring:bind>
  		</tr>
  		</table>
  		<hr style="width:600px"/>
  		<!-- 英文 -->
  		<table style="width:800px">
  		<tr>
  			<td colspan="2" class="column"><spring:message code="text.nameEN"/></td>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.visible"/></td>
  			<spring:bind path="command.visibleEN">
  			<td>
  				<input type="radio" name="visibleEN" value="Y" checked/><spring:message code="text.yes"/>
  				<input type="radio" name="visibleEN" value="N"/><spring:message code="text.no"/>
  			</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.topic"/></td>
  			<spring:bind path="command.topicEN">
  			<td><input type="text" name="topicEN" value="${status.value}" size="70"/>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="industry.news.content"/></td>
  			<spring:bind path="command.contentEN">
  			<td>
  				<textarea name="contentEN" id="contentEN" style="width:700px; height:100px;">${status.value}</textarea>
  			</td>
  			</spring:bind>
  		</tr>
  		</table>
  		<hr style="width:600px"/>
  		<!-- 日文 -->
  		<table style="width:800px">
  		<tr>
  			<td colspan="2" class="column"><spring:message code="text.nameJP"/></td>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.visible"/></td>
  			<spring:bind path="command.visibleJP">
  			<td>
  				<input type="radio" name="visibleJP" value="Y" checked/><spring:message code="text.yes"/>
  				<input type="radio" name="visibleJP" value="N"/><spring:message code="text.no"/>
  			</td>
  			</spring:bind>
  		</tr>
  		<tr>
  			<td class="label"><spring:message code="industry.news.topic"/></td>
  			<spring:bind path="command.topicJP">
  			<td><input type="text" name="topicJP" value="${status.value}" size="70"/>${status.errorMessage}</td>
  			</spring:bind>
  		</tr>	
  		<tr>
  			<td class="label"><spring:message code="industry.news.content"/></td>
  			<spring:bind path="command.contentJP">
  			<td>
  				<textarea name="contentJP" id="contentJP" style="width:700px; height:100px;">${status.value}</textarea>
  			</td>
  			</spring:bind>
  		</tr>
  		</table>
  	</div>
  		<br/>
  		<table>
  			<tr>
				<td align="right">
					<spring:bind path="command.industryNewsId">
  						<input type="hidden" name="industryNewsId" value="${status.value}"/>
  					</spring:bind>
					<input type="submit" value="<spring:message code="text.dirty"/>">
					<input type="button" value="<spring:message code="text.back"/>" onClick="window.history.back()">
				</td>
			</tr>
  		</table>
  </form>
</center>
