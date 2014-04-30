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
</head>

<body>
<div id="container">
  <%@include file="./_JHeader.jsp" %>
  <div id="main" class="content">
    <%@include file="./_JLeftSide.jsp" %>
    
    <!--including begin -->
    
    <%
    int friendId = AttrParser.getParaInt(request, "friendId");
    if(0 == friendId)
        friendId=AttrParser.getUid(request);
    
    EsjUserInfo pf = userDao.readProfile(friendId);
    long likeTotal = shopUserDao.myLikesCount(friendId);
    long tryTotal = shopUserDao.myTriesCount(friendId);
    
%>
    <div id="container2"  class="main">
      <%@include file="./_JSearch.jsp" %>
      <div id="content">
        <div class="main-box nobor"> <img src="<%=pf.getAvatarDir() %>" alt="<%=pf.getFullName() %>" class="l" />
          <h2><%=pf.getFullName() %>的藏宝图</h2>
          <p class="cl"></p>
        </div>
        <div id="newsfeed-module-box" class="newsfeed-module-box box">
          <div class="feed-module"> 
            <!--tabs begin-->
            <div id="tabs" class="tab-main">
              <input id="friendId" value="<%=friendId %>" type="hidden"/>
              <input id="likeOffset" value="0" type="hidden"/>
              <input id="likeTotal" value="<%=likeTotal%>" type="hidden" />
              <input id="tryOffset" value="0" type="hidden"/>
              <input id="tryTotal" value="<%=tryTotal%>" type="hidden" />
              <ul class="tab-head tab-main-head">
                <li><a href="#" rel="tabs-1">喜欢的(<%=likeTotal%>)</a></li>
                <li><a href="#" rel="tabs-2">尝试的(<%=tryTotal%>)</a></li>
              </ul>
              <div class="tab-art tab-main-art">
                <div id="tabs-1" class="feed-list">
                  <div class="feed-box"></div>
                  <div class='feed-footer'>
                    <div class='more-feed'> <a id='more-liked-shop' rel="0" href='#'>更多新鲜</a> </div>
                  </div>
                </div>
                <div id="tabs-2" class="feed-list">
                  <div class="feed-box"></div>
                  <div class='feed-footer'>
                    <div class='more-feed'> <a id='more-tried-shop' rel="0" href='#'>更多新鲜</a> </div>
                  </div>
                </div>
              </div>
            </div>
            <!--tabs end--> 
          </div>
        </div>
        <div id="feed-recommend-content-box" class="feed-recommend-content-box box"></div>
      </div>
      <!--right sidebar reserved--> 
    </div>
    
    <!--including end --> 
    
  </div>
  <%@include file="./_JFooter.jsp" %>
</div>
<%@include file="./_JPopup.jsp" %>
<script type="text/javascript" >
$(function(){
	var likedUrl = "../action/fetchLikelist.jsp" , likedBox = "#tabs-1 .feed-box";
	var triedUrl = "../action/fetchTrylist.jsp" , triedBox = "#tabs-2 .feed-box";
	var fId =$("#friendId").attr("value");
	var trieSendData = likeSendData = {offset:0,pageSize:4,friendId:fId};
	var pageSize = 4;
	var likedFeed=new feed(likeSendData,likedBox,likedUrl,5);
	var triedFeed=new feed(trieSendData,triedBox,triedUrl,6);
	
	$("#more-liked-shop").click(function(e){
		e.preventDefault();
		var offset = parseInt($(this).attr("rel")) + pageSize;
		var recentLogFeedMore=new feed(offset,pageSize,likedBox,likedUrl,5);
		$(this).attr("rel", offset);
	})
	
	$("#more-tried-shop").click(function(e){
		e.preventDefault();
		var offset = parseInt($(this).attr("rel")) + pageSize;
		var recentLogFeedMore=new feed(offset,pageSize,triedBox,triedUrl,2);
		$(this).attr("rel", offset);
	})
})
</script>
</body>
</html>
