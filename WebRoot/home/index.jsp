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
<title>朋互网 朋友的天地</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<%@include file="./js_css_include.html" %>
</head>
<body>
<script src='../js/calendar.js' type="text/javascript"></script>
<div id="container">
  <%@include file="./_JHeader.jsp" %>
  <div id="main" class="content">
    <%@include file="./_JLeftSide.jsp" %>
    
    <!--including begin -->
    
    <div id="container2" class="main"> <span id="pagetop"></span>
      <%@include file="./_JSearch.jsp" %>
      <!--tabs begin-->
      <div id="tabs"  class="tab-main">
        <ul class="tab-head tab-main-head">
          <li><a href="#" rel="tabs-1">最新动态</a></li>
          <li><a href="#" rel="tabs-2">朋友动态</a></li>
          <li><a href="#" rel="tabs-3">活动优惠</a></li>
          <li><a href="#" rel="tabs-4">团购超市</a></li>
        </ul>
        <div class="tab-art tab-main-art"> 
          <!--tabs-1 begin-->
          <div id="tabs-1" class="feed-list">
            <div class="feed-box"></div>
            <div class='feed-footer'>
              <div class='more-feed'> <a id='more-recent-log' rel="0" href='#'>更多新鲜</a> </div>
            </div>
          </div>
          <!--tabs-1 end--> 
          <!--tabs-2 begin-->
          <div id="tabs-2" class="feed-list">
            <div class="feed-box"></div>
            <div class='feed-footer'>
              <div class='more-feed'><a id='more-friend-log' rel="0" href='#'>更多好友动态</a></div>
            </div>
          </div>
          <!--tabs-2 end--> 
          <!--tabs-3 begin-->
          <div id="tabs-3" class="feed-list">
            <div class="feed-box"></div>
            <div class='feed-footer'>
              <div class='more-feed'><a id='more-recent-deal' rel="0" href='#'>更多优惠</a></div>
            </div>
          </div>
          <!--tabs-3 end--> 
          <!--tabs-4 begin-->
          <div id="tabs-4" class="feed-list">
            <div class="feed-box"></div>
            <div class='feed-footer'>
              <div class='more-feed'><a id='more-recent-gr' rel="0" href='#'>更多团购</a></div>
            </div>
          </div>
          <!--tabs-4 end-->
        </div>
      </div>
      <!--tabs end-->
      <div id="content">
        <div id="newsfeed-module-box">
          <div class="feed-module">
            <input id="recentLogOffset" value="0" type="hidden"/>
            <input id="friendLogOffset" value="0" type="hidden"/>
            <input id="recentDealOffset" value="0" type="hidden"/>
            <input id="recentGrOffset" value="0" type="hidden"/>
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
	var pageSize = 4;
	var recentLogBox = "#tabs-1 .feed-box" , recentLogUrl = "../action/findRecentLog.jsp";
	var friendLogBox = "#tabs-2 .feed-box" , friendLogUrl = "../action/findFriendLog.jsp";
	var recentdealBox = "#tabs-3 .feed-box" , recentdealUrl = "../action/findRecentDeal.jsp";
	var recentgrBox = "#tabs-4 .feed-box" , recentgrUrl = "../action/findRecentGr.jsp";
	var recentLogFeed=new feed({offset:0,pageSize:4},recentLogBox,recentLogUrl,1);
	var friendLogFeed=new feed({offset:0,pageSize:4},friendLogBox,friendLogUrl,2);
	var recentdealFeed=new feed({offset:0,pageSize:4},recentdealBox,recentdealUrl,3);
	var recentgrFeed=new feed({offset:0,pageSize:4},recentgrBox,recentgrUrl,4);
	
	$("#more-recent-log").click(function(e){
		e.preventDefault();
		var curOffset = parseInt($(this).attr("rel")) + pageSize;
		var recentLogFeedMore=new feed({offset:curOffset,pageSize:pageSize},recentLogBox,recentLogUrl,1);
		$(this).attr("rel", curOffset);
	})
	
	$("#more-friend-log").click(function(e){
		e.preventDefault();
		var curOffset = parseInt($(this).attr("rel")) + pageSize;
		var recentLogFeedMore=new feed({offset:curOffset,pageSize:pageSize},friendLogBox,friendLogUrl,2);
		$(this).attr("rel", curOffset);
	})
	
	$("#more-recent-deal").click(function(e){
		e.preventDefault();
		var curOffset = parseInt($(this).attr("rel")) + pageSize;
		var recentLogFeedMore=new feed({offset:curOffset,pageSize:pageSize},recentdealBox,recentdealUrl,3);
		$(this).attr("rel", curOffset);
	})
	
	$("#more-recent-gr").click(function(e){
		e.preventDefault();
		var curOffset = parseInt($(this).attr("rel")) + pageSize;
		var recentLogFeedMore=new feed({offset:curOffset,pageSize:pageSize},recentgrBox,recentgrUrl,4);
		$(this).attr("rel", curOffset);
	})
})
</script>
<script type="text/javascript" src="../js/timeCountDown.js"></script>
</body>
</html>
