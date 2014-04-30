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
    JSONObject json = new JSONObject();
    IBizDAO dao = new BizDAOImpl();
    int bid = AttrParser.getBid(request);
    if (bid > 0) {
    	EsjBizInfo esjBizInfo = dao.readProfile(bid);
    	
    	esjBizInfo.setPhone(AttrParser.getParaStr(request, "phone"));
    	esjBizInfo.setFullName(AttrParser.getParaStr(request, "fullName"));
    	esjBizInfo.setAlipayAccount(AttrParser.getParaStr(request, "alipayAccount"));
    	esjBizInfo.setIdentifyCard(AttrParser.getParaStr(request, "identifyCard"));

        boolean flag = dao.updateProfile(esjBizInfo);
        if (!flag) {
            json.put("ec", EC.UNSUCCESSFUL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            json.put("bizId", esjBizInfo.getBizId());
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            json.put("lastUpdate", sdf.format(esjBizInfo.getLastUpdate()));

        }
    } else {
        json.put("ec", EC.UNAUTHORIZED.toInt());
    }
 out.write(json.toJSONString());
	    
	
%>
