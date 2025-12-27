<%-- 
    Document   : deleteProfile
    Created on : Dec 26, 2025, 12:06:05 AM
    Author     : edzme
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="ds"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/StudentProfile"
    user="app"
    password="app"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                min-height: 100vh;
                background-color: #3b82f6;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding-top: 15vh;
            }
            h1 {
                color: #ffffff;
                font-size: 4em;
                font-weight: bold;
                text-align: center;
                margin-bottom: 30px;
                padding: 0 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 25px;
            }

            td {
                padding: 10px;
                font-size: 15px;
                color: #374151;
                background-color: white;
            }

            select {
                width: 100%;
                padding: 10px 12px;
                border-radius: 8px;
                border: 1px solid #c7d2fe;
                font-size: 14px;
                outline: none;
            }

            select:focus {
                border-color: #3b82f6;
                box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.25);
            }

            input[type="submit"] {
                width: 100%;
                padding: 12px;
                background: #ef4444;
                color: #ffffff;
                border: none;
                border-radius: 10px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.2s ease, transform 0.1s ease;
            }
            
            .action-button {
                text-decoration: none;
                display: inline-block;
                text-align: center;
                background-color: #ffffff;
                color: #3b82f6;
                border: 2px solid #ffffff; 
                padding: 12px 25px;
                font-size: 1.1em;
                font-weight: 600;
                border-radius: 8px;
                cursor: pointer;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
        .controls {
                display: flex;
                justify-content: center;
                gap: 20px;
                flex-wrap: wrap;
            }
        </style>
        
    </head>
    <body>
        <h1>Delete Page</h1>
            <c:set var="id" value="${param.id}"/>
            <c:if test="${(id != null) && (id != 'select') }">
                <sql:update var="res" dataSource="${ds}">
                    DELETE FROM PROFILE WHERE STUDENTID = ?
                    <sql:param value="${id}"/>
                </sql:update>
            </c:if>
        <form action="deleteProfile.jsp" method="post">
            <table>
                <tr>
                    <td>ID:-</td>
                    <td></td>
                    <td>
                        <select name="id">
                            <sql:query var="result" dataSource="${ds}">
                                SELECT STUDENTID FROM PROFILE
                            </sql:query>
                            <c:forEach var="row" items="${result.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option> <c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Submit">
        </form>
        <br><div class="controls"><a href="index.html" class="action-button">BACK</a></div></br>
    </body>
</html>
