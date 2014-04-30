<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>
<%@ page import="org.springframework.transaction.annotation.Transactional" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<%
    request.setCharacterEncoding("utf-8");

    int shopId = AttrParser.getParaInt(request, "shopId");
    int uid = AttrParser.getUid(request);
    JSONObject json = new JSONObject();
    if (uid > 0) {
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        IShopUserDAO dao = (ShopUserDAOImpl) ctx.getBean("shopUserDAO");

        EsjUserLikeit esjUserLikeit = dao.ILike(uid, shopId);
        if (null == esjUserLikeit) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
        	dao.createUserLog(uid, OperationType.LIKE, shopId, 0, "");
            dao.updateLikeCount(shopId);
        	dao.disTry(uid, shopId);
        	dao.updateTryCount(shopId);
        	
            json.put("ec", EC.SUCCESS.toInt());
            json.put("shopId", esjUserLikeit.getShopId());
            json.put("userId", esjUserLikeit.getUserId());
            SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();
            json.put("createTime", sdf.format(esjUserLikeit.getCreatTime()));
        }
        
    } else {
        json.put("ec", EC.UNAUTHORIZED.toInt());
    }
    out.write(json.toJSONString());

        
%>
