<%@ page import="dat.startcode.model.persistence.ConnectionPool" %>
<%@ page import="dat.startcode.model.config.ApplicationStart" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>
<t:pagetemplate>
    <jsp:attribute name="header">
         What you buying?
    </jsp:attribute>

    <jsp:attribute name="footer">
        Welcome to the frontpage
    </jsp:attribute>
<jsp:body>
    <div class="dropdown">
        <select class="dropbtn">Dropdown
            <c:forEach items="${sessionScope.bottomlist}" var="bottom">

                <option href="#">${bottom.bottomName}</option>

            </c:forEach>
        </select>
    </div>
    <div class="dropdown">
        <select class="dropbtn">Dropdown
            <c:forEach items="${sessionScope.toplist}" var="top">

                <option href="#">${top.topName}</option>

            </c:forEach>
        </select>
    </div>
    <br>
    <table>

    </table>
</jsp:body>
</t:pagetemplate>