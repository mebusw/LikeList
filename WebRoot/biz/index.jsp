<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
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
<title>商家管理</title>
<%@include file="../home/js_css_include.html" %>
<script type="text/javascript" src="../js/main.js"></script>
<script src="../js/biz_index.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("#add-shop").click(function(){
		$("#add").popup();
	});
	$("#modify-btn").click(function(){
		$("#modify-biz").popup();
	});
	$("#updateBizProfileForm").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已更新");
                break;
            default:
                alert("更新失败");
            }
        }
	});        

	setHeight();
})
</script>
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
    if (bid > 0) {
        IBizDAO daoBiz = new BizDAOImpl();
        EsjBizInfo bizInfo = daoBiz.readProfile(bid);
	    IShopBizDAO dao = new ShopBizDAOImpl();
	    List<EsjShop> shops = dao.findMyShops(bid);
	    
        pageContext.setAttribute("shops", shops, PageContext.PAGE_SCOPE);               

    %>
    <h3>商家信息<a href="#" class="modify-btn" id="modify-btn">[修改商家信息]</a></h3>
    <div class="main-con"> <span class="main-con-tb">您的ID：<%=bizInfo.getEmail() %></span></div>
    <div class="main-box" id="shop-list">
      <logic:iterate id="s" name="shops"> 
        <!--a-feed 2-->
        <div class="a-feed">
          <div class="feed-con">
            <div class="feed-img l"><a href="#" class="photo-box photo-shop-trade"><img src="<bean:write name='s' property='shopAvatarPath'/>" width="70px" /></a>
              <p></p>
            </div>
            <div class="feed-msg l">
              <p class="feed-shop-title"><a href='shopmodify.jsp?shopId=<bean:write name="s" property="shopId" format=""/>'>
                <bean:write name="s" property="shopName"/>
                </a></p>
              <p class="feed-shop-info">
                <bean:write name="s" property="description"/>
              </p>
              <p>地址：
                <bean:write name="s" property="fullAddress"/>
              </p>
              <p>电话：
                <bean:write name="s" property="shopPhone"/>
              </p>
            </div>
            <div class="feed-likes r"> 
              <!--<p class="feed-add-likes">喜欢他</p>-->
              <p class="feen-likes-num"><strong><%=dao.getLikeCount(((EsjShop)s).getShopId()) %></strong>人喜欢</p>
              <div class="feed-likes-list">
                <ul>
                  <li><a href="#" title="用户名"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                  <li><a href="#" title="用户名"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                  <li><a href="#" title="用户名"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                  <li><a href="#" title="用户名"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                  <li><a href="#" title="用户名"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <!--a-feed 2 end--> 
      </logic:iterate>
      <p class="pl10"><a href="#" class="btn btn-gray-a" id="add-shop"><strong class="btn-text">添加新店铺</strong> </a> </p>
    </div>
  </div>
  <!--main right-->
  <p class="cl"></p>
</div>
<!--content-->
<%@ include file="footer.jsp"%>
<!--add-shop-->
<div class="add" id="add">
  <div class="add-con"> 
    <!--completed-con-->
    <div class="completed-con">
      <h3 class="pl10">添加新的店铺</h3>
      <form id="create-shop-form" action="../action/createShop.jsp">
      <p>
        <label for="shopmanagerName">店铺名称：</label>
        <input name="shopName" class="text-input required" id="shopName" size="30" />
        <input type="button" class="btn-input-gray" value="搜索该店铺是否已存在" id="searh-shop-title" />
      </p>
      <p>
        <label>店铺电子邮件：</label>
        <input name="shopEmail" type="text" class="text-input required" size="30" />
      </p>
      <p>
        <label>店铺联系电话：</label>
        <input name="shopPhone" class="text-input required" size="30" />
        <span class="tip">请输入准确的联系电话号码。</span> 
      </p>
      <p>
        <label>分类：</label>
        <select id="category1" name="category1">
          <%
	          List<String> cat1 = shopBizDao.findCategory(1);
	          for (String c : cat1){
                  out.write(String.format("<option value='%s' %s>%s</option>",
                          c, category1.equals(c)?"selected='selected'":"", c));
                  
              }
          %>
        </select>
      </p>
      <p class="sub-box">
        <input type="hidden" name="shopPwd" value=""/>
        <input type="submit" class="btn-input-gray" value="确定添加" />
        <input type="reset" class="btn-input-gray" value="重新填写" />
      </p>
    </form>
    </div>
    <!--completed-con--> 
  </div>
  <a href="#" class="add-close"><img src="../images/remove.png" alt="" /></a>
  <div class="add-bg"></div>
</div>
<div class="delay"></div>
<!--add-shop--> 
<!--modify-biz-->
<div class="add" id="modify-biz">
  <div class="add-con"> 
    <!--completed-con-->
    <div class="completed-con">
      <form action="../action/updateBizProfile.jsp" method="get" id="updateBizProfileForm">
      <h3 class="pl10">修改商家信息</h3>
      <p>
        <label>商家账户：</label>
        <input type="text" class="text-input" readonly="readonly" size="30" value="<%=bizInfo.getEmail() %>"/>
      </p>
      <p>
        <label>支付宝账号：</label>
        <input type="text" class="text-input" name="alipayAccount" size="30" value="<%=bizInfo.getAlipayAccount() %>"/>
      </p>
      <p>
        <label>真实姓名：</label>
        <input type="text" class="text-input" name="fullName" size="30" value="<%=bizInfo.getFullName() %>"/>
      </p>
      <p>
        <label>身份证号码：</label>
        <input type="text" class="text-input" name="identifyCard" size="30" value="<%=bizInfo.getIdentifyCard() %>"/>
      </p>
      <p>
        <label>联系电话：</label>
        <input type="text" class="text-input" name="phone" size="30" value="<%=bizInfo.getPhone() %>"/>
        <span class="tip">请输入准确的联系电话号码。</span> </p>
      <p class="sub-box">
        <input type="submit" class="btn-input-gray" value="确定修改" />
        <input type="reset" class="btn-input-gray" value="重新填写" />
      </p>
      </form>  
    </div>
    <!--completed-con--> 
  </div>
  <a href="#" class="add-close"><img src="../images/remove.png" alt="" /></a>
  <div class="add-bg"></div>
</div>
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