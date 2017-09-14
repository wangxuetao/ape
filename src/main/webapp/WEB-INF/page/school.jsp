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
	<form>
		<ul class="register_box">
			<li class="user_info"><span> 学校：</span>
				<c:if test="${empty user.schoolName}">未填写</c:if>
				<c:if test="${not empty user.schoolName}">${user.schoolName}</c:if>
			</li>
			<li class="user_info"><span> 专业：</span>
			<c:if test="${empty user.major}">未填写</c:if>
				<c:if test="${not empty user.major}">${user.major}</c:if>
				</li>
			<li class="user_info"><span> 毕业时间：</span>
			<c:if test="${empty user.graduTime}">未填写</c:if>
				<c:if test="${not empty user.graduTime}">${user.graduTime}</c:if>
				</li>
			<li class="user_info"><span> 学历：</span>
			<c:if test="${empty user.degreeValue}">未填写</c:if>
				<c:if test="${not empty user.degreeValue}">${user.degreeValue}</c:if>
				</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span> 学校：</span><input type="text" placeholder="大学校名" id="schoolName" name="schoolName" value="${user.schoolName}"></li>
			<li class="user_info"><span> 专业：</span><input type="text" placeholder="专业" id="major" name="major" value="${user.major}"></li>
			<li class="user_info"><span> 毕业时间：</span><input type="text" placeholder="2015-06-07" id="graduTime" name="graduTime" value="${user.graduTime}"></li>
			<li class="user_info"><span> 学历：</span>
				<select id="degree">
					<option value="1">本科</option>
					<option value="2">专科</option>
					<option value="3">研究生</option>
					<option value="4">博士</option>
				</select>
			</li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveEducation();"></li>
		</ul>
	</form>
</div>

<script type="text/javascript">
	var degree = "${user.degree}";

	$(document).ready(function() {
		$("#degree").val(degree);
		initValidata();
	});
	
	function initValidata() {
		$("#registForm").validate({
			rules : {
				schoolName : {
					required : true,
					minlength : 4,
					maxlength : 20
				},
				
				major : {
					required : true,
					minlength : 2,
					maxlength : 20
				},

				graduTime : {
					required : true,
					minlength : 10,
					maxlength : 10
				},

				degree : "required"
			},
			messages : {
				schoolName : {
					required : "请输入学校名",
					minlength : "长度4-20",
					maxlength : "长度4-20"
				},
				
				major : {
					required : "请输入专业",
					minlength : "长度2-20",
					maxlength : "长度2-20"
				},

				graduTime : {
					required : "请输入毕业时间",
					minlength : "长度10",
					maxlength : "长度10"
				},

				degree : "请输入学历"
			}
		});
	}

	function saveEducation() {
		var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp }/consumer/school.do',
			type : 'POST', //GET
			async : false,
			data : {
				schoolName : $('#schoolName').val(),
				graduTime : $('#graduTime').val(),
				degree : $('#degree').val(),
				major : $('#major').val()
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