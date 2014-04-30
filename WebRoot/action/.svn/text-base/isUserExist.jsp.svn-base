<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.EC"%>

<%
    request.setCharacterEncoding("utf-8");
	try {
	    String email = AttrParser.getParaStr(request, "email");
        JSONObject json = new JSONObject();

        IUserDAO dao = new UserDAOImpl();

        json.put("exist", dao.emailExist(email));
        json.put("ec", EC.SUCCESS.toInt());
        json.put("email", email);
	    out.write(json.toJSONString());
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
