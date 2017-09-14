<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	<form id="registFormView">
		<ul class="register_box">
			<li class="user_info"><span><b></b> 真实姓名：</span>
			<c:if test="${empty user.realName}">未填写</c:if>
			<c:if test="${not empty user.realName}">${user.realName}</c:if>
			</li>
			<li class="user_info"><span><b></b> 邮箱：</span>
			<c:if test="${empty user.email}">未填写</c:if>
			<c:if test="${not empty user.email}">${user.email}</c:if>
			</li>
			<li class="user_info"><span><b></b> 性别：</span>
			<c:if test="${empty user.sexValue}">未填写</c:if>
			<c:if test="${not empty user.sexValue}">${user.sexValue}</c:if>
			</li>
			<li class="user_info"><span> 生日：</span>
			<c:if test="${empty user.birthday}">未填写</c:if>
			<c:if test="${not empty user.birthday}">${user.birthday}</c:if>
			</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span><b>*</b> 真实姓名：</span><input type="text" placeholder="真实姓名" id="realName" name="realName" value="${user.realName}"></li>
			
			<li class="user_info"><span><b>*</b> 邮箱：</span><input type="text" placeholder="邮箱" id="email" name="email" value="${user.email}"></li>

			<li class="user_info"><span><b>*</b> 性别：</span>
				<select id="sex">
					<option value="M">男</option>
					<option value="F">女</option>
				</select>
			</li>
			<li class="user_info"><span> 生日：</span><input type="text" placeholder="1980-10-24" id="birthday" name="birthday" value="${user.birthday}"></li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveBaseInfo();"></li>
		</ul>
	</form>
</div>

<script type="text/javascript">
	
	var sex = "${user.sex}";

	$(document).ready(function() {
		$("#sex").val(sex);
		initValidata();
	});
	
	function initValidata() {
		$("#registForm").validate({
			rules : {
				realName : {
					required : true,
					minlength : 1,
					maxlength : 10
				},

				email : {
					required : true,
					minlength : 5,
					maxlength : 30
				},

				sex : "required",

				birthday : {
					required : true,
					minlength : 10,
					maxlength : 10
				}

			},
			messages : {
				realName : {
					required : "请输入用户名",
					minlength : "用户名长度1-5",
					maxlength : "用户名长度1-5"
				},

				email : {
					required : "请输入邮箱",
					minlength : "用户名长度5-30",
					maxlength : "用户名长度5-30"
				},
				
				sex : "请选择性别",

				birthday : "请输入生日"

			}
		});
	}

	function saveBaseInfo() {
		var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp }/consumer/baseInfo.do',
			type : 'POST',
			async : false,
			data : {
				realName : $('#realName').val(),
				sex : $('#sex').val(),
				birthday : $('#birthday').val(),
				email : $('#email').val()
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