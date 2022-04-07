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
        Welcome to the orderlinje
    </jsp:attribute>
    <jsp:body>
        <div class="dropdown">
            <select class="dropbtn">Dropdown
                <c:forEach items="${sessionScope.ordrelinjelist}" var="orderlinjeID">

                    <option href="#">${orderlinjeID.orderlinjeID}</option>

                </c:forEach>
            </select>
        </div>
        ${sessionScope.ordrelinjelist}
        <div class="dropdown">
            <select class="dropbtn">Dropdown
                <c:forEach items="${sessionScope.ordrelinjelist}" var="bottomID">

                    <option href="#">${bottomID.bottomID}</option>

                </c:forEach>
            </select>
        </div>

        <div class="dropdown">
            <select class="dropbtn">Dropdown
                <c:forEach items="${sessionScope.ordrelinjelist}" var="topID">

                    <option href="#">${topID.topID}</option>

                </c:forEach>
            </select>
        </div>

        <br>
        <table>

        </table>
    </jsp:body>
</t:pagetemplate>