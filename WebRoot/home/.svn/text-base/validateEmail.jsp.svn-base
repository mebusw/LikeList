<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<html>
<head>
    <script src="../js/util.js" type="text/javascript"></script>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/jquery.form.js" type="text/javascript"></script>
    <script src="../js/md5.js" type="text/javascript"></script>
    <script src="../js/home_welcome.js" type="text/javascript"></script>

    <script type="text/javascript">
    </script>
     <link href="../stylesheet/0708bf223bc9859effacdab3194647db.css"
         rel="stylesheet" media="all" type="text/css" />
     <link href="../stylesheet/home.css" rel="stylesheet" media="all"
         type="text/css" />

</head>
<body>
<%
		String email = request.getParameter("email");
		String _validCode = request.getParameter("validCode");
        int validCode = (null == _validCode) ? 0 : Integer.parseInt(_validCode);

		String _userId = request.getParameter("userId");
        int userId = (null == _userId) ? 0 : Integer.parseInt(_userId);
		
		IUserDAO dao = new UserDAOImpl();
		EsjUserInfo newcomer = dao.validEmail(userId, validCode);
		if (newcomer != null && newcomer.getEmailChecked()){
			out.write("恭喜验证通过，请<a href='./welcome.jsp'>登录</a>");
		} else {
			out.write("验证失败");
		}
%>


</body>
</html>
