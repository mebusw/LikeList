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
	    int offset = AttrParser.getParaInt(request, "offset");
        int pageSize = AttrParser.getParaInt(request, "pageSize");   
	    keyword = AttrParser.getParaStr(request, "keyword");
        category1 = AttrParser.getParaStr(request, "category1");
        province = AttrParser.getParaStr(request, "province");
        city = AttrParser.getParaStr(request, "city");
        district = AttrParser.getParaStr(request, "district");

        
        long searchTotal = shopUserDao.searchShopCount(uid, keyword, category1, null,
        		province, city, district);
        long dealTotal = shopUserDao.searchDealCount(uid, keyword, category1, null,
                province, city, district);
        
        
        
%>
    <div id="container2" class="main">
      <%@include file="./_JSearch.jsp" %>
      <div id="content" class="x-prefetchframecontent">
        <div id="notice_system"></div>
        <div id="newsfeed-module-box" class="newsfeed-module-box box">
          <div class="feed-module"> 
            <!--tabs begin-->
            <div id="tabs"  class="tab-main">
              <input id="searchOffset" value="<%=offset %>" type="hidden"/>
              <input id="searchTotal" value="<%=searchTotal%>" type="hidden" />
              <input id="dealOffset" value="<%=offset %>" type="hidden"/>
              <input id="dealTotal" value="<%=dealTotal%>" type="hidden" />
              <ul  class="tab-head tab-main-head">
                <li><a href="#tabs-1" rel="tabs-1">搜索结果(<%=searchTotal %>)</a></li>
                <li><a href="#tabs-2" rel="tabs-2">打折优惠(<%=dealTotal %>)</a></li>
              </ul>
              <div class="tab-art tab-main-art"> 
                <!--tabs-1 begin-->
                <div id="tabs-1">
                  <div class="feed-list" id="search-shop"></div>
                </div>
                <!--tabs-1 end--> 
                <!--tabs-2 begin-->
                <div id="tabs-2"> 
                    <div class="feed-list" id="search-deal"></div>
                </div>
                <!--tabs-2 end--> 
              </div>
            </div>
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
<script src="../js/home_search.js" type="text/javascript"></script>
</body>
</html>
