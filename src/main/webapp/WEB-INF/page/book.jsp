<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/easyui.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>

<div class="register">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span> 书名：</span>
			<input class="easyui-textbox" data-options="multiline:true" value="" style="width:300px;height:100px">
			</li>
			<li class="submit"><input type="submit" value="保存" class="submit_btn"></li>
		</ul>
	</form>
	
</div>