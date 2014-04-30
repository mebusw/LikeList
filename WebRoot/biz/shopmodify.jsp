<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@page import="org.w3c.dom.Attr"%>
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
       <link rel='stylesheet' type='text/css' href='../stylesheet/bmap.css'>
       <script src='../js/bmap.js' type='text/javascript'></script>
       
       <script src="../js/biz_shopmodify.js" type="text/javascript"></script>
       
<script type="text/javascript">
$(function(){
	$(".aside-nav li a").click(function(){
		$(this).parent().siblings().removeClass("cur");
		$(this).parent().addClass("cur");
	})
	$("#tab").mytab();
	$("#tab2").mytab({tab:"#tab2"});
	$("#tab2").mytab({tab:"#tab3"});
	setHeight();
	$("#dealTimeFrom").click(function(){
		$(this).setCalendarOffset();
	});
	$("#dealTimeTo").click(function(){
		$(this).setCalendarOffset();
	});
    $("#grTimeFrom").click(function(){
        $(this).setCalendarOffset();
    });
    $("#grTimeTo").click(function(){
        $(this).setCalendarOffset();
    });

    $("#updateGrouprateImageForm").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已上传");
                $("#grImagePath").attr("value", data.files[0].filePath);
                $("#grImage").attr("src", data.files[0].filePath);
                
                break;
            default:
                alert("上传失败，错误代码=" + data.ec);
            }
        }
    });

    $("#updateDealImageForm").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已上传");
                $("#dealImagePath").attr("value", data.files[0].filePath);
                $("#dealImage").attr("src", data.files[0].filePath);
                
                break;
            default:
                alert("上传失败，错误代码=" + data.ec);
            }
        }
    });
    
	
})
</script>
</head>
<%
	

%>
<body>
<%@ include file="header.jsp"%>
<!--content-->
<div class="content"> 
  <!--aside-->
  <div class="aside"> 
    <!--<p class="into"><a href="shopmanager.jsp">进入商铺主页</a></p>-->
    <h3>我的店铺</h3>
    <ul class="aside-nav">
      <%
          int shopId = Integer.parseInt(request.getParameter("shopId"));
	      SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

          if (bid > 0) {

		      List<EsjShop> shops = shopBizDao.findMyShops(bid);
	          EsjShop shop = shopBizDao.findShop(shopId);

	          if (shop.getBizId() == bid) {
                  EsjShopDiscount deal = shopBizDao.findDeals(shopId).get(0);
                  EsjShopGrouprate gr = shopBizDao.findGrouprates(shopId).get(0);
		          List<Long> reputation = shopBizDao.shopReputation(bid, shopId);
		          String cls;
			      for(EsjShop s : shops)   {
			    	  if (s.getShopId()==shopId){
			    		  cls = "class='cur'";
			    	  }else
			    		  cls="";
			    	  
			    	  out.write(String.format("<li %s><a href='?shopId=%d'>%s</a></li>", 
			    			  cls, s.getShopId(), s.getShopName()));
			      }
	      
      %>
    </ul>
    <input id="shopId" value="<%=shopId %>" type="hidden" />
  </div>
  <!--aside--> 
  <!--main right-->
  <div class="main">
    <div class="tab-main" id="tab">
      <ul class="tab-head tab-main-head">
        <li><a href="#" rel="tab-dt">商家动态</a></li>
        <li><a href="#" rel="tab-gg">管理打折信息</a></li>
        <li><a href="#" rel="tab-xx">编辑商家信息</a></li>
        <li><a href="#" rel="tab-gp">管理团购信息</a></li>
      </ul>
      <div class="tab-art tab-main-art">
        <div id="tab-dt"> 
          <!--shop-feed-->
          <div class="a-feed">
            <h4 class="feed-h">当前店铺预览<span><a href="index.jsp">返回商家主页</a>|<%=shop.getApproved()?"已审核":"审核未通过" %></span></h4>
            <div class="feed-con">
              <div class="feed-img l"><a href="#" class="photo-box photo-shop-trade"><img src="<%=shop.getShopAvatarPath() %>" height="70px" width="70px" /></a>
                <p><a id="btnUploadShopAvatar" >上传图片</a></p>
              </div>
              <div class="feed-msg l">
                <p class="feed-shop-title"><%=shop.getShopName() %></p>
                <p class="feed-shop-info"><%=shop.getDescription() %></p>
                <p>地址：<%=shop.getFullAddress() %></p>
                <p>电话：<%=shop.getShopPhone() %></p>
              </div>
              <div class="feed-likes r">
                <p class="feen-likes-num"><strong><%=reputation.get(0).longValue() %></strong>人喜欢</p>
                <div class="feed-likes-list">
                  <ul>
                    <li><a href="#"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                    <li><a href="#"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                    <li><a href="#"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                    <li><a href="#"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                    <li><a href="#"><img src="../images/no_photo.gif" height="26" width="26" /></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--shop-feed--> 
          <!--shop-article-->
          <div class="shop-article">
            <div class="shop-msg"> 
              <!--shop-msg-box-->
              <div class="shop-msg-box">
                <h4>商家信誉</h4>
                <div class="shop-msg-con">
                  <p class="b"><%=reputation.get(0).longValue() %> 喜欢您的人</p>
                  <p><%=reputation.get(1).longValue() %> 想尝试您的人</p>
                  <p><%=reputation.get(2).longValue() %> 客户的朋友</p>
                </div>
              </div>
              <!--shop-msg-box-->
              <div class="shop-msg-box">
                <h4>商家绩效</h4>
                <div class="shop-msg-con" id="tab2">
                  <div class="tab-head tab-msg-head"><a href="#" rel="tab-msg-day">日</a>|<a href="#" rel="tab-msg-week">周</a>|<a href="#" rel="tab-msg-month">月</a> </div>
                  <div class="tab-art tab-msg-art"> 
                    <!--tab-msg-day-->
                    <div id="tab-msg-day">
                      <div class="shop-msg-item">
                        <h5>查看商家信息</h5>
                        <p><%=reputation.get(4).longValue() %> 本日</p>
                        <p><%=reputation.get(5).longValue() %> 昨日</p>
                      </div>
                      <div class="shop-msg-item">
                        <h5>点击进入您的商铺</h5>
                        <p><%=reputation.get(6).longValue() %> 本日</p>
                        <p><%=reputation.get(7).longValue() %> 昨日</p>
                      </div>
                      <div class="shop-msg-item">
                        <h5>点击您的网址</h5>
                        <p><%=reputation.get(8).longValue() %> 本日</p>
                        <p><%=reputation.get(9).longValue() %> 昨日</p>
                      </div>
                    </div>
                    <!--tab-msg-week-->
                    <div id="tab-msg-week">
                      <div class="shop-msg-item">
                        <h5>查看商家信息</h5>
                        <p><%=reputation.get(10).longValue() %> 本周</p>
                        <p><%=reputation.get(11).longValue() %> 上周</p>
                      </div>
                      <div class="shop-msg-item">
                        <h5>点击进入您的商铺</h5>
                        <p><%=reputation.get(12).longValue() %> 本周</p>
                        <p><%=reputation.get(13).longValue() %> 上周</p>
                      </div>
                      <div class="shop-msg-item">
                        <h5>点击您的网址</h5>
                        <p><%=reputation.get(14).longValue() %> 本周</p>
                        <p><%=reputation.get(15).longValue() %> 上周</p>
                      </div>
                    </div>
                    <!--tab-msg-month-->
                    <div id="tab-msg-month">
                      <div class="shop-msg-item">
                        <h5>查看商家信息</h5>
                        <p><%=reputation.get(16).longValue() %> 本月</p>
                        <p><%=reputation.get(17).longValue() %> 上月</p>
                      </div>
                      <div class="shop-msg-item">
                        <h5>点击进入您的商铺</h5>
                        <p><%=reputation.get(18).longValue() %> 本月</p>
                        <p><%=reputation.get(19).longValue() %> 上月</p>
                      </div>
                      <div class="shop-msg-item">
                        <h5>点击您的网址</h5>
                        <p><%=reputation.get(20).longValue() %> 本月</p>
                        <p><%=reputation.get(21).longValue() %> 上月</p>
                      </div>
                    </div>
                    <!--tab-msg-month--> 
                  </div>
                </div>
              </div>
              <!--shop-msg-box end--> 
            </div>
            <div class="shop-comments r">
              <h3>最新店铺评论</h3>
              <%
              List<EsjU2sComment> comments = commentDao.findCommentsByPage(shopId, 0 , 6);
              pageContext.setAttribute("comments", comments, PageContext.PAGE_SCOPE);               

              %>
              <logic:iterate id="c" name="comments">
                <div class="shop-comments-item">
                  <p class="shop-comments-info">
                    <bean:write name="c" property="content"/>
                  </p>
                  <p class="shop-comments-url"></p>
                </div>
              </logic:iterate>
            </div>
          </div>
          <!--shop-article--> 
        </div>
        <!--tab-gg-->
        <div id="tab-gg">
          <div class="shop-activities">
          </div>
          <!--add-activities-->
          <div class="add-activities">
            <h3>添加打折活动</h3>
            <form action="../action/updateDeal.jsp" method="post" id="updateDealForm">
              <div class="completed-con">
                <p>
                  <label>打折标题：</label>
                  <input type="text" class="text-input" name="subject" value="<%=deal.getSubject() %>"/>
                </p>
                <p>
                  <label>开始时间：</label>
                  <input type="text" class="text-input" name="timeFrom" id="dealTimeFrom" readonly="readOnly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" value="<%=sdf.format(deal.getTimeFrom()) %>"/>
                </p>
                <p>
                  <label>结束时间：</label>
                  <input type="text" class="text-input" name="timeTo" id="dealTimeTo" readonly="readOnly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" value="<%=sdf.format(deal.getTimeTo()) %>"/>
                </p>
                <p>
                  <label>折扣率：</label>
                  <input type="text" class="text-input" name="percent" value="<%=deal.getPercent() %>"/>
                  % <span>请输入折扣率</span> </p>
                <p>
                  <label>打折描述：</label>
                  <textarea rows="6" cols="60" name="content"><%=deal.getContent() %></textarea>
                </p>
                <p class="sub-box">
                  <input type="hidden" id="dealId" name="dealId" value="<%=deal.getShopDiscountId() %>"/>
                  <input type="submit" class="input-btn" value="确认" />
                </p>
              </div>
            </form>
            <div class="completed-con">
                <p class="sub-box">
                  <img src="<%=deal.getImagePath() %>" height="180" width="180"/>
                  <a id="btnUploadDealAvatar" >上传图片</a>                  
                </p>            
            </div>
          </div>
        </div>
        <!--tab-xx-->
        <div id="tab-xx">
          <div class="shop-modify" id="tab3">
            <div class="tab-head tab-modify-head"><a href="#" rel="tab-modify-details">管理详细</a><!--|<a href="#" rel="tab-modify-recommend">组织推荐</a>--></div>
            <div class="tab-art">
              <div id="tab-modify-details"> 
                <!--completed-con-->
                <div class="completed-con">
                  <form action="../action/updateShopProfile.jsp" method="post" id="updateShopProfileForm">
                    <h4>修改店铺详细信息</h4>
                    <p>
                      <label>店铺名称：</label>
                      <input type="text" class="text-input" name="shopName" size="30" value="<%=shop.getShopName() %>"/>
                      <input type="hidden" class="text-input" name="fullAddress" id="fullAddress" readonly="readonly" size="30" value="<%=shop.getFullAddress() %>"/>
                      <input type="hidden" id="longitude" name="longitude" value="<%=shop.getLongitude() %>" readonly="readonly"/>     
                      <input type="hidden" id="latitude" name="latitude" value="<%=shop.getLatitude() %>" readonly="readonly"/>    
                    </p>
                    <p>
                      <label>店铺地址：</label>
                      <select id="province" name="province"></select>
                      <select id="city" name="city"></select>
                      <select id="district" name="district"></select>
                      <script type="text/javascript">
                          new PCAS("province", "city", "district", 
                                  "<%=shop.getProvince() %>", "<%=shop.getCity() %>", "<%=shop.getDistrict() %>" );
                      </script>
                      <input id="street" name="street" class="text-input" value="<%=shop.getStreet() %>" />
                    </p>
                      
                    <p>
                      <label>联系电话：</label>
                      <input type="text" class="text-input" name="shopPhone" size="30" value="<%=shop.getShopPhone() %>"/>
                      <span class="tip">请输入准确的联系电话号码。</span> </p>
                    <p>
                      <label>电子邮件：</label>
                      <input type="text" class="text-input" name="shopEmail" size="30" value="<%=shop.getShopEmail() %>"/>
                      <span class="tip">请输入准确的联系电子邮件。</span> </p>
                    <p>
                      <label>店铺网站：</label>
                      <input type="text" class="text-input" name="website" size="30" value="<%=shop.getWebsite() %>"/>
                    </p>
                    <p>
                      <label>店铺类型：</label>
                      <select id="category1" name="category1">
                        <%
					    List<String> cat1 = shopBizDao.findCategory(1);
					    for (String c : cat1) {
					            out.write(String.format("<option value='%s' %s>%s</option>",
					                    c, shop.getCategory1().equals(c)?"selected='selected'":"", c));
					            
					    }
					    %>
                      </select>
                    </p>
                    <p>
                      <label>店铺介绍：</label>
                      <textarea rows="6" cols="60" name="description"><%=shop.getDescription() %></textarea>
                      <span class="tip"></span> 
                    </p>
                    <p class="sub-box">
					    <input id="shopId" name="shopId" value="<%=shop.getShopId() %>" type="hidden"/>
					    <input id="country" name="country"  value="<%=shop.getCountry() %>"  type="hidden" />
                        <input id="getPoint" type="button" value="定位"/>
                        <input type="submit" class="input-btn" value="确定修改" />
                    </p>
                    <div id="mapContainer" style="width: 520px; height: 340px; border: 1px solid gray" ></div>
                  </form>
                </div>
                <!--completed-con--> 
              </div>
              <div id="tab-modify-recommend">33</div>
            </div>
          </div>
        </div>
        <!--tab-xx--> 
        <!--tab-gp-->
        <div id="tab-gp"> 
          <!--completed-con-->
          <div class="completed-con">
            <form action="../action/updateGrouprate.jsp" method="post" id="updateGrouprateForm">
              <h3>增加团购信息(请联系网站客服进行人工审核)</h3>
              <p>
                <label>团购名称：</label>
                <input type="text" class="text-input" name="subject" value="<%=gr.getSubject() %>"/>
              </p>
              <p>
                <label>商品原价：</label>
                <input type="text" class="text-input" name="origPrice" size="30" value="<%=gr.getOrigPrice() %>"/>
              </p>
              <p>
                <label>商品现价：</label>
                <input type="text" class="text-input" name="curPrice" size="30" value="<%=gr.getCurPrice() %>"/>
              </p>
              <p>
                <label>团购内容：</label>
                <textarea rows="6" cols="60" name="content"><%=gr.getContent() %></textarea>
              </p>
              <p>
                <label>开始时间：</label>
                <input type="text" class="text-input" name="timeFrom" id="grTimeFrom" readonly="readOnly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" value="<%=sdf.format(gr.getTimeFrom()) %>"/>
              </p>
              <p>
                <label>结束时间：</label>
                <input type="text" class="text-input" name="timeTo" id="grTimeTo" readonly="readOnly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" value="<%=sdf.format(gr.getTimeTo()) %>"/>
              </p>
              <p>
                <label>团购图片：</label>
                <img id="grImage" src="<%=gr.getImagePath() %>" height="80" width="80"/>
                <input type="hidden" name="imagePath" id="grImagePath" value="<%=gr.getImagePath() %>"/>
              </p>
              <p class="sub-box">
                <input type="hidden" name="grId" value="<%=gr.getGrouprateId() %>"/>
<!--                <input type="submit" class="input-btn" value="确定修改" />-->
              </p>
            </form>
<!--            <form id="updateGrouprateImageForm" action="../action/uploadImage.jsp">-->
<!--              <p class="sub-box">-->
<!--                <input id="grImageFile" name="fuPhoto" type="file" />-->
<!--                <input type="submit" value="上传"/>            -->
<!--              </p>-->
<!--            </form>-->
          </div>
          <!--completed-con--> 
        </div>
        <!--tab-gp end--> 
      </div>
    </div>
  </div>
  <!--main right-->
  <p class="cl"></p>
</div>
<!--content-->
<%          } else {
                out.write("不是你的店！");
		    }
        } else {
		    out.write("尚未登录！");
		}
 %>
<%@ include file="footer.jsp"%>
</body>
</html>