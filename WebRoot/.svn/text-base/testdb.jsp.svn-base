<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>


<%

	String DBDRIVER = "com.mysql.jdbc.Driver";
	Connection conn = null;

	 String DBURL = "jdbc:mysql://localhost:3311/esj?useUnicode=true&characterEncoding=utf8";
	 String DBUSER = "davinci";
	 String DBPASSWORD = "davinci123";
	 out.write("DB connection test<br>");
	
		try {
            out.write(DBURL + "<br>");
			out.write(DBUSER + "<br>");
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL,
					DBUSER, DBPASSWORD);
			out.write("连接对象：" + conn + "<br>");
			PreparedStatement pstmt = conn.prepareStatement("SELECT fullName from esj_user_info");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				out.write(rs.getString(1) + "<br>");			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
