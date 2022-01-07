<%-- 
    Document   : faculty_logout
    Created on : 5 Jan, 2022, 4:15:28 PM
    Author     : maulik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.removeAttribute("faculty");					// destroy session of student
//	session.removeAttribute("FacultyErrorLogin");		// destroy session of student
//	session.removeAttribute("NotAccepted");				// destroy session of student
    session.removeAttribute("Error");
//	session.invalidate();
    response.sendRedirect("index.jsp");				// redirect to home page of system
%>
