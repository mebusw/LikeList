<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>



<%
    request.setCharacterEncoding("utf-8");
	try {
	    
	    int uid = AttrParser.getUid(request);
	    out.write("uid=" + AttrParser.getUid(request));
		out.write("bid=" + AttrParser.getBid(request));
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
