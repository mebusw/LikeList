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
<link rel='stylesheet' type='text/css' href='../stylesheet/bmap.css'>
<script type='text/javascript' src='../js/bmap.js'></script>
<script src="../js/home_userShop.js" type="text/javascript"></script>
<script src="../js/timeCountDown.js" type="text/javascript"></script>
<script src="../js/feed.js" type="text/javascript"></script>
</head>

<body>
<div id="container">
  <%@include file="./_JHeader.jsp" %>
  <div id="main" class="content">
    <%@include file="./_JLeftSide.jsp" %>
    
    <!--including begin -->
    
    <%
        int shopId = AttrParser.getParaInt(request, "shopId");
		EsjShop shop = shopUserDao.findShop(shopId);
        EsjShopDiscount deal = shopUserDao.findDeals(shopId).get(0);
        EsjShopGrouprate gr = shopUserDao.findGrouprates(shopId).get(0);
                
    %>
    <div id="container2" class="main">
      <%@include file="./_JSearch.jsp" %>
      <div id="content" class="main-item">
        <input id="shopId" type="hidden" value="<%=shopId %>"/>
        <input id="commentOffset" type="hidden" value="0"/>
        <input id="latitude" type="hidden" value="<%=shop.getLatitude() %>"/>
        <input id="longitude" type="hidden" value="<%=shop.getLongitude() %>"/>
        <div id="notice-system"> </div>
        <div id="newsfeed-module-box" class="newsfeed-module-box box">
          <div class="feed-module"> </div>
        </div>
      </div>
      <!--tabs begin-->
      <div id="tabs"  class="tab-main">
        <ul class="tab-head tab-main-head">
          <li><a href="#tabs-1" rel="tabs-1">交通导航</a></li>
          <li><a href="#tabs-2" id="tab2" rel="tabs-2">客户点评</a></li>
          <li><a href="#tabs-3" rel="tabs-3">关于我们</a></li>
          <li><a href="#tabs-4" rel="tabs-4">活动优惠</a></li>
          <li><a href="#tabs-5" rel="tabs-5">团购活动</a></li>
        </ul>
        <div class="tab-art tab-main-art"> 
          <!--tabs-1 begin-->
          <div id="tabs-1">
            <div style="width: 520px; height: 340px; border: 1px solid gray" id="mapContainer"> </div>
          </div>
          <!--tabs-1 end--> 
          <!--tabs-2 begin-->
          <div id="tabs-2" class="feed-list floatFix ui-tabs-panel ui-widget-content ui-corner-bottom">
            <div class="business_comments_content grid_9">
              <ul id="more_comments_ul">
                <!-- to be inserted -->
              </ul>
            </div>
            <div class='more-feed'><a id="more-comment" href="#" class="more_listings">更多评论</a></div>
          </div>
          <!--tabs-2 end--> 
          <!--tabs-3 begin-->
          <div id="tabs-3"> </div>
          <!--tabs-3 end--> 
          <!--tabs-4 begin-->
          <div id="tabs-4">
            <div class="deal">
              <div class="deal-detail">
                <h2><%=deal.getSubject() %></h2>
                <div class="deal-con"><%=deal.getContent() %></div>
                <div class="deal-time">
                  <p>时间：<%=sdf.format(deal.getTimeFrom()) %>-<%=sdf.format(deal.getTimeTo()) %></p>
                </div>
                <div class="deal-percent">折扣：<%=deal.getPercent() %></div>
              </div>
              <div class="deal-img"><img src="<%=deal.getImagePath() %>" height="80" width="80"/></div>
              <p class="cl"></p>
            </div>
          </div>
          <!--tabs-4 end--> 
          <!--tabs-5 begin-->
          <div id="tabs-5">
            <div class="group">
              <h4><span class="fr-red"><%=gr.getSubject() %></span> <a href="#"><%=gr.getContent() %></a></h4>
              <p class="group-sort">1</p>
              <div class="group-info">
                <div class="group-left">
                  <div class="group-fav">
                    <p class="group-btn"><span class="now-price">￥<%=gr.getCurPrice() %></span> <a href="alipay.jsp?shopId=<%=shopId %>&grId=<%=gr.getGrouprateId() %>&price=<%=gr.getCurPrice() %>&subject=<%=gr.getSubject() %>" class="btn-buy" target="_blank"></a> </p>
                    <div class="group-save">
                      <p>原价<br>
                        <del><%=gr.getOrigPrice() %></del></p>
                      <p>折扣<br>
                        <%=String.format("%1.1f", gr.getCurPrice() / gr.getOrigPrice() * 10) %>折</p>
                      <p class="fr-red">节省<br>
                        <%=gr.getOrigPrice() - gr.getCurPrice()  %></p>
                    </div>
                  </div>
                  <div class="group-time">距离本次团购结束还有：
                    <p id="group-time"><span id="day"></span>天<span id="hour"></span>小时<span id="mini"></span>分<span id="sec"></span>秒</p>
                    <script type="text/javascript">
					      var obj = {
									 sec: document.getElementById("sec"),
									 mini: document.getElementById("mini"),
									 hour: document.getElementById("hour"),
									 day: document.getElementById("day")
								}
                          fnTimeCountDown("<%=sdf.format(gr.getTimeTo()) %>", obj);
                      </script> 
                  </div>
                  <div class="group-purchaser">
                    <p class="tc"><strong>已经有<%=tradeDao.grPaidCount(gr.getGrouprateId()) %>人购买</strong></p>
                    <p class="group-succeed">团购已成功，还可以继续购买..</p>
                    <p>最低团购人数：<%=gr.getMinMember() %>人</p>
                  </div>
                </div>
                <div class="group-right">
                  <div class="group-show"><img src="<%=gr.getImagePath() %>" alt="" width="440" height="280"></div>
                  <div class="group-poster">全城最低</div>
                  <div class="group-address"></div>
                </div>
                <p class="cl"></p>
              </div>
              <div class="group-detail"></div>
            </div>
          </div>
          <!--tabs-5 end--> 
        </div>
      </div>
      <!--tabs end-->
      <div id="feed-recommend-content-box" class="feed-recommend-content-box box"></div>
    </div>
    
    <!--including end --> 
    
  </div>
  <%@include file="./_JFooter.jsp" %>
</div>
<%@include file="./_JPopup.jsp" %>
</body>
</html>
