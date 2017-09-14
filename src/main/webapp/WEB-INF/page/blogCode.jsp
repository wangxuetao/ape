<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css?vs3" type="text/css">
<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery-validate.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${cp}/js/messages_zh.js"></script>
<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>

<div class="register" id="viewDiv">
	<form id="">
		<ul class="register_box">
			<li class="user_info"><span><b></b> 代码库地址：</span>
			<c:if test="${empty user.codeUrl}">未填写</c:if>
			<c:if test="${not empty user.codeUrl}">${user.codeUrl}</c:if>
			</li>
			<li class="user_info"><span><b></b> 博客地址：</span>
			<c:if test="${empty user.blogUrl}">未填写</c:if>
			<c:if test="${not empty user.blogUrl}">${user.blogUrl}</c:if>
			</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span><b></b> 代码库地址：</span><input type="text" placeholder="例如：github地址" id="codeUrl" name="codeUrl" value="${user.codeUrl}"></li>
			<li class="user_info"><span><b></b> 博客地址：</span><input type="text" placeholder="你的博客地址" id="blogUrl" name="blogUrl" value="${user.blogUrl}"></li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveBlogCode();"></li>
		</ul>
	</form>
</div>

<script type="text/javascript">

	function saveBlogCode() {
		$.ajax({
			url : '${cp }/consumer/saveBlogCode.do',
			type : 'POST',
			async : false,
			data : {
				codeUrl : $('#codeUrl').val(),
				blogUrl : $('#blogUrl').val()
			},
			timeout : 5000,
			dataType : 'json',
			success : function(data) {
				if (!data.success) {
					dy.alert(data.message);
					return false;
				}
				
				dy.refresh();
			},
			error : function(xhr, textStatus) {
				console.log('错误')
				console.log(xhr)
				console.log(textStatus)
			},
			complete : function() {
				console.log('结束')
			}
		});
	}
</script>