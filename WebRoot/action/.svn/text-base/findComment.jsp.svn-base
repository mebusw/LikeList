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
        int offset = Integer.parseInt(request.getParameter("offset"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        JSONObject json = new JSONObject();

        ICommentDAO dao = new CommentDAOImpl();

        List<EsjU2sComment> commentList = dao.findCommentsByPage(shopId, offset, pageSize);

        if (null == commentList) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            List comments = new LinkedList();
            Map oneComment;

            for (EsjU2sComment e : commentList) {
                oneComment = new LinkedHashMap();
                oneComment.put("commentScore", e.getCommentScore());
                oneComment.put("shopId", e.getShopId());
                oneComment.put("content", e.getContent());
                oneComment.put("replyTo", e.getReplyTo());
                oneComment.put("userId", e.getUserId());
                oneComment.put("userFullName", e.getUserFullName());
                oneComment.put("userPhotoPath", e.getUserPhotoPath());

                SimpleDateFormat sdf = new SimpleDateFormat(
                        "MM/dd/yyyy HH:mm:ss");
                oneComment.put("createTime", sdf.format(e.getCreateTime()));
                comments.add(oneComment);
            }
            json.put("comments", comments);
            //json.put("commentsCount", commentsCount);
       }

	   out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
