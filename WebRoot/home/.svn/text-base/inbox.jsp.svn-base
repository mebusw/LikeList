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
<script src="../js/home_inbox.js" type="text/javascript"></script>
<script src="../js/jquery.autocomplete.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../stylesheet/jquery.autocomplete.css" />
</head>

<body>
<div id="blueBar" class=""></div>
<div id="container">
  <%@include file="./_JHeader.jsp" %>
  <div id="main"  class="content">
    <%@include file="./_JLeftSide.jsp" %>
    
    <!--including begin -->
    <%
        final int SHOPS_ONE_PAGE = 2;
        
        String _offset = request.getParameter("offset");
        int offset = (null == _offset) ? 0 : Integer.parseInt(_offset);

        //////////Search Result//////
        
        String _searchCount = request.getParameter("searchCount");
        long searchCount;
        if (null == _searchCount)
            searchCount = smsDao.findSmsInboxCount(uid);   
        else 
            searchCount = Long.parseLong(_searchCount);
        
        List<?> u2uSmsList = smsDao.findSmsInboxByPage(uid,
                offset, SHOPS_ONE_PAGE);
                
        pageContext.setAttribute("u2uSmsList", u2uSmsList, PageContext.PAGE_SCOPE); 
        
%>
    <div id="container2" class="main">
      <%@include file="./_JSearch.jsp" %>
      <div id="newsfeed-module-box" class="newsfeed-module-box box">
        <div class="feed-module" data-loadonscroll="true" data-host=""> 
          <!--tabs begin-->
          <div id="tabs"  class="tab-main">
            <ul  class="tab-head tab-main-head">
              <li><a href="#tabs-1" rel="tabs-1">收件箱</a></li>
              <li><a href="#tabs-2" rel="tabs-2">发件箱</a></li>
            </ul>
            <div class="tab-art tab-main-art">
              <div id="tabs-1" class="feed-list">
                <ul>
                  <logic:iterate id="u2uSmsBean" name="u2uSmsList"> 
                    <!--each feed begin-->
                    <logic:iterate id="SmsBean" name="u2uSmsBean" offset="0" length="1" > </logic:iterate>
                    <logic:iterate id="friendBean" name="u2uSmsBean" offset="1" length="1" > </logic:iterate>
                    <li class='comment_contents_li'>
                      <div class='l mr10'><a href="./likelist.jsp?friendId=<jsp:getProperty name='friendBean' property='userId'/>"> <span class='commenter_image'><img src="<jsp:getProperty name='friendBean' property='avatarDir'/>"/> <span class='sn-icon'></span></span></a> </div>
                      <div class='l'>
                        <div class='user_comment_carat'></div>
                        <span>
                        <jsp:getProperty name='friendBean' property='fullName'/>
                        <jsp:getProperty name="SmsBean" property="createTime"/>
                        </span> <span> <strong>
                        <jsp:getProperty name="SmsBean" property="subject"/>
                        </strong></span> <span>
                        <jsp:getProperty name="SmsBean" property="content"/>
                        </span>
                        <p><a href="#" class="fm_blue">回复</a></p>
                      </div>
                    </li>
                    
                    <!--each feed over--> 
                  </logic:iterate>
                </ul>
                <div id="searchNav" class="nav">
                  <%
                            for(long i = 0; i < searchCount / SHOPS_ONE_PAGE + 1; i++)  {
                                if(i * SHOPS_ONE_PAGE == offset)
                                    out.write("<strong> " + (i + 1) + " </strong>");
                                else
                                       out.write("<a href='?offset=" + (SHOPS_ONE_PAGE * i) + 
                                            "&searchCount=" + searchCount + "#'> " + (i + 1) + " </a>");
                            }
                        %>
                </div>
              </div>
              <div id="tabs-2"  class="feed-list">
                <div id="notice_system">
                  <div class="completed-con">
                    <form id="sendSms" autocomplete="off" method="post" action="../action/sendSms.jsp" >
                      <p>
                        <label>发送给：</label>
                        <input type="text" id="toList" name="toList"  class="text-input" />
                        <input name="friendId" type="hidden" />
                      </p>
                      <p>
                        <label>主题：</label>
                        <input type="text" name="subject" id="subject" class="text-input" />
                      </p>
                      <p>
                        <label>内容：</label>
                        <textarea name="content" rows="10" cols="60"></textarea>
                      </p>
                      <p class="sub-box">
                        <input type="submit" class="btn-input-gray" value="发送" />
                      </p>
                    </form>
                  </div>
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
  

<%@include file="./_JFooter.jsp" %>
</div>
<%@include file="./_JPopup.jsp" %>
</body>
</html>
