<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : ''+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SUN-Board</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<style>
    ul{
        position: fixed;
        top: 0;
        left: 0;
        z-index: 99;
        background: none;
    }

    #logo {
        color:white;
        font-size: 22px;
        font-weight: 600;
        padding-left:40px;
        margin-right:auto;
        display: flex;
    }
</style>
<body>
<div id="menu">
    <ul>
        <li id="logo">SUN</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<div style="text-align:center">
<%--    <%= application.getContextPath()%><br>--%>
<%--    <%= request.getSession().getServletContext().getRealPath("/")%><br>--%>
<%--    <%= application.getRealPath("/")%>--%>
   <img src="${pageContext.request.contextPath}/image/bg.jpg" width="100%" height="1000">
</div>
</body>
</html>