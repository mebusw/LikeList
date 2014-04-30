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
        int shopId = Integer.parseInt(request.getParameter("shopId"));

        int uid = AttrParser.getUid(request);
        JSONObject json = new JSONObject();
        if (uid > 0) {
            IShopUserDAO dao = new ShopUserDAOImpl();
            boolean flag = dao.disLike(uid, shopId);
            flag &= dao.disTry(uid, shopId);
            if (!flag) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
            	dao.updateLikeCount(shopId);
            	dao.updateTryCount(shopId);
                json.put("ec", EC.SUCCESS.toInt());
            }
            
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
        out.write(json.toJSONString());

        
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
