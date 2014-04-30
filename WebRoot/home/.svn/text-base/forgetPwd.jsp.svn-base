<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.apache.commons.mail.EmailException"%>
<%@  page import="org.apache.commons.mail.HtmlEmail"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="./js_css_include.html" %>
<script src="../js/jquery-powerFloat.js" type="text/javascript" ></script>
<link rel="stylesheet" type="text/css" href="../css/index-base.css" />
<link rel="stylesheet" type="text/css" href="../css/powerFloat.css" />
</head>
<body class="wraper">
<%
    request.getSession().setAttribute("userId", null);
    request.getSession().setAttribute("bizId", null);
    request.getSession().setAttribute("role", null);
    request.getSession().invalidate(); 
    
    String email = AttrParser.getParaStr(request, "email");
    String userType = AttrParser.getParaStr(request, "userType");
    //String newPwd = String.valueOf(new Date().getTime());
    String newPwd = AttrParser.getParaStr(request, "newPwd");
    String encryPwd = AttrParser.getParaStr(request, "encryPwd");
    
    HtmlEmail vMail = new HtmlEmail();       
    vMail.setTLS(true);            
    vMail.setHostName("smtp.gmail.com");          
    vMail.setAuthentication("eshunjian@gmail.com", "yubao8412");       
    vMail.setFrom("eshunjian@gmail.com");           
    vMail.setCharset("UTF-8");                         
    vMail.setSubject("朋互网密码重置");     
   
    vMail.setHtmlMsg("Hi,<br>您的新密码为" + newPwd + "<a href='www.penghoo.com'>www.penghoo.com</a>请登录后尽快修改");     
    String forgetPwdResult = "";

    if (userType.equals("user")) {
    	IUserDAO dao = new UserDAOImpl();
    	EsjUserInfo user = dao.findUserByEmail(email);
        try {
            vMail.addTo(email);
            vMail.send();
            forgetPwdResult = "新密码已经发送到您的邮箱，请查收";
            user.setPassword(encryPwd);
            dao.updateProfile(user);
        } catch (Exception e) {
        	e.printStackTrace();
        	forgetPwdResult = "新密码重置失败";
        }

    } else if (userType.equals("biz")) {
        IBizDAO dao = new BizDAOImpl();
        EsjBizInfo biz = dao.findUserByEmail(email);
        try {
            vMail.addTo(email);
            vMail.send();
            forgetPwdResult = "新密码已经发送到您的邮箱，请查收";
            biz.setPassword(encryPwd);
            dao.updateProfile(biz);
        } catch (Exception e) {
            forgetPwdResult = "新密码重置失败";
        }
    	
    }

%>
<div id="paper">
  <div class="index-header">
    <h1 class="index-logo"><a href="./"><img src="../images/logo.png" alt="e瞬间" title="e瞬间" /></a></h1>
    <div class="web-title"></div>
  </div>
  <div id="content" class="index-content">
    <div class="l login-form">
      <form action="./forgetPwd.jsp" id="resetForm" method="post">
        <h3 class="title-h3">找回密码</h3>
        <p>
          <label for="email">登陆邮箱</label>
          <input id="email" name="email" type="text" class="required ipt-text-bor" />
        </p>
        <div class="cl index-p">
          <label for="user-type">账户类型</label>
          <p class="bor-rads">
            <input id="" name="userType" type="radio" value="user" checked="checked" />
            个人
            <input id="" name="userType" type="radio" value="biz"/>
            商家</p>
        </div>
        <div class="index-p">
          <input type="hidden" name="newPwd" id="newPwd" value=""/>
          <input type="hidden" name="encryPwd" id="encryPwd" value=""/>
          <input type="submit" id="btnLogin" value="重置" class="btn-02 l" 
            onclick="newPwd.value=new Date().getTime();encryPwd.value=hex_md5(newPwd.value);this.value='发送中'"/>
          <a href="./welcome.jsp">登录页面</a>
        </div>
      </form>
    </div>
    <div id="beta" class="r login-side">
        <span id="forgetPwdResult"><%=forgetPwdResult %></span>
        
    </div>
  </div>
  <div class="index-tip">
    <ul>
      <li><img src="../images/index-tip01.png" alt="tip"></li>
      <li><img src="../images/index-tip02.png" alt="tip"></li>
      <li><img src="../images/index-tip03.png" alt="tip"></li>
      <li><img src="../images/index-tip04.png" alt="tip"></li>
    </ul>
  </div>
  <div id="footer">
    <p class="foot-nav">Build 2011-04-28<a href="#">关于我们</a> <a href="shopmanager.jsp">使用e瞬间</a> <a href="#" class="track">帮助</a> <a href="#">隐私政策</a> <a href="#">联系我们</a> </p>
    <p class="foot-copy">e瞬间©2011  浙ICP证090254号</p>
  </div>
</div>
</body>
</html>
