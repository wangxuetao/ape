<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>阿猿简历-程序员求职简历-大猿软件</title>
<link rel="shortcut icon" href="${cp }/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${cp}/css/reg/reg.css">
<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

</head>
<body>

<div class="logo_box">
	<h3>阿猿简历</h3>

	
	<form action="#" name="f" method="post">
		<!--
		<div class="input_outer">
			<span class="u_email"></span>
			<input name="email" id="email" class="text" placeholder="邮箱" value="${email }" style="color: #FFFFFF !important" type="text">
		</div>
		<div class="input_outer">
			<span class="us_uer"></span>
			<input name="password" id="password" placeholder="密码" value="${password }" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" type="password">
		</div>
		-->
		<div class="mb2"><a class="act-but submit" href="javascript:;" onclick="wxLogin();" style="color: #FFFFFF">微信登录</a></div>

		<!--
		<input id="remberPwd" name="remberPwd" value="true" class="checkbox" type="checkbox" checked="checked"><span>记住用户名</span>
		-->
	</form>
	
	<div class="logins">

	</div>

	
	<div class="sas">
		<!--
		<a href="${cp }/user/toRegister.do">注册</a>
		-->
		<h4>程序员求职简历，技术人员的简历</h4>
	</div>
	
	<div class="sas">
	</div>
</div>
</body>

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery-validate.min.js"></script>
<script type="text/javascript" src="${cp}/js/messages_zh.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>

<script type="text/javascript">

function wxLogin() {
	var remberPwd = $("input[type='checkbox']").is(':checked');
	
	$.ajax({
	    url:'${cp }/wxAuthen/wxLogin.do',
	    type:'POST', //GET
	    data:{
	    },
	    timeout:5000,
	    dataType:'json',
	    success:function(data){
	    	
	    	if (data.success) {
		    	window.location.href=data.data;
	    	} else {
				dy.alert(data.message);
	    	}
	    },
	    error:function(xhr,textStatus){
	        console.log('错误')
	        console.log(xhr)
	        console.log(textStatus)
	    },
	    complete:function(){
	        console.log('结束')
	    }
	});
}

function login() {
	var remberPwd = $("input[type='checkbox']").is(':checked');
	
	$.ajax({
	    url:'${cp }/user/login.do',
	    type:'POST', //GET
	    async:false,
	    data:{
	    	email : $('#email').val(),
	    	password : $('#password').val(),
	    	remberPwd : remberPwd
	    	
	    },
	    timeout:5000,
	    dataType:'json',
	    success:function(data){
	    	
	    	if (data.success) {
		    	window.location.href="/";
	    	} else {
				dy.alert(data.message);
	    	}
	    },
	    error:function(xhr,textStatus){
	        console.log('错误')
	        console.log(xhr)
	        console.log(textStatus)
	    },
	    complete:function(){
	        console.log('结束')
	    }
	});
}

</script>

</html>