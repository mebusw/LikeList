<%@ page language="java" pageEncoding="UTF-8"%>
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
 
<html> 
	<head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       <title>JSP for bizShop form</title>
       <%@include file="../home/js_css_include.html" %>
       
<script type="text/javascript">
$(function(){
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

})
</script>	   
	</head>
	<body>
	   <h1>团购管理 管理员专用</h1>
	   <a href="shop.jsp?shopId=1"><u>店铺管理</u></a>
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

    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    IShopBizDAO dao = new ShopBizDAOImpl();
    int shopId = AttrParser.getParaInt(request, "shopId");
    EsjShopGrouprate gr = dao.findGrouprates(shopId).get(0);
    List<String> categories = dao.findCategory(0);
    EsjShop shop = dao.findShop(shopId);

    if (null != gr)  {
    	try {
            String subject = AttrParser.getParaStr(request, "subject");
            float origPrice = AttrParser.getParaFloat(request, "origPrice");
            float curPrice = AttrParser.getParaFloat(request, "curPrice");
            String content = AttrParser.getParaStr(request, "content");
            Date timeFrom = AttrParser.getParaDate(request, "timeFrom");
            Date timeTo = AttrParser.getParaDate(request, "timeTo");
            String imagePath = AttrParser.getParaStr(request, "imagePath");
            boolean approved = AttrParser.getParaBool(request, "approved");

            gr.setSubject(subject);
            gr.setContent(content);
            gr.setOrigPrice(origPrice);
            gr.setCurPrice(curPrice);
            gr.setPercent((int)(curPrice / origPrice) * 100);
            gr.setTimeFrom(timeFrom);
            gr.setTimeTo(timeTo);
            gr.setLastUpdate(new Date());
            gr.setImagePath(imagePath);
            gr.setApproved(approved);

	        
	        if (null != dao.updateGrouprate(gr)) {
	        	out.write("<span style='color:#FF0000'>更新数据库成功</span>");
	        } else {
                out.write("<span style='color:#00FF00'>更新数据库失败</span>");
	        }
    	} catch (Exception e){
    		
    	}
    %>	        

    <h2>团购管理</h2>
    <h3><%=shop.getShopName() %>(shopId=<%=shopId %>)</h3>
    <div class="completed-con">
        <form action="#" method="post" id="updateGrouprateForm" method="post">
          <p>
            <label>团购名称：</label>
            <input type="text"  name="subject" value="<%=gr.getSubject() %>"/>
          </p>
          <p>
            <label>商品原价：</label>
            <input type="text"  name="origPrice" size="30" value="<%=gr.getOrigPrice() %>"/>
          </p>
          <p>
            <label>商品现价：</label>
            <input type="text"  name="curPrice" size="30" value="<%=gr.getCurPrice() %>"/>
          </p>
          <p>
            <label>团购内容：</label>
            <textarea rows="6" cols="60" name="content"><%=gr.getContent() %></textarea>
          </p>
          <p>
            <label>开始时间：</label>
            <input type="text"  name="timeFrom" id="grTimeFrom" readonly="readOnly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" value="<%=sdf.format(gr.getTimeFrom()) %>"/>
          </p>
          <p>
            <label>结束时间：</label>
            <input type="text"  name="timeTo" id="grTimeTo" readonly="readOnly" onclick="popUpCalendar(this, this, 'MM/dd/yyyy')" value="<%=sdf.format(gr.getTimeTo()) %>"/>
          </p>
          <p>
            <label>店铺审核：</label>
            <input type="radio" name="approved" value="true" <%=gr.getApproved()?"checked='checked'":"" %>/>通过
            <input type="radio" name="approved" value="false" <%=!gr.getApproved()?"checked='checked'":"" %>/>不通过
          </p>
          
          <p>
            <label>团购图片：</label>
            <img id="grImage" src="<%=gr.getImagePath() %>" height="80" width="80"/>
            <input type="hidden" name="imagePath" id="grImagePath" value="<%=gr.getImagePath() %>"/>
          </p>
          <p class="sub-box">
            <input type="hidden" name="grId" value="<%=gr.getGrouprateId() %>"/>
            <input type="submit" value="更新团购"/>
          </p>
        </form>
        <hr/>
        <form id="updateGrouprateImageForm" action="../action/uploadImage.jsp" method="post">
          <h2>上传团购图片(440x280 px)</h2>
          <p class="sub-box">
            <input id="grImageFile" name="fuPhoto" type="file" />
            <input type="submit" value="上传"/>            
          </p>
        </form>
        
     </div>
<%  
		    } else {
		    	out.write("读取店铺信息失败");
		    }
%>

	</body>
</html>

