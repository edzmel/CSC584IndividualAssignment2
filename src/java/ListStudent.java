/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author edzme
 */
@WebServlet(urlPatterns = {"/ListStudent"})
public class ListStudent extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>View Student Records</title>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<style>");
        out.println("body {");
        out.println("font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;");
        out.println("margin: 0;");
        out.println("padding: 20px;");
        out.println("min-height: 100vh;");
        out.println("background-color: #3b82f6;");
        out.println("color: #1f2937;");
        out.println("display: flex;");
        out.println("flex-direction: column;");
        out.println("align-items: center;");
        out.println("}");
        out.println("h1 { color: #ffffff; font-size: 2.5em; margin-bottom: 30px; text-align: center; }");

        out.println(".table-container {");
        out.println("background-color: #ffffff;");
        out.println("padding: 20px;");
        out.println("border-radius: 12px;");
        out.println("box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);");
        out.println("width: 100%;");
        out.println("max-width: 1200px;");
        out.println("overflow-x: auto;");
        out.println("}");
        out.println(".student-table { width: 100%; border-collapse: collapse; margin-top: 15px; }");
        out.println(".student-table th { background-color: #eff6ff; color: #1f2937; text-align: left; padding: 12px 15px; "
                + "border-bottom: 2px solid #d1d5db; font-weight: 700; }");
        out.println(".student-table td { padding: 10px 15px; border-bottom: 1px solid #e5e7eb; vertical-align: top; }");
        out.println(".student-table tbody tr:nth-child(even) { background-color: #f9fafb; }");

        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h1>STUDENT LIST</h1>");
        out.println("<div class='table-container'>");
        out.println("<table class='student-table'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>No.</th>");
        out.println("<th>Name</th>");
        out.println("<th>Student ID</th>");
        out.println("<th>Program</th>");
        out.println("<th>Email</th>");
        out.println("<th>Hobbies</th>");
        out.println("<th>Short Introduction</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        
        try{
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentsProfileDB", "app", "app");
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM Profile";
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()){
                int no = rs.getInt("id");
                String name = rs.getString("nama");
                String studentID = rs.getString("studentID");
                String program = rs.getString("program");
                String email = rs.getString("email");
                String hobbies = rs.getString("hobbies");
                String intro = rs.getString("intro");
                
                out.println("<tr>");
                out.println("<td>" + no + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + studentID + "</td>");
                out.println("<td>" + program + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + hobbies + "</td>");
                out.println("<td>" + intro + "</td>");
                out.println("</tr>");
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
            out.println("<p>Error retrieving student data: " + e.getMessage() + "</p>");
        }
        out.println("</table");
        out.println("<br>");
        out.println("<a href='add_student.jsp'>Add New Student</a>");
        out.println("</body>");
        out.println("</html");
        
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
