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
    request.setCharacterEncoding("utf-8");  //use this if POST, not needed if GET
	try {
	    int friendId = AttrParser.getParaInt(request, "friendId");
        String subject = AttrParser.getParaStr(request, "subject");
	    String content = AttrParser.getParaStr(request, "content");
        JSONObject json = new JSONObject();
	    int uid = AttrParser.getUid(request);
	    if (uid > 0) {
	        ISmsDAO dao = new SmsDAOImpl();
	        EsjU2uSms esjU2uSms = dao.sendSms(uid, friendId, subject, content);
	
	        if (null == esjU2uSms) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	            json.put("ec", EC.SUCCESS.toInt());
	            json.put("u2ucommentId", esjU2uSms.getU2ucommentId());
	            json.put("subject", esjU2uSms.getSubject());
	            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	            json.put("createTime", sdf.format(esjU2uSms.getCreateTime()));
	        }
	    } else {
	        json.put("ec", EC.UNAUTHORIZED.toInt());
	    }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
