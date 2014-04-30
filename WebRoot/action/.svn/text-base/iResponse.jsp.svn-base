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
        int shopId = AttrParser.getParaInt(request, "shopId");
        int friendId = AttrParser.getParaInt(request, "friendId");
        int uid = AttrParser.getUid(request);
        JSONObject json = new JSONObject();
        if (uid > 0) {
        	IUserDAO daoUser = new UserDAOImpl();
            IShopUserDAO dao = new ShopUserDAOImpl();
            
            EsjUserInfo friend = daoUser.findUser(friendId);
            
            if (null == friend) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
            	EsjUserLog userLog = dao.createUserLog(uid, OperationType.RESPONSE, shopId,
            			friend.getUserId(), friend.getSeekHelp());
            	
            	
                json.put("ec", EC.SUCCESS.toInt());
                json.put("logId", userLog.getLogId());
                json.put("shopId", shopId);
                json.put("userId", uid);
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            }
            
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
        out.write(json.toJSONString());

        
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
