<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css?v" type="text/css">
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
			<li class="user_info"><span> 简历域名：</span>
				<c:if test="${empty user.hackDomain}">未填写</c:if>
				<c:if test="${not empty user.hackDomain}"><a href="http://ape.dayuanit.com/cv/${user.hackDomain}" target="_blank">http://ape.dayuanit.com/cv/${user.hackDomain}</a> </c:if>
				</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span><b>*</b> 简历域名</span></li>
			<li class="user_info"><span> http://ape.dayuanit.com/cv/</span><input type="text" placeholder="wangxuetao" id="hackDomain" name="hackDomain" value="${user.hackDomain}"></li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveHackDomain();"></li>
		</ul>
	</form>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		initValidata();
	});
	
	function initValidata() {
		$("#registForm").validate({
			rules : {
				hackDomain : {
					required : true,
					minlength : 1,
					maxlength : 20
				},
			},
			messages : {
				hackDomain : {
					required : "请输入简历域名",
					minlength : "域名长度1-20",
					maxlength : "域名长度1-20"
				},
			}
		});
	}

	function saveHackDomain() {
		var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp }/consumer/hackDomain.do',
			type : 'POST', //GET
			async : false,
			data : {
				hackDomain : $('#hackDomain').val()
			},
			timeout : 5000, //超时时间
			dataType : 'json', //返回的数据格式：json/xml/html/script/jsonp/text
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