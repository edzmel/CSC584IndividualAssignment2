<%-- 
    Document   : insert
    Created on : Dec 24, 2025, 10:38:36 PM
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
    <%
        if (request.getMethod().equalsIgnoreCase("GET")) {
            response.sendRedirect("form.jsp");
            return;
        }
    %>

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
            
            .container {
                width: 100%;
                max-width: 800px;
                background: white;
                padding: 10px 10px;
                border-radius: 16px;
                box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.2);
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
        <h1>Insert Page</h1>
        
        <jsp:useBean id="ProfileBean"
                     class="student.bean.ProfileBean"
                     scope="request" />

        <jsp:setProperty name="ProfileBean" property="*" />
        <div class="container">
            <table>
                <tr>
                    <td>Name:-</td>
                    <td></td>
                    <td><jsp:getProperty name="ProfileBean" property="name" /></td>
                </tr>
                <tr>
                    <td>Student ID:-</td>
                    <td></td>
                    <td><jsp:getProperty name="ProfileBean" property="studentID" /></td>
                </tr>
                <tr>
                    <td>Program:-</td>
                    <td></td>
                    <td><jsp:getProperty name="ProfileBean" property="program" /></td>
                </tr>
                <tr>
                    <td>Email:-</td>
                    <td></td>
                    <td><jsp:getProperty name="ProfileBean" property="email" /></td>
                </tr>
                <tr>
                    <td>Hobbies:-</td>
                    <td></td>
                    <td><jsp:getProperty name="ProfileBean" property="hobbies" /></td>
                </tr>
                <tr>
                    <td>Short Introduction:-</td>
                    <td></td>
                    <td><jsp:getProperty name="ProfileBean" property="intro" /></td>
                </tr>
            </table>
        </div>
       
         
        <c:set var="name" value="${param.name}"/>
        <c:set var="studentID" value="${param.studentID}"/>
        <c:set var="program" value="${param.program}"/>
        <c:set var="email" value="${param.email}"/>
        <c:set var="hobbies" value="${param.hobbies}"/>
        <c:set var="intro" value="${param.intro}"/>
        
        <c:if test="${(name!=null)&&(studentID!=null)&&(program!=null)&&(email!=null)&&(hobbies!=null)&&(intro!=null)}" var="result">
            <sql:update var="result" dataSource="${ds}">
                INSERT INTO PROFILE VALUES (?,?,?,?,?,?)
                <sql:param value="${studentID}"/>
                <sql:param value="${name}"/>
                <sql:param value="${program}"/>
                <sql:param value="${email}"/>
                <sql:param value="${hobbies}"/>
                <sql:param value="${intro}"/>
            </sql:update>
        </c:if>
                
        <br><div class="controls"><a href="viewProfiles.jsp" class="action-button">View Students Profile</a></div></br>
    </body>
</html>
