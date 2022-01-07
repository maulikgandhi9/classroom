<%-- 
    Document   : admin_logout
    Created on : 5 Jan, 2022, 12:14:52 PM
    Author     : maulik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("admin");					// destroy session of admin
    session.removeAttribute("AdminErrorLogin");		// destroy session of admin
//	session.invalidate();
    response.sendRedirect("index.jsp");				// redirect to home page of system
%>
