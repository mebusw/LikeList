<%@  page contentType="text/html;charset=UTF-8"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.admin.*"%>
<html>
	<head>
	</head>
	<body>
        <h1>Welcome, Administer!</h1>
        <a href="gr.jsp?shopId=1"><u>团购管理</u></a>
        <a href="shop.jsp?shopId=1"><u>店铺管理</u></a>
		<%
			out.println("<br>当前在线用户人数:<font  color=red>"
					+ OnlineCounter.getOnline() + "</font><br>");
            String ip = request.getRemoteAddr();
			out.println("<br>IP:<font  color=red>" + ip + "</font><br>");
        %>			
	</body>
</html>
