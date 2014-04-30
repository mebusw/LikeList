<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<% //this file contains 1 DIVs   %>
<%
	if (uid > 0){
	    EsjUserInfo userInfo = userDao.readProfile(uid);
	    avatarDir = userInfo.getAvatarDir();
	    fullName = userInfo.getFullName();
	
	    myLikes = shopUserDao.myLikesCount(uid);
	    myTries = shopUserDao.myTriesCount(uid);
	    List<EsjUserInfo> recommandFriends = friendDao.findRecommendFriend(uid);
	    if (recommandFriends.size() < 3) {
	    	List<EsjUserInfo> otherFriends = friendDao.findPossibleKnownFriend(uid, 0, 20);
	    	for (EsjUserInfo e : otherFriends) {
	    		boolean found = false;
	            for (EsjUserInfo u : recommandFriends)
	                if (u.getUserId().equals(e.getUserId())) {
	                    found = true;
	                    break;
	                }
	            if (!found)
	                recommandFriends.add(e);
	    	}
	    }
	    pageContext.setAttribute("recommandFriends", recommandFriends, PageContext.PAGE_SCOPE);
	    
	    unhandledInviteCount = friendDao.findUnhandledInviteCount(uid);
%>
<!--left sidebar begin-->

<div id="sidebar" class="aside">
  <p class="avatar"><a href="#"><img src="<%=avatarDir %>" width="154" height="154" alt="<%=fullName %>" title="<%=uid %>"/></a></p>
  <div>
    <form action="../action/updateUserSeekHelp.jsp" id="updateUserSeekHelpForm">
      <input type="text" name="seekHelp" class="text-input" value=""/>
      <input type="submit" value="我要求助" class="btn-help"/>
    </form>
  </div>
  <p class="aside-article"><a class="l" href="#" title="<%=fullName %>"><%=fullName %></a><span class="r"><a href="./userProfile.jsp">个人设置</a></span></p>
  <p class="aside-article"><a href="./likelist.jsp?friendId=<%=uid %>"  class="l"> 我喜欢的 </a><span class="r"><%=myLikes %></span></p>
  <p class="aside-article"><a href="./likelist.jsp?friendId=<%=uid %>#tabs_1"  class="l"> 我尝试的 </a><span class="r"><%=myTries %></span></p>
  <p class="aside-article"><a href="friends.jsp"  class="l">我的朋友</a><span class="r"><%=unhandledInviteCount %></span></p>
  <h3>推荐</h3>
  <div class="aside-item">
    <h4>推荐好友</h4>
    <ul id="aside-friends" class="aside-recomm">
      <logic:iterate id="recommandBean" name="recommandFriends" length="3">
        <li><a title="用户姓名" href="likelist.jsp?friendId=<jsp:getProperty name='recommandBean' property='userId'/>" class="name"> <img src="<jsp:getProperty name='recommandBean' property='avatarDir' />" width="40" height="40" alt="" /></a> <a class="invite" href="../action/inviteFriend.jsp?friendId=<jsp:getProperty name='recommandBean' property='userId'/>" ><span>
          <jsp:getProperty name='recommandBean' property='fullName' />
          </span> <br/>
          <img src="../images/plus-green.png" class="mr5" alt="" />加为朋友</a> </li>
      </logic:iterate>
    </ul>
    <a href="#" id="aside-more-friends">更多好友</a> </div>
</div>
<!--left sidebar over-->

<%
    } else{
        response.setContentType("text/html; charset=utf8");
        response.sendRedirect("./welcome.jsp");
        out.write("<script>window.location='./welcome.jsp'</script>");
    }
%>
