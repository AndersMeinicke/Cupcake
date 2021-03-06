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
    <form action="buycupcake" method="post">
        <select id ="bottom" name="bottom" class="dropbtn">
            <option disabled selected value> Select a bottom</option>
            <c:forEach items="${sessionScope.bottomlist}" var="bottom">

                <option value="${bottom.bottomID}">${bottom.bottomName}</option>

            </c:forEach>
        </select>
        <select id="top" name="top" class="dropbtn">
            <option disabled selected value> Select a top</option>
            <c:forEach items="${sessionScope.toplist}" var="top">

                <option value="${top.topID}">${top.topName}</option>

            </c:forEach>
        </select>
        <input type="number" id="quantity" name="quantity"> how many do you want </input>
        <input type="submit" value="Send to cart">
    </form>
    <br>
    <h4>${sessionScope.error}</h4>
</jsp:body>
</t:pagetemplate>