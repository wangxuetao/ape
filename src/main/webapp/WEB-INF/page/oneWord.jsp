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
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span> 个性签名：</span>
				<c:if test="${empty info.oneWord}">未填写</c:if>
				<c:if test="${not empty info.oneWord}">${info.oneWord}</c:if>
			</li>
			<li class="user_info"><span> </span><input type="button" value="编辑" class="submit_btn" onclick='dy.show("editDiv", "viewDiv");'></li>
		</ul>
	</form>
</div>

<div class="register" id="editDiv" style="display: none;">
	<form id="registForm">
		<ul class="register_box">
			<li class="user_info"><span><b>*</b> 个性签名：</span>
			<input id="oneWord" name="oneWord" class="easyui-textbox" data-options="multiline:true" value="${info.oneWord}" style="width:300px;height:100px">
			</li>
			<li class="user_info"><span> </span><input type="button" value="保存" class="submit_btn" onclick="saveOneWord();"></li>
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
				oneWord : {
					required : true,
					minlength : 5,
					maxlength : 60
				}
			},
			messages : {
				oneWord : {
					required : "请输入个性签名",
					minlength : "个性签名长度5-60",
					maxlength : "个性签名长度5-60"
				}

			}
		});
	}

	function saveOneWord() {
		var flag = $("#registForm").valid();
		if (!flag) {
			return false;
		}
		
		$.ajax({
			url : '${cp }/consumer/oneWord.do',
			type : 'POST', //GET
			async : false,
			data : {
				oneWord : $('#oneWord').val()
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