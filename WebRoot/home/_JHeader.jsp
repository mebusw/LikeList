<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%
            response.setHeader("Pragma","No-cache"); 
			response.setHeader("Cache-Control","no-cache"); 
			//response.setDateHeader("Expires", 0); 
			
			int uid = AttrParser.getUid(request);
            long unreadSmsCount = 0;
            long unhandledInviteCount = 0;
            String fullName = "";
            String avatarDir = "";
            long myLikes = 0;
            long myTries = 0;
            String keyword = "";
            String category1 = "";
            String category2 = "";
            String province = "";
            String city = "";
            String district = "";
            
            SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();

            ISmsDAO smsDao = new SmsDAOImpl();
            IShopUserDAO shopUserDao = new ShopUserDAOImpl();
            IShopBizDAO shopBizDao = new ShopBizDAOImpl();
            IUserDAO userDao = new UserDAOImpl();
            IFriendDAO friendDao = new FriendDAOImpl();
            IAlbumDAO albumDao = new AlbumDAOImpl();
            ICommentDAO commentDao = new CommentDAOImpl();
            IAddressDAO addrDao = new AddressDAOImpl();
            ITradeDAO tradeDao = new TradeDAOImpl();

			
			if (uid > 0) {               
                unreadSmsCount =  smsDao.findUnreadSmsCount(uid);
                

            
%>
<script type="text/javascript" src="../js/add-friends.js"></script>

<div id="pageHead" class="header">
  <div class="header-con">
    <h1 class="logo"><a href="./" title="朋互网"><img src="../images/logo.png" alt="朋互网" /></a></h1>
    <div class="web-title"></div>
    <ul class="nav">
      <li><a href="./" >首页</a></li>
      <li><a href="#" id="top-friends">找朋友</a></li>
      <li><a href="./inbox.jsp">收信箱[<%=unreadSmsCount %>]</a></li>
      <li><a href="./userProfile.jsp">个人设置</a></li>
      <li><a href="./welcome.jsp">退出</a></li>
    </ul>
    <p class="cl"></p>
  </div>
</div>
<div class="add" id="aside-friends-box">
  <div class="add-con"></div>
  <div class="tr cannel-box"><a href="#" class="cannel">关闭窗口</a></div>
</div>
<div class="add add-friends" id="add-friends">
  <h4>邀请朋友</h4>
  <p class="tab-head tab-friends-head"><a href="#" rel="tab-top-01">邀请站外的朋友</a><a href="#" id="top_add" rel="tab-top-02">邀请站内的朋友</a></p>
  <div class="tab-art tab-friends-art"> 
    <!--tab-top-01-->
    <div class="add-outweb-friends" id="tab-top-01">
      <ul class="friends-web" id="add-friends-way">
        <li><a href="#" id="163" class="email-163"></a></li>
        <li><a href="#" id="gmail"></a></li>
        <li><a href="#" id="hotmail"></a></li>
        <li><a href="#" id="yahoo"></a></li>
      </ul>
      <p class="p5">登录邮箱，然后给自己的好朋友发邀请邮件，让你的朋友和你一起分享。</p>
      <form id="sendMailForm" action="../action/sendMail.jsp">
        <input type="hidden" name="senderName" value=""/>
        <input type="hidden" name="senderEmail value="""/>
        <input type="hidden" name="senderPwd" value=""/>
        <input type="hidden" name="Content" value=""/>
        <input type="hidden" name="url" value=""/>
        
        <div class="list-box">
          <ul id="friends-lists">
            朋友列表
          </ul>
        </div>
        <div id="send-email" class="dn">
          <input type="submit" class="btn btn-search" value="点击发送邮件给朋友"/>
        </div>
      </form>
    </div>
    <!--tab-top-02-->
    <div class="add-inweb-friends" id="tab-top-02"></div>
  </div>
  <div class="tr cannel-box"><a href="#" class="cannel">关闭窗口</a></div>
</div>
<!--header-->

<%

            } else {
                response.setHeader("Location", "../home/welcome.jsp");
                Cookie cookie = new Cookie("lastPage", request.getServletPath() 
                		+ "?" + request.getQueryString());   
                response.addCookie(cookie);
                out.write("<script>window.location.href='../home/welcome.jsp'</script>");
            }
%>
