<%-- 
    Document   : student_logout
    Created on : 5 Jan, 2022, 4:16:02 PM
    Author     : maulik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("student");					// destroy session of student
//	session.removeAttribute("StudentErrorLogin");		// destroy session of student
//	session.removeAttribute("NotAccepted");				// destroy session of student
    session.removeAttribute("Error");
//	session.invalidate();
    response.sendRedirect("index.jsp");				// redirect to home page of system
%>