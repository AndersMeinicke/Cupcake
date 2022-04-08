<%@ page import="dat.startcode.model.persistence.ConnectionPool" %>
<%@ page import="dat.startcode.model.config.ApplicationStart" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>
<t:pagetemplate>
    <jsp:attribute name="header">
         Cart
    </jsp:attribute>

    <jsp:attribute name="footer">
        Welcome to the orderlinje
    </jsp:attribute>
    <jsp:body>

        <br>

        <body>

<%----%>
        <table>
            <tr>
                <th>ordrelinjeID</th>
                <th>top</th>
                <th>bottom</th>
                <th>quantity</th>
            </tr>


                <c:forEach items="${sessionScope.ordrelinjelist}" var="ordrelinjeValues">
                    <tr>
                        <td><c:out value="${ordrelinjeValues.orderlinjeID}" /></td>
                    <td><c:out value="${ordrelinjeValues.top.topName}" />(<c:out value="${ordrelinjeValues.top.pricing}" />)</td>
                    <td><c:out value="${ordrelinjeValues.bottom.bottomName}" /></td>
                        <td><c:out value="${ordrelinjeValues.quantity}" /></td>
                </tr>
                </c:forEach>



<%--                <c:forEach items="${sessionScope.ordrelinjelist}" var="orderlinjeID">--%>
<%--                    <td><c:out value="${orderlinjeID.orderlinjeID}" /></td>--%>
<%--                </c:forEach>--%>

<%--                <c:forEach items="${sessionScope.ordrelinjelist}" var="bottomID">--%>
<%--                    <td><c:out value="${bottomID.bottomID}" /></td>--%>
<%--                </c:forEach>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Centro comercial Moctezuma</td>--%>
<%--                <td>Francisco Chang</td>--%>
<%--                <td>Mexico</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Ernst Handel</td>--%>
<%--                <td>Roland Mendel</td>--%>
<%--                <td>Austria</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Island Trading</td>--%>
<%--                <td>Helen Bennett</td>--%>
<%--                <td>UK</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Laughing Bacchus Winecellars</td>--%>
<%--                <td>Yoshi Tannamuri</td>--%>
<%--                <td>Canada</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Magazzini Alimentari Riuniti</td>--%>
<%--                <td>Giovanni Rovelli</td>--%>
<%--                <td>Italy</td>--%>
<%--            </tr>--%>
        </table>

        </body>

    </jsp:body>
</t:pagetemplate>