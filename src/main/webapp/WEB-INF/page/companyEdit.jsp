<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css?v5" type="text/css">
<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery-validate.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${cp}/js/messages_zh.js"></script>
<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>

<div id="saveDiv">
	<div class="register">
		<form id="registForm">
			<ul class="register_box">
				<li class="user_info"><span><b>*</b> 公司名称：</span><input type="text" placeholder="公司名称" id="companyName" name="companyName" value="${ company.companyName}"></li>
				<li class="user_info"><span><b>*</b> 职位：</span><input type="text" placeholder="职位" id="position" name="position" value="${ company.position}"></li>
				<li class="user_info"><span><b>*</b> 入职时间：</span><input type="text" placeholder="2015-06-07" id="startTime" name="startTime" value="${ company.startTime}"></li>
				<li class="user_info"><span> 离职时间：</span><input type="text" placeholder="不填则为在职" id="endTime" name="endTime" value="${ company.endTime}"></li>
				<li class="user_info"><span><b>*</b> 工作内容：</span>
				<textarea style="height:200px;width:300px;" id="postDesc" name="postDesc" >${company.postDesc}</textarea>
				</li>
				<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick='editUserCompany();'></li>
			</ul>
		</form>
	</div>
</div>

<script type="text/javascript">

var companyId = "${company.id}";
$(document).ready(function(){
    initAddCompany();
});

function editUserCompany(){
	var flag = $("#registForm").valid();
	if (!flag) {
		return false;
	}
	
	$.ajax({
		url : '${cp}/userCompany/editUserCompany.do',
		type : 'POST',
		async : false,
		data : {
			companyName : $("#companyName").val(),
			position : $("#position").val(),
			startTime : $("#startTime").val(),
			endTime : $("#endTime").val(),
			postDesc : $("#postDesc").val(),
			userCompanyId : companyId
		},
		timeout : 5000,
		dataType : 'json',
		success : function(data) {
			if (!data.success) {
				dy.alert(data.message);
				return false;
			}
			
			dy.refresh("/user/toCompanyExpress.do?#cid" + companyId);
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

function initValidata(){
	$("#registForm").validate({
		rules : {
			companyName : {
				required : true,
				minlength : 2,
				maxlength : 30
			},

			position : {
				required : true,
				minlength : 3,
				maxlength : 30
			},

			startTime : {
				required : true,
				minlength : 10,
				maxlength : 10
			},

			postDesc : {
				required : true,
				minlength : 10,
				maxlength : 700
			}

		},
		messages : {
			companyName : {
				required : "请输入公司名",
				minlength : "公司名长度长度5-30",
				maxlength : "公司名长度长度5-30"
			},

			position : {
				required : "请输入职位",
				minlength : "职位长度3-30",
				maxlength : "职位长度3-30"
			},

			startTime : {
				required : "请填写入职时间",
				minlength : "时间格式不正确",
				maxlength : "时间格式不正确"
            
			},
			
			postDesc : {
				required : "请输入职位描述",
				minlength : "职位描述长度10-700",
				maxlength : "职位描述长度10-700"
		   }
		}
	});
}

</script>
