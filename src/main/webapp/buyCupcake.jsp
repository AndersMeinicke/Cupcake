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
    <table>

    </table>
    <div class="dropdown">
        <button class="dropbtn">Dropdown</button>
        <div class="dropdown-content">
            <c:forEach items="${sessionScope.bottomlist}" var="bottom">

                <a href="#">${bottom.bottomName}</a>

            </c:forEach>
        </div>
    </div>
</jsp:body>
</t:pagetemplate>