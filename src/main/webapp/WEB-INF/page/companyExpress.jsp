<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css?vs3" type="text/css">
<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery-validate.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${cp}/js/messages_zh.js"></script>
<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>

<div id="disCompany">
	<c:forEach items="${listCompany}" var="company">
		<a name="cid${company.id }" id="cid${company.id }"></a>
		<div class="register" id="viewDiv">
			<form>
				<ul class="register_box">
					<li class="user_info"><span> 公司名称：</span>
					<c:if test="${empty company.companyName}">未填写</c:if>
					<c:if test="${not empty company.companyName}">${ company.companyName}</c:if>
			</li>
					<li class="user_info"><span> 职位：</span>
					<c:if test="${empty company.position}">未填写</c:if>
					<c:if test="${not empty company.position}">${ company.position}</c:if>
					</li>
					<li class="user_info"><span> 入职时间：</span>
					<c:if test="${empty company.startTime}">未填写</c:if>
					<c:if test="${not empty company.startTime}">${ company.startTime}</c:if>
					</li>
					<li class="user_info"><span> 离职时间：</span>
					<c:if test="${empty company.endTime}">未填写</c:if>
					<c:if test="${not empty company.endTime}">${ company.endTime}</c:if>
					</li>
					<li class="user_info"><span> 工作内容：</span>
					<c:if test="${empty company.postDesc}">未填写</c:if>
					<c:if test="${not empty company.postDesc}">${ company.postDesc}</c:if>
					</li>
					<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='editCompany("${company.id}");'></li>
				</ul>
			</form>
		</div>
		
	</c:forEach>
	
	<div class="register_noborder">
		<form>
			<ul class="register_box">
				<li class="user_info"><span> </span><input type="button" value="添加工作经历" class="submit_btn" onclick='initSaveCompany();'></li>
			</ul>
		</form>
	</div>

</div>

<div id="saveDiv" style="display: none;">
	<div class="register">
		<form id="registForm">
			<ul class="register_box">
				<li class="user_info"><span><b>*</b> 公司名称：</span><input type="text" placeholder="公司名称" id="companyName" name="companyName"></li>
				<li class="user_info"><span><b>*</b> 职位：</span><input type="text" placeholder="职位" id="position" name="position"></li>
				<li class="user_info"><span><b>*</b> 入职时间：</span><input type="text" placeholder="2015-06-07" id="startTime" name="startTime"></li>
				<li class="user_info"><span> 离职时间：</span><input type="text" placeholder="不填则为在职" id="endTime" name="endTime"></li>
				<li class="user_info"><span><b>*</b> 工作内容：</span>
				<textarea style="height:200px;width:300px;" id="postDesc" name="postDesc"></textarea>
				</li>
				<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick='saveCompany();'></li>
			</ul>
		</form>
	</div>
</div>

<script type="text/javascript">
var userCompany = [];
var companyId = '';

$(document).ready(function(){
	initValidata();
});

function editCompany(cid) {
	dy.refresh("${cp}/user/toCompanyEdit.do?companyId=" + cid);
}

function initSaveCompany() {
	$("#companyName").val("");
	$("#position").val("");
	$("#startTime").val("");
	$("#endTime").val("");
	$("#postDesc").val("");
	dy.show("saveDiv", "disCompany");
}

function saveCompany(){
	var flag = $("#registForm").valid();
	if (!flag) {
		return false;
	}
	
	$.ajax({
		url : '${cp}/userCompany/addUserCompany.do',
		type : 'POST',
		async : false,
		data : {
			companyName : $("#companyName").val(),
			position : $("#position").val(),
			startTime : $("#startTime").val(),
			endTime : $("#endTime").val(),
			postDesc : $("#postDesc").val()
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

function confirmInfo(userCompanyId){   
	jQuery.messager.confirm('提示:','你确认要删除吗?',function(event){   
	if(event){   
		removeCompany(userCompanyId)   
	}else{   
	          
	}   
 });
	
}

function removeCompany(userCompanyId){
	$.ajax({
		url : '${cp}/userCompany/removeCompany.do',
		type : 'POST', //GET
		async : false,
		data : {
			companyId : userCompanyId
		},
		timeout : 5000, //超时时间
		dataType : 'json', //返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data) {
			
			if (data.success) {
				listCompanyE();	
			} else {
				$.messager.alert('错误信息',data.message);
				check();
				
			};
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
				minlength : "公司名长度长度3-30",
				maxlength : "公司名长度长度3-30"
			},

			position : {
				required : "请输入职位",
				minlength : "职位长度2-20",
				maxlength : "职位长度2-20"
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
