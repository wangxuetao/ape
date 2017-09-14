<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>
<%@ page isELIgnored="false"%>

<c:if test="${empty login_flag}">
<%
	request.getRequestDispatcher("/user/toLogin.do").forward(request, response);
%> 
</c:if>

<c:if test="${not empty login_flag}">
<%
	request.getRequestDispatcher("/toHome.do").forward(request, response);
%>
</c:if>
