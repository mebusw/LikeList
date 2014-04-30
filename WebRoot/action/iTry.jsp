<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>

<%
    request.setCharacterEncoding("utf-8");
	try {
        int shopId = AttrParser.getParaInt(request, "shopId");
        System.out.println(shopId);
        
        int uid = AttrParser.getUid(request);

        JSONObject json = new JSONObject();
        if (uid > 0) {
            IShopUserDAO dao = new ShopUserDAOImpl();
            EsjUserTryit esjUserTryit = dao.ITry(uid, shopId);
            if (null == esjUserTryit) {
                json.put("ec", EC.UNSUCCESSFUL.toInt());
            } else {
                dao.createUserLog(uid, OperationType.LIKE, shopId, 0, "");
                dao.updateTryCount(shopId);

                json.put("ec", EC.SUCCESS.toInt());
                json.put("shopId", esjUserTryit.getShopId());
                json.put("userId", esjUserTryit.getUserId());
                SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();
                json.put("createTime", sdf.format(esjUserTryit.getCreatTime()));
            }
            
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
        out.write(json.toJSONString());

        
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
