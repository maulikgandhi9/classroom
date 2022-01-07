<%-- 
    Document   : admin_student_requests_action
    Created on : 5 Jan, 2022, 12:49:18 PM
    Author     : maulik
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String c[] = request.getParameterValues("ad");

    try {
        // register the driver
        Class.forName("com.mysql.jdbc.Driver");

        // establish the connection with the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");

        // create a SQL statement
        Statement stmt = con.createStatement();

        // if delete request is made
        if (request.getParameter("reject") != null) {
            for (String s : c) {
                String qy = "delete from student where student_id ='" + s + "'";
                stmt.executeUpdate(qy);
            }
        } // else if accept request is made
        else if (request.getParameter("accept") != null) {
            for (String s : c) {
                String qy = "update student set is_approved = 1 where student_id ='" + s + "'";
                stmt.executeUpdate(qy);
            }
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
    response.sendRedirect("admin_student_requests.jsp");				// redirect to requsts' page
%>