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
	   <h1>用户管理 管理员专用</h1>
	   <a href="shop.jsp?shopId=1"><u>店铺管理</u></a>
	   <a href="gr.jsp?shopId=1"><u>团购管理</u></a>
	   
	   <form action="#">
	       <h2>切换用户</h2>
	       用户编号userId:<input name="userId"/>
	       <input value="切换用户" type="submit"/>
	   </form>
	   <hr/>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
    request.setCharacterEncoding("utf-8");

    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    IUserDAO dao = new UserDAOImpl();
    int userId = AttrParser.getParaInt(request, "userId");
    EsjUserInfo user = dao.findUser(userId);

    if (null != user)  {
    	try {/*
	        if (null != dao.updateGrouprate(gr)) {
	        	out.write("<span style='color:#FF0000'>更新数据库成功</span>");
	        } else {
                out.write("<span style='color:#00FF00'>更新数据库失败</span>");
	        }*/
    	} catch (Exception e){
    		
    	}
    %>	        

    <h2>用户管理</h2>
    <h3><%=user.getFullName() %>(userId=<%=userId %>)</h3>
    <div class="completed-con">
        <form action="#" method="post" id="updateGrouprateForm" method="post">
          <p>
            <label>姓名：</label>
            <input type="text"  name="subject" value="<%=user.getFullName() %>"/>
          </p>

          <p class="sub-box">
            <input type="hidden" name="userId" value="<%=user.getUserId() %>"/>
            <input type="submit" value="更新用户"/>
          </p>
        </form>
        <hr/>
        
     </div>
<%  
		    } else {
		    	out.write("读取用户信息失败");
		    }
%>

	</body>
</html>

