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
	    String content = AttrParser.getParaStr(request, "content");
	    
        JSONObject json = new JSONObject();
	    int uid = AttrParser.getUid(request);
	    if (uid > 0) {
	        ICommentDAO dao = new CommentDAOImpl();
	        IShopUserDAO daoShopUser = new ShopUserDAOImpl();
	        EsjU2sComment esjU2sComment = dao.addComment(shopId, content, uid);
	
	        if (null == esjU2sComment) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	        	EsjUserLog userLog = daoShopUser.createUserLog(uid, OperationType.COMMENT, shopId, 0,
	        			content.substring(0, content.length() > 10 ? 10 : content.length()));
	            json.put("ec", EC.SUCCESS.toInt());
	            json.put("logId", userLog.getLogId());
	            json.put("shopId", esjU2sComment.getShopId());
	            json.put("content", esjU2sComment.getContent());
	            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	            json.put("createTime", sdf.format(esjU2sComment.getCreateTime()));
	        }
	    } else {
	        json.put("ec", EC.UNAUTHORIZED.toInt());
	    }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
