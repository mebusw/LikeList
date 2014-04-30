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
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>朋互网</title>
<script src="../js/util.js" type="text/javascript"></script>
<script src="../js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$(".add-close").click(function(){
		$(this).parents("ul").hide();
	})
})
</script>
<style type="text/css">
/*card*/
.card-h {
	margin:0 auto;
	padding:6px 6px 15px 6px;
	border-bottom:#ececec solid 1px;
}
.card-trigger a {
	display:inline-block;
	height:20px;
	width:60px;
	margin-right:5px;
	text-align:center;
	border-radius:5px;
	background:-webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#fcfcfc));
	background:-moz-linear-gradient(top, #f2f2f2 0, #fcfcfc 100%);
}
.card {
	width:700px;
	border:#ACACAC solid 1px;
	margin:0 auto;
	border-radius:15px;
	padding:10px 0;
}
.card h2 {
	color:#006;
	font-size:18px;
	font-family:"微软雅黑";
	font-weight:600;
}
.card h3 {
	color:#006;
	font-size:14px;
	font-family:"微软雅黑";
	font-weight:600;
}
.card-item {
	padding:10px 30px 10px 10px;
	position:relative;
	border-bottom:#ececec solid 1px;
}
.card-item:last-child {
	border-bottom:none;
}
</style>
</head>

<body>
<%
        IShopUserDAO shopUserDao = new ShopUserDAOImpl();

        int shopId = AttrParser.getParaInt(request, "shopId");
        EsjShop shop = shopUserDao.findShop(shopId);
        EsjShopDiscount deal = shopUserDao.findDeals(shopId).get(0);
        EsjShopGrouprate gr = shopUserDao.findGrouprates(shopId).get(0);
        SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();
        
        String curUri = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI()+"?"+request.getQueryString();
        String makecarduri = "makecard.jsp?shopId=" + shopId + "&shopCarduri=" + curUri;
                
    %>
<div class="card">
  <div class="card-h">
    <h3 class="l">信息来自朋互网，<a href="/">www.penghoo.com</a></h3>
    <p class="r card-trigger"><a  href="<%=makecarduri %>" id="card-save">保存</a><a  href="#" id="card-transmit">转发</a><a  href="#" id="card-print">打印</a></p>
    <p class="cl"></p>
  </div>
  <ul class="card-item" id="card-1">
    <li>
      <h2><%=shop.getShopName() %></h2>
    </li>
    <li>地址：<%=shop.getFullAddress() %></li>
    <li>电话：<%=shop.getShopPhone() %></li>
    <li><a href="#" class="add-close fr-red">x</a></li>
  </ul>
  <ul class="card-item" id="card-2">
    <li>
      <h3>活动：<%=deal.getSubject() %></h3>
    </li>
    <li>内容：<%=deal.getContent() %></li>
    <li>从：<%=sdf.format(deal.getTimeFrom()) %></li>
    <li>到：<%=sdf.format(deal.getTimeTo()) %></li>
    <li>折扣：<%=deal.getPercent() %></li>
    <li><a href="#" class="add-close fr-red">x</a></li>
  </ul>
  <ul class="card-item" id="card-3">
    <li>
      <h3>团购：<%=gr.getSubject() %></h3>
    </li>
    <li>内容：<%=gr.getContent() %></li>
    <li>从：<%=sdf.format(gr.getTimeFrom()) %></li>
    <li>到：<%=sdf.format(gr.getTimeTo()) %></li>
    <li>原价：<%=gr.getOrigPrice() %></li>
    <li><b>现价：<%=gr.getCurPrice() %></b></li>
    <li><a href="#" class="add-close fr-red">x</a></li>
  </ul>
</div>
</body>
</html>
