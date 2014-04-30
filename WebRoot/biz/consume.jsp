<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.w3c.dom.Attr"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>消费券管理</title>
<%@include file="../home/js_css_include.html" %>
<script type="text/javascript" src="../js/main.js"></script>
<script src="../js/biz_index.js" type="text/javascript"></script>
</head>

<body>
<%@ include file="header.jsp"%>
<!--content-->
<div class="content"> 
  <!--aside-->
  <div class="aside">
    <p class="avatar"><a href="#"><img src="../images/no_photo.gif" width="154" height="154" title="商家名称" /></a></p>
  </div>
  <!--aside--> 
  <!--main right-->
  <div class="main">
    <%
    String code = AttrParser.getParaStr(request, "code");
    if (bid > 0) {
        EsjBizInfo bizInfo = bizDao.readProfile(bid);                       

    %>
    <h3>消费优惠券</h3>
    <div class="main-con"> <span class="main-con-tb">您的ID：<%=bizInfo.getEmail() %></span></div>
    <div class="main-box" id="shop-list">
     <i> <%=code %> </i>
<%
    EsjOrderInfo order = tradeDao.findGrByCode(code);
    if (null != order) {
	    order.setConsumed(true);
	    order.setConsumeTime(new Date());
	    tradeDao.updateOrder(order);
	    out.write("消费成功！");
	} else {
	    out.write("找不到这张券或者已经消费掉！");
	}

%>
    </div>
  </div>
  <!--main right-->
  <p class="cl"></p>
</div>
<!--content-->
<%@ include file="footer.jsp"%>
<!--add-shop-->


<div class="delay"></div>
<!--modify-biz-->
<%

            } else {
                response.setHeader("Location", "../home/welcome.jsp");
                out.write("<script>window.location='../home/welcome.jsp'</script>");
            }
%>

</body>
</html>