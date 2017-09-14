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

<div id="viewDiv" class="register">
	<form>
		<ul class="register_box">
			<li class="user_info" id="aboutMeLi"><span> 自我描述：</span>
			<c:if test="${empty aboutMe}">未填写</c:if>
			<c:if test="${not empty aboutMe}">${aboutMe}</c:if>
			</li>
			<li class="user_info"><span> </span>
			<input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'>
			</li>
		</ul>
	</form>
</div>

<div id="editDiv" style="display: none;" class="register">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span> 自我描述：</span>
			<textarea style="height:200px;width:300px;"  id="aboutme" name="aboutme">${aboutMeEdit}</textarea>
			</li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveAboutme();"></li>
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
			aboutme : {
				required : true,
				minlength : 10,
				maxlength : 700
			},

		},
		messages : {
			aboutme : {
				required : "请输入内容",
				minlength : "10~700字之间",
				maxlength : "10~700字之间"
			},

		}
	});
}

    function saveAboutme(){
    	var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp}/userInfo/saveAboutMe.do',
			type : 'POST',
			async : false,
			data : {
				aboutMe : $('#aboutme').val()
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