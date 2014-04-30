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
	    String keyword = AttrParser.getParaStr(request, "keyword");
	    
        JSONObject json = new JSONObject();
	    int uid = AttrParser.getUid(request);
	    if (uid > 0) {
            IFriendDAO dao = new FriendDAOImpl();
            List<EsjUserInfo> userList = dao.findFriend(uid, keyword);

            if (null == userList) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                List friends = new LinkedList();
                Map oneFriend;

                for (EsjUserInfo e : userList) {
                    oneFriend = new LinkedHashMap();
                    oneFriend.put("fullName", e.getFullName());
                    oneFriend.put("avatarDir", e.getAvatarDir());
                    oneFriend.put("userId", e.getUserId());
                    friends.add(oneFriend);
                }
                json.put("friends", friends);
            }
	    } else {
	        json.put("ec", EC.UNAUTHORIZED.toInt());
	    }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
