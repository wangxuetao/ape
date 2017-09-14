<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css?v1" type="text/css">
<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery-validate.min.js"></script>
<script type="text/javascript" src="${cp}/js/messages_zh.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>

<div class="register" id="viewDiv">
	<form>
		<ul class="register_box">
			<li class="user_info"><span> 技能描述：</span>
			<c:if test="${empty skillDesc}">未填写</c:if>
				<c:if test="${not empty skillDesc}">${skillDesc}</c:if>
				
			</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span> <b>*</b> 技能描述：</span>
			<textarea style="height:200px;width:300px;" id="skillDesc" name="skillDesc">${skillDescEdit}</textarea>
			</li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveSkillDesc();"></li>
		</ul>
	</form>
</div>

<script type="text/javascript">

$(document).ready(function(){
	initValidata();
});

function initValidata() {
	$("#registForm").validate({
		rules : {
			skillDesc : {
				required : true,
				minlength : 10,
				maxlength : 700
			},
		},
		messages : {
			skillDesc : {
				required : "请输入技能描述",
				minlength : "字数在10~700字之间",
				maxlength : "内容在10~700字之间"
			},
		}
	});
}

function saveSkillDesc(){
	var flag = $("#registForm").valid();
	if (!flag) {
		return false;
	}
	
	$.ajax({
		url : '${cp}/userInfo/saveSkillDesc.do',
		type : 'POST',
		async : false,
		data : {
			skillDesc : $('#skillDesc').val()
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