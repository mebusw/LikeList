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
        int friendId = Integer.parseInt(request.getParameter("friendId"));
        int uid = AttrParser.getUid(request);
        JSONObject json = new JSONObject();
        if (uid > 0) {
            IFriendDAO dao = new FriendDAOImpl();
            EsjUserFriend esjUserFriend = dao.inviteFriend(uid, friendId);

            if (null == esjUserFriend) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                json.put("friendshipId", esjUserFriend.getFriendshipId());
                json.put("userId", esjUserFriend.getUserId());
                json.put("friendId", esjUserFriend.getFriendId());
                SimpleDateFormat sdf = new SimpleDateFormat(
                        "MM/dd/yyyy HH:mm:ss");
                json.put("createTime", sdf
                        .format(esjUserFriend.getCreateTime()));
            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
            
        out.write(json.toJSONString());

        
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
