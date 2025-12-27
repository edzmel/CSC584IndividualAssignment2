<%-- 
    Document   : viewProfiles
    Created on : Dec 25, 2025, 10:10:54 PM
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
        <title>View Profiles Page</title>
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
            
            .container {
                width: 100%;
                max-width: 800px;
                background: white;
                padding: 10px 10px;
                border-radius: 16px;
                box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.2);
            }
            h1 {
                color: #ffffff;
                font-size: 4em;
                font-weight: bold;
                text-align: center;
                margin-bottom: 30px;
                padding: 0 20px;
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
            table {
                width: 100%;
                border-collapse: collapse;
                background: #ffffff;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
            }

            th {
                background: #2563eb;
                color: #ffffff;
                padding: 14px 16px;
                text-align: left;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            td {
                padding: 12px 16px;
                color: #374151;
                font-size: 14px;
                border-bottom: 1px solid #e5e7eb;
            }

            tr:nth-child(even) td {
                background: #f9fafb;
            }

            tr:hover td {
                background: #eef2ff;
                transition: background 0.2s ease;
            }

            tr:last-child td {
                border-bottom: none;
            }
        </style>
    </head>
    <body>
        <h1>Student Profiles</h1>
        <div class="container">
            <sql:query var="result" dataSource="${ds}">
                SELECT * FROM PROFILE
            </sql:query>
            <table border="1">
                <!-- column headers -->
                <tr>
                    <c:forEach var="columnName" items="${result.columnNames}">
                        <th><c:out value="${columnName}"/></th>
                        </c:forEach>
                </tr>
                <!-- column data -->
                <c:forEach var="row" items="${result.rowsByIndex}">
                    <tr text-align="left">
                        <c:forEach var="column" items="${row}">
                            <td><c:out value="${column}"/></td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br><a href="index.html" class="action-button">BACK</a></br>
    </body>
</html>
