<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" href="${cp }/images/favicon.ico" />
		<title>阿猿简历-程序员求职简历-大猿软件</title>
		<link rel="stylesheet" type="text/css" href="${cp}/css/easyui.css">
		<link rel="stylesheet" type="text/css" href="${cp}/css/icon.css">
		<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">
		<link rel="stylesheet" type="text/css" href="${cp}/themes/default/easyui.css?xx">
		<link rel="stylesheet" type="text/css" href="${cp}/themes/icon.css?xx">
		<link rel="stylesheet" type="text/css" href="${cp}/css/demo.css">

		<script type="text/javascript" src="${cp}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${cp}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${cp}/js/dayuanit.js"></script>
	</head>
	
	<body style="text-align:center;">
	<h2></h2>
	<div style="margin:20px 0;"></div>
	<div class="easyui-layout" style="width:100%;height:550px;">
		<div data-options="region:'west',split:true" title="" style="width:15%;">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="${login_flag.nickName }" style="padding:10px;">
					<a href="/user/toBaseInfo.do" target="myFrameName">基本信息</a><br><br>
					<a href="user/toSchool.do" target="myFrameName">毕业院校</a><br><br>
					<a href="/user/toContact.do" target="myFrameName">联系方式</a><br><br>
					<a href="/user/toHackDomain.do" target="myFrameName">简历域名</a><br><br>
					<a href="/user/toOneWord.do" target="myFrameName">个性签名</a><br><br>
					<a href="/user/toAboutMe.do" target="myFrameName">自我介绍</a><br><br>
					<a href="/user/toSkill.do" target="myFrameName">技能描述</a><br><br>
					<a href="/user/toCompanyExpress.do" target="myFrameName">工作经历</a><br><br>
					<a href="/user/toBlogCode.do" target="myFrameName">博客代码库</a><br><br>
					<!--
					<a href="/user/toInviteCode.do" target="myFrameName">邀请码</a><br><br>
					-->
					
					<a href="javascript:void(0)" onclick="checkDomain();">预览简历</a><br><br>
					<a href="/user/logout.do" target="_blank">注销</a><br><br>
					<!-- 
					<a href="/user/toBook.do" target="myFrameName">书籍</a><br><br>
					 -->
				</div>
			</div>
		</div>
		<div data-options="region:'center',title:'编辑内容',iconCls:'icon-ok'" style="width:85%;">
			<iframe id="myFrameId" name="myFrameName" scrolling="auto" frameborder="0" style="width:100%;height:500px"></iframe>  
		</div>
	</div>
	
	<form id="preResumeForm" action="/resume/preview.do" method="get">
		
	</form>
	
	
</body>

  <br><br>
<div><p>© 2017 <a href="http://www.dayuanit.com" target="_blank">大猿软件</a> 苏 ICP 备 11059958号-5</p></div>

</html>


<script type="text/javascript">
function checkDomain() {
	$.ajax({
		url : '${cp }/resume/getHackDomain.do',
		type : 'POST',
		async : false,
		data : {
			schoolName : $('#schoolName').val(),
			graduTime : $('#graduTime').val(),
			degree : $('#degree').val(),
			major : $('#major').val()
		},
		timeout : 5000,
		dataType : 'json',
		success : function(data) {
			if (!data.success) {
				dy.alert(data.message);
				return false;
			}
			$('#preResumeForm').submit();
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