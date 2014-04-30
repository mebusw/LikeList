<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.springframework.transaction.annotation.Transactional" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>

<%

	ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
    IUserDAO dao = (UserDAOImpl) ctx.getBean("userDAO");

	out.print(dao);
	EsjUserInfo u = dao.login("mebusw@3.com", "202cb962ac59075b964b07152d234b70");
	out.print(u.getFullName());
%>
