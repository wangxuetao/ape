<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<link rel="stylesheet" href="${cp }/css/reset.css" type="text/css">
<link rel="stylesheet" href="${cp }/css/style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/easyui.css">
<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
<div class="register">
	<form id="registForm">
		<ul id = "inviteCodeDiv" class="register_box">
			
		</ul>
	</form>
	
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	check();
	
});

function check(){
	$.ajax({
		url : '${cp}/userInfo/listInviteCode.do',
		type : 'POST', //GET
		async : false,
		data : {
			
		},
		timeout : 5000, //超时时间
		dataType : 'json', //返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data) {
			var addHtml = '';
			if (data.success) {
				var result = data.data;
				   
			    addHtml +='<li class="user_info" ><span></span>'+result+'</span></li>'
			    addHtml +='<li class="user_info" ><span><b>*</b></span>请讲邀请码送与他人分享之</span></li>'
				$('#inviteCodeDiv').html(addHtml);
			} else {
				 addHtml += '<li class="user_info"><span><b>*</b> </span>邀请码已经全部使用。</li>'
				 $('#inviteCodeDiv').html(addHtml);
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