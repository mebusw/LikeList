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
<% //this file contains 3 DIVs   %>
<%
			response.setHeader("Pragma","No-cache"); 
			response.setHeader("Cache-Control","no-cache"); 

            int bid = AttrParser.getBid(request);
            long unreadSmsCount = 0;
            long unhandledInviteCount = 0;
            String fullName = "";
            String avatarDir = "";
            long myLikes = 0;
            long myTries = 0;
            String keyword = "";
            String category1 = "";
            String category2 = "";
            

            IBizDAO bizDao = new BizDAOImpl();
            ISmsDAO smsDao = new SmsDAOImpl();
            IShopUserDAO shopUserDao = new ShopUserDAOImpl();
            IShopBizDAO shopBizDao = new ShopBizDAOImpl();
            IUserDAO userDao = new UserDAOImpl();
            IFriendDAO friendDao = new FriendDAOImpl();
            IAlbumDAO albumDao = new AlbumDAOImpl();
            ICommentDAO commentDao = new CommentDAOImpl();
            ITradeDAO tradeDao = new TradeDAOImpl();

            
%>
<div id="pageHead" class="header">
  <div class="header-con">
    <h1 class="logo"><a href="./" title="e瞬间"><img src="../images/logo.png" alt="e瞬间" /></a><span>因为朋友，世界变得更信任！</span></h1>
    <ul class="nav">
      <li><a href="./" accesskey="1">首页</a></li>
      <li><a href="consume.jsp" accesskey="2">消费券</a></li>
      <li><a href="../home/welcome.jsp">退出</a></li>
    </ul>
    <p class="cl"></p>
  </div>
</div>
<div class="add add-friends" id="add-friends">
  <h4>邀请朋友</h4>
  <p class="tab-head"><a href="#" class="mr10" rel="tab-top-01">邀请站外的朋友</a><a href="#" rel="tab-top-02">邀请站内的朋友</a></p>
  <div class="tab-art"> 
    <!--tab-top-01-->
    <div class="add-outweb-friends" id="tab-top-01">
      <ul class="friends-web" id="add-friends-way">
        <li><a href="#" id="email"><img src="../images/web-logo.png" alt="" /></a></li>
        <li><a href="#" id="gmail"><img src="../images/web-logo.png" alt="" /></a></li>
        <li><a href="#" id="kaixin"><img src="../images/web-logo.png" alt="" /></a></li>
        <li><a href="#" id="renren"><img src="../images/web-logo.png" alt="" /></a></li>
      </ul>
      <div class="list-box">
        <ul id="friends-lists">
          
        </ul>
      </div>
    </div>
    <!--tab-top-02-->
    <div class="add-inweb-friends"  id="tab-top-02"></div>
  </div>
</div>
<script type="text/javascript" src="../js/jquery.form.js"></script> 
<script type="text/javascript" src="../js/add-friends.js"></script> 
<script type="text/javascript">
$(function(){
	$("#top-friends").click(function(){
		$("#add-friends").popup({
			isDelay:false,
			isRelation:true,
			relationTarget:"#top-friends"
		});
	})
	$("#add-friends").mytab({tab:"#add-friends"});
})
</script> 
<!--header--> 