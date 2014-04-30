<%@ page language="java" pageEncoding="UTF-8"%>
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
 
<html> 
	<head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       <title>JSP for bizShop form</title>
       <%@include file="../home/js_css_include.html" %>
       
	   <link rel='stylesheet' type='text/css' href='../stylesheet/bmap.css'>
	   <script type='text/javascript' src='../js/bmap.js'></script>
       <script src="../js/biz_shopmodify.js" type="text/javascript"></script>
	   
	</head>
	<body>
	   <h1>店铺管理 管理员专用</h1>  
	   <a href="gr.jsp?shopId=1"><u>团购管理</u></a>
	   <a href="user.jsp?userId=1"><u>用户管理</u></a>
	   
	   <form action="#">
	       <h2>切换店铺</h2>
	       店铺编号shopId:<input name="shopId"/>
	       <input value="切换店铺" type="submit"/>
	   </form>
	   <hr/>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
    request.setCharacterEncoding("utf-8");


    IShopBizDAO dao = new ShopBizDAOImpl();
    int shopId = AttrParser.getParaInt(request, "shopId");
    EsjShop shop = dao.findShop(shopId);
    List<String> categories = dao.findCategory(0);

    if (null != shop)  {
    	try {
	        shop.setDescription(AttrParser.getParaStr(request, "description"));
	        shop.setCategory1(AttrParser.getParaStr(request, "category1"));
	        shop.setShopPhone(AttrParser.getParaStr(request, "shopPhone"));
	        shop.setShopName(AttrParser.getParaStr(request, "shopName"));
	        shop.setLatitude(AttrParser.getParaFloat(request, "latitude"));
	        shop.setLongitude(AttrParser.getParaFloat(request, "longitude"));
	        
	        shop.setWebsite(AttrParser.getParaStr(request, "website"));
	        
	        String province = AttrParser.getParaStr(request, "province");
	        String city = AttrParser.getParaStr(request, "city");
	        String district = AttrParser.getParaStr(request, "district");
	        String street = AttrParser.getParaStr(request, "street");
	        shop.setProvince(province);
	        shop.setCity(city);
	        shop.setDistrict(district);
	        shop.setStreet(street);
	        shop.setApproved(AttrParser.getParaBool(request, "approved"));
	        shop.setLastUpdate(new Date());
	        
	        shop.setFullAddress(province + city + district + street);
	        
	        boolean flag = dao.updateShop(shop);
	        if (flag) {
                out.write("<span style='color:#FF0000'>更新数据库成功</span>");
            } else {
                out.write("<span style='color:#00FF00'>更新数据库失败</span>");
	        }
    	} catch (Exception e){
    		
    	}
    %>	        

    <form id="update-shop-form" action="#" method="get">
        <h3><%=shop.getShopName() %>(shopId=<%=shopId %>)</h3>
	    <select id="province" name="province"></select>
	    <select id="city" name="city"></select>
	    <select id="district" name="district"></select>
	    <script type="text/javascript">
	        new PCAS("province", "city", "district", 
	                "<%=shop.getProvince() %>", "<%=shop.getCity() %>", "<%=shop.getDistrict() %>" );
	    </script>

	    <input id="street" name="street" class="text-input" value="<%=shop.getStreet() %>" />
        <br/>
        <input type="hidden" class="text-input" name="fullAddress" id="fullAddress" readonly="readonly" size="30" value="<%=shop.getFullAddress() %>"/>
        
                  商店名称<input name="shopName" value="<%=shop.getShopName() %>" /><br/>
	        电话<input name="shopPhone" value="<%=shop.getShopPhone() %>" /><br/>      
	        邮件<input name="shopEmail" value="<%=shop.getShopEmail() %>" /><br/>      
	        经度(hidden)<input id="longitude" name="longitude" value="<%=shop.getLongitude() %>" readonly="readonly"/><br/>      
	        纬度(hidden)<input id="latitude" name="latitude" value="<%=shop.getLatitude() %>" readonly="readonly"/><br/>      
	        描述<textarea id="description" name="description" ><%=shop.getDescription() %></textarea><br/>      
	        大类: <select id="category1Sel">
	        <%
	        for (String c : categories) {
                out.write(String.format("<option value='%s' %s>%s</option>",
                        c, shop.getCategory1().equals(c)?"selected='selected'":"", c));
            }

	        %>
	        </select><br/>
	        网址:<input id="website" name="website" value="<%=shop.getWebsite() %>" /><br/>
	   
	    <input id="shopId" name="shopId" value="<%=shop.getShopId() %>" type="hidden"/>
	    <input id="country" name="country"  value="<%=shop.getCountry() %>"  type="hidden" />
	    <input id="category1" name="category1" value="<%=shop.getCategory1() %>" type="hidden"/>
	    店铺审核<input type="radio" name="approved" value="true" <%=shop.getApproved()?"checked='checked'":"" %>/>通过
	    <input type="radio" name="approved" value="false" <%=!shop.getApproved()?"checked='checked'":"" %>/>不通过
	    <input type="submit"/>
    </form>
    <div style="width: 520px; height: 340px; border: 1px solid gray"
        id="mapContainer">
    </div>
    <input id="getPoint" type="button" value="定位"/>
    
    <h2>评论</h2>
    <ol id="comments"></ol>
    <div id="commentsNav"></div>
    <hr>

<%  
		    } else {
		    	out.write("读取店铺信息失败");
		    }
%>

	</body>
</html>

