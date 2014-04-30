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
<%@include file="./js_css_include.html" %>
<script src="../js/home_userProfile.js" type="text/javascript"></script>
</head>

<body>
<div id="blueBar" class=""></div>
<div id="container">
  <%@include file="./_JHeader.jsp" %>
  <div id="main" class="content">
    <%@include file="./_JLeftSide.jsp" %>
    <!--including begin -->
    <%
            
    if (uid > 0) {    
        EsjUserInfo pf = userDao.readProfile(uid);
    %>
    <div id="container2" class="main">
    <%@include file="./_JSearch.jsp" %>
      <div id="content" class="container_16 floatFix">
        <div id="main_content" class="grid_13"> 
          <!-- <h2 class="title">个人中心</h2>--> 
          <!-- tabs begin -->
          <div id="account_setings_tabs" class="tab-main">
            <ul class="tab-head tab-main-head">
              <li><a href="#ma_profile" rel="ma_profile"><span>我的信息</span></a></li>
              <li><a id="ma-password" href="#ma_password" rel="ma_password"><span>密码中心</span></a></li>
              <li><a href="#ma_coupons" rel="ma_coupons"><span>优惠券</span></a></li>
            </ul>
            <div class="tab-art tab-main-art">
              <div id="ma_profile" class="">
                <h2>我的信息</h2>
                <div class="l" style="width:10%; text-align:center;">
                  <div class="image">
                    <div class="profile-avatar"> <img id="profile-avatar" src="<%=avatarDir %>" alt="avenste" class="profile-avatar"/> </div>
                    <p> <a class="photo-update-btn bt-round" id="1807350"><span id="btnUploadAvatar" style="cursor:pointer;">上传头像</span></a> </p>
                    <span id="image_div" class="image_error"></span> </div>
                </div>
                <!-- end .left -->
                <div class="r" style="width:85%;">
                  <form action="../action/updateUserProfile.jsp" method="post" id="basic-info-form">
                    <div class="completed-con">
                      <div id="error" class="error"></div>
                      <div id="updateP" class="success"></div>
                      <p>
                        <label for="email">邮箱地址</label>
                        <input type="text" class="text-input" value="<%=pf.getEmail()%>" size="32" maxlength="50" readonly="readonly"/>
                        <span>这也是你的登入ID </span> </p>
                      <p>
                        <label for="fullName">昵称</label>
                        <input type="text" value="<%=pf.getFullName()%>" name="fullName" maxlength="20" class="required text-input" />
                      </p>
                      <p>
                        <label for="seekHelp">求助</label>
                        <input type="text" value="<%=pf.getSeekHelp()%>" name="seekHelp" maxlength="20" class="text-input" />
                      </p>
                      <p>
                        <label for="residency">居住城市</label>
                        <input type="text" value="<%=pf.getResidency()%>" name="residency" maxlength="20" class="required text-input" />
                      </p>
                      <p>
                        <label for="company">支付宝账户</label>
                        <input name="alipayAccount" value="<%=pf.getAlipayAccount() %>" class="text-input"/>
                      </p>
                      <p>
                        <label for="phone">手机</label>
                        <input name="phone" value="<%=pf.getPhone() %>" class="text-input"/>
                      </p>                      
                      <p>
                        <label for="birthDay">生日</label>
                        <input name="birthDay" id="birthDay" value='<%=new SimpleDateFormat("MM/dd/yyyy").format(pf.getBirthDay()) %>' readonly="readonly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" class="text-input"/>
                      </p>
                      <p>
                        <label for="sex">性别</label>
                        <input type="radio" name="sex" value="false" <%=pf.getMarried()?"checked='checked'":"" %>/>
                        男
                        <input type="radio" name="sex" value="true" <%=!pf.getMarried()?"checked='checked'":"" %>/>
                        女 </p>
                      <p>
                        <label for="university">学校</label>
                        <input type="text" value="<%=pf.getUniversity()%>" name="university" maxlength="20" class="required text-input" />
                      </p>
                      <p>
                        <label for="companyName">公司</label>
                        <input type="text" value="<%=pf.getCompanyName()%>" name="companyName" maxlength="20" class="required text-input" />
                      </p>
                      <p>
                        <label for="hobby">兴趣爱好</label>
                        <input type="text" value="<%=pf.getHobby()%>" name="hobby" maxlength="20" class="required text-input" />
                      </p>

                      <p class="sub-box">
                        <input type="submit" class="btn-input-gray" value="确认修改" />
                      </p>
                    </div>
                  </form>
                </div>
                <p class="cl"></p>
              </div>
              <!-- end  #profile -->
              <div id="ma_password">
                <h3>修改密码</h3>
                <form action="../action/updateUserPwd.jsp" method="post" id="change-password-form">
                  <div id="divPasswordHint" class="hintDiv"> <p>密码6-12位，不能含有空格或特殊字符
                    </p>
                  </div>
                  <div id="pass" class="error"></div>
                  <div class="completed-con">
                      <p>
                        <label for="new_pass">原密码</label>
                        <input type="password" id="pass0" name="pass0" class="text-input" maxlength="12" />
                      </p>
                      <p>
                        <label for="new_pass">新密码</label>
                        <input type="password" id="pass1" name="pass1" class="text-input" maxlength="12" />
                      </p>
                      <p>
                        <label for="conf_pass">确认新密码</label>
                        <input type="password" id="pass2" name="pass2" class="text-input" maxlength="12" />
                      </p>
                      <p class="sub-box">
                        <input type="submit" class="btn-input-gray" value="确认修改" />
                      </p>
                  </div>
                </form>
              </div>
              <!-- end ma_email_settings -->
              <div id="ma_coupons" class="floatFix ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <h2>我的优惠券</h2>
                <p>你还没购买优惠券.我们将向您发送ESJ优惠！</p>
              </div>
              <!-- end ma_coupons --> 
            </div>
          </div>
          <!-- end #tabs --> 
        </div>
      </div>
      <!--right sidebar reserved--> 
    </div>
    <% } %>
    <!--including end --> 
  </div>
  <%@include file="./_JFooter.jsp" %>
</div>
<%@include file="./_JPopup.jsp" %>
</body>
</html>
