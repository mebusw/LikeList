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
    request.setCharacterEncoding("UTF-8");
	try {
        JSONObject json = new JSONObject();
        IUserDAO dao = new UserDAOImpl();
        int uid = AttrParser.getUid(request);
        if (uid > 0) {
        	EsjUserInfo esjUserInfo = dao.readProfile(uid);
        	
        	esjUserInfo.setPassword(AttrParser.getParaStr(request, "pass1"));
        	System.out.println(AttrParser.getParaStr(request, "pass1"));

            boolean flag = dao.updateProfile(esjUserInfo);
            if (!flag) {
                json.put("ec", EC.UNSUCCESSFUL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                json.put("userId", esjUserInfo.getUserId());
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                json.put("lastUpdate", sdf.format(esjUserInfo.getLastUpdate()));

            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
	    out.write(json.toJSONString());
	    
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
