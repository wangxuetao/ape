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
			<li class="user_info"><span> 手机：</span>
				<c:if test="${empty user.phone}">未填写</c:if>
				<c:if test="${not empty user.phone}">${user.phone}</c:if>
			</li>
			<li class="user_info"><span> QQ：</span>
				<c:if test="${empty user.qq}">未填写</c:if>
				<c:if test="${not empty user.qq}">${user.qq}</c:if>
			</li>
			<li class="user_info"><span> 微信：</span>
				<c:if test="${empty user.wx}">未填写</c:if>
				<c:if test="${not empty user.wx}">${user.wx}</c:if>
			</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span> 手机：</span><input type="text" placeholder="手机号码" id="phone" name="phone" value="${user.phone}"></li>
			<li class="user_info"><span> QQ：</span><input type="text" placeholder="QQ号" id="qq" name="qq" value="${user.qq}"></li>
			<li class="user_info"><span> 微信：</span><input type="text" placeholder="微信号" id="wx" name="wx" value="${user.wx}"></li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveContact();"></li>
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
				phone : {
					minlength : 0,
					maxlength : 11
				},

				wx : {
					minlength : 0,
					maxlength : 20
				},

				qq : {
					minlength : 0,
					maxlength : 20
				}
			},
			messages : {
				phone : {
					minlength : "用户名长度11",
					maxlength : "用户名长度11"
				},

				wx : {
					minlength : "微信号长度3-20",
					maxlength : "微信号长度3-20"
				},

				qq : {
					minlength : "QQ号长度3-20",
					maxlength : "QQ号长度3-20"
				}
			}
		});
	}

	function saveContact() {
		var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp }/consumer/contact.do',
			type : 'POST', //GET
			async : false,
			data : {
				phone : $('#phone').val(),
				qq : $('#qq').val(),
				wx : $('#wx').val()
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