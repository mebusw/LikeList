<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.EC"%>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>


<%
        request.setCharacterEncoding("utf-8");

	    int offset = AttrParser.getParaInt(request, "offset");
        int pageSize = AttrParser.getParaInt(request, "pageSize");

        JSONObject json = new JSONObject();
        int uid = AttrParser.getUid(request);

        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
        IFriendDAO dao = (FriendDAOImpl) ctx.getBean("friendDAO");

        List<EsjUserInfo> friendList1 = dao.findRecommendFriend(uid, offset, pageSize);
        List<EsjUserInfo> friendList2 = dao.findPossibleKnownFriend(uid, offset, pageSize);

        int total = 0;
        if (null == friendList1 && null == friendList2) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            List friends = new LinkedList();
            Map oneFriend;
            

            for (EsjUserInfo e : friendList2) {
            	oneFriend = new LinkedHashMap();
                oneFriend.put("avatarDir", e.getAvatarDir());
                oneFriend.put("userId", e.getUserId());
                oneFriend.put("fullName", e.getFullName());

                friends.add(oneFriend);
                total++;
            }
            for (EsjUserInfo e : friendList1) {
                oneFriend = new LinkedHashMap();
                oneFriend.put("avatarDir", e.getAvatarDir());
                oneFriend.put("userId", e.getUserId());
                oneFriend.put("fullName", e.getFullName());

                boolean found = false;
                for (EsjUserInfo u : friendList2)
                    if (u.getUserId().equals(e.getUserId())) {
                		found = true;
                		break;
                	}
                if (!found && total < pageSize)
                    friends.add(oneFriend);
            }
            json.put("friends", friends);
            
       }

	   out.write(json.toJSONString());
	
	
%>
