<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="${cp }/images/favicon.ico" />
	<title>大猿人才电子简历</title>
</head>
</html>
<h1>出了点意外，重新操作一次</h1>
<h2>错误信息：${error }</h2>