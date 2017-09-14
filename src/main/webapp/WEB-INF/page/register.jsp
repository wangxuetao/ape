<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>程序员电子简历-大猿软件</title>
<link rel="shortcut icon" href="${cp }/images/favicon.ico" />

<link rel="stylesheet" type="text/css" href="${cp}/css/reg/reg.css">
<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery-validate.min.js"></script>
<script type="text/javascript" src="${cp}/js/messages_zh.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>

</head>
<body>

<div class="logo_box">
	<h3>注册</h3>
	<form id="registForm" action="#" name="f" method="post">
		<div class="input_outer">
			<span class="u_email"></span>
			<input name="email" id="email" class="text" placeholder="邮箱" style="color: #FFFFFF !important" type="text">
		</div>
		<div class="input_outer">
			<span class="us_uer"></span>
			<input name="password" id="password" placeholder="密码"  class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" type="password">
		</div>
		<div class="input_outer">
			<span class="us_uer"></span>
			<input name="confirmPassword" id="confirmPassword" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" placeholder="确认密码" type="password">
		</div>
		<div class="input_outer">
			<span class="u_code"></span>
			<input name="inviteCode" id="inviteCode" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" placeholder="邀请码" type="text">
		</div>
		<div class="mb2"><a class="act-but submit" href="javascript:;" style="color: #FFFFFF" onclick="regist();">注册</a></div>
	</form>
	
	<div class="logins">
	</div>
	<div class="sas">
		<a href="${cp }/user/toLogin.do">登录</a>
	</div>
	<div class="sas">
	</div>
</div>

</body>

<script type="text/javascript" >

$(document).ready(function() {
		$("#registForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},

				password : {
					required : true,
					minlength : 6,
					maxlength : 16
				},

				confirmPassword : {
					required : true,
					minlength : 6,
					maxlength : 16
				},
				
				inviteCode : {
					required : true,
					minlength : 6,
					maxlength : 6
				}

			},
			messages : {
				email : "请输入邮箱地址",

				password : {
					required : "请输入密码",
					minlength : "密码长度6-16",
					maxlength : "密码长度6-16"
				},

				confirmPassword :  {
					required : "请输入密码",
					minlength : "密码长度6-16",
					maxlength : "密码长度6-16"
				},
				
				inviteCode : {
					required : "请输入邀请码",
					minlength : "邀请码长度6",
					maxlength : "邀请码长度6"
				}

			}
		});

	});

	function regist() {
		var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp }/consumer/register.do',
			type : 'POST',
			async : false,
			data : {
				email : $('#email').val(),
				password : $('#password').val(),
				confirmPassword : $('#confirmPassword').val(),
				inviteCode : $('#inviteCode').val()
			},
			timeout : 5000,
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					window.location.href='${cp }/user/toLogin.do';
				} else {
					dy.alert(data.message);
				}
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
</html>
