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
        int offset = AttrParser.getParaInt(request, "offset");
        int pageSize = AttrParser.getParaInt(request, "pageSize");       

        JSONObject json = new JSONObject();
	    int uid = AttrParser.getUid(request);
	    if (uid > 0) {
	        ISmsDAO dao = new SmsDAOImpl();
	        List<?> smsInbox = dao.findSmsInboxByPage(uid, offset, pageSize);
	
	        if (null == smsInbox) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	            json.put("ec", EC.SUCCESS.toInt());
	            List inbox = new LinkedList();
	            Map oneSms;

	            for (Object e : smsInbox) {
	                oneSms = new LinkedHashMap();
	                //oneSms.put("subject", e.getSubject());
	                //oneSms.put("content", e.getContent());
	                //oneSms.put("friendFullName", e.getFriendFullName());
	                //oneSms.put("friendPhotoPath", e.getFriendPhotoPath());

	                SimpleDateFormat sdf = new SimpleDateFormat(
	                        "MM/dd/yyyy HH:mm:ss");
	                //oneSms.put("createTime", sdf.format(e.getCreateTime()));
	                inbox.add(oneSms);
	            }
	            json.put("inbox", inbox);
	       }
	    } else {
	        json.put("ec", EC.UNAUTHORIZED.toInt());
	    }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
