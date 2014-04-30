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
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<%@include file="./js_css_include.html" %>
<script src='../js/home_friends.js' type="text/javascript"></script>

</head>
<body>
<div id="container">
  <%@include file="./_JHeader.jsp" %>
  <div id="main" class="content">
    <%@include file="./_JLeftSide.jsp" %>
    <!--including begin -->
    <%
        List<EsjUserInfo> friendList = friendDao.findFriend(uid);
        pageContext.setAttribute("friendList", friendList, PageContext.PAGE_SCOPE);

        List<EsjUserInfo> inviteList = friendDao.findUnhandledInvites(uid); 
        pageContext.setAttribute("inviteList", inviteList, PageContext.PAGE_SCOPE);
        %>
    <div id="container2" class="main">
      <%@include file="./_JSearch.jsp" %>
      <!--tabs begin-->
      <div id="tabs" class="tab-main">
        <ul class="tab-head tab-main-head">
          <li><a href="#tabs-1" rel="tabs-1">朋友</a></li>
          <li><a href="#tabs-2" rel="tabs-2">邀请</a></li>
        </ul>
        <div class="tab-art tab-main-art">
          <div id="tabs-1">
            <ul class="friends-list">
              <logic:iterate id="friendBean" name="friendList">
                <li><img src="<jsp:getProperty property='avatarDir' name='friendBean'/>" height="36"> 
                <a href='userProfile.jsp?friendId=<jsp:getProperty property="userId" name="friendBean"/>'>
                  <jsp:getProperty property="fullName" name="friendBean"/>
                  </a> </li>
              </logic:iterate>
            </ul>
          </div>
          <div id="tabs-2">
            <ul class="friends-list">
            <logic:iterate id="inviteBean" name="inviteList"> 
            <li><img src="<jsp:getProperty property='avatarDir' name='inviteBean'/>" height="36"> 
                <a class="accept-invite" href="../action/acceptInvite.jsp?friendId=<jsp:getProperty property="userId" name='inviteBean'/>">接受
              <jsp:getProperty property="fullName" name='inviteBean'/>
              的邀请</a></li> 
              </logic:iterate>
            </ul>
          </div>
        </div>
      </div>
      <!--tabs end-->
      <!--right sidebar reserved-->
    </div>
    <!--including end -->
  </div>
  <%@include file="./_JFooter.jsp" %>
</div>
<%@include file="./_JPopup.jsp" %>
</body>
</html>
