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
<%@include file="./js_css_include.html" %>
<script src="../js/jquery-powerFloat.js" type="text/javascript" ></script>
<script src="../js/home_welcome.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../css/index-base.css" />
<link rel="stylesheet" type="text/css" href="../css/powerFloat.css" />
</head>
<body class="wraper">
<%
    request.getSession().setAttribute("userId", null);
    request.getSession().setAttribute("bizId", null);
    request.getSession().setAttribute("role", null);
    request.getSession().invalidate(); 
%>
<div id="paper">
  <div class="index-header">
    <h1 class="index-logo"><a href="./"><img src="../images/logo.png" alt="e瞬间" title="e瞬间" /></a></h1>
    <div class="web-title"></div>
  </div>
  <div id="content" class="index-content">
    <div class="l login-form">
      <form action="../action/login.jsp" id="loginForm" method="post">
        <h3 class="title-h3">登录</h3>
        <p>
          <label for="email">登陆邮箱</label>
          <input id="email" name="email" type="text" class="required ipt-text-bor" />
        </p>
        <p>
          <label for="password">密码</label>
          <input id="password" type="password" name="password" onChange="value=hex_md5(value)" class="ipt-text-bor" />
          <input type="hidden" name="remember" value="true" />
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
          <input type="submit" id="btnLogin" value="登录" class="btn-02 l" />
          <a href="forgetPwd.jsp?email=&userType=&newPwd=&encryPwd="><strong>忘记密码</strong> </a> </div>
      </form>
    </div>
    <div id="beta" class="r login-side">
      <form action="../action/signup.jsp" id="signupForm" method="post">
        <h3 class="title-h3">快速注册</h3>
        <p>
          <label for="regEmail">登陆邮箱</label>
          <input id="regEmail" name="regEmail" type="text" class="ipt-text" />
          <a href="#" id="noemail" rel="">还没邮箱？</a> </p>
        <p>
          <label for="regFullName">用户昵称</label>
          <input id="regFullName" name="regFullName" type="text" class="ipt-text" />
        </p>
        <div>
          <p class="l">
            <label for="regPassword1">密码</label>
            <input id="regPassword1" name="regPassword1" type="password" class="ipt-text"  />
          </p>
          <p class="l">
            <label for="regPassword2">重复密码</label>
            <input id="regPassword2" name="regPassword2" type="password" class="ipt-text"  />
          </p>
	       <div class="cl index-p">
	         <label for="user-type">账户类型</label>
			         <p class="bor-rads">
			           <input id="" name="userType" type="radio" value="user" checked="checked" />
			           个人
			           <input id="" name="userType" type="radio" value="biz"/>
			           商家</p>
	       </div>
        </div>
        <div class="index-p cl">
          <input type="submit" id="btnSignup" value="注册" class="btn-02 l" />
        </div>
      </form>
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
