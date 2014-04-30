<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.awt.Rectangle"%>
<%@  page import="java.awt.image.BufferedImage"%>
<%@  page import="java.io.File"%>
<%@  page import="java.io.IOException"%>
<%@  page import="javax.imageio.ImageIO"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>

<%
    request.setCharacterEncoding("utf-8");
	int imageWidth = Integer.parseInt(request.getParameter("txt_width"));
	int imageHeight = Integer.parseInt(request.getParameter("txt_height"));
	int cutTop = Integer.parseInt(request.getParameter("txt_top"));
	int cutLeft = Integer.parseInt(request.getParameter("txt_left"));
	int dropWidth = Integer.parseInt(request.getParameter("txt_DropWidth"));
	int dropHeight = Integer.parseInt(request.getParameter("txt_DropHeight"));
	float imageZoom = Float.parseFloat(request.getParameter("txt_Zoom"));
	String picture = request.getParameter("picture");
	
	//System.out.println("url :"+request.getRealPath("")+"/attached/"+picture);
	Rectangle rec = new Rectangle(cutLeft,cutTop,dropWidth,dropHeight);
	
	File newFile = new File(getServletContext().getRealPath("/") 
			+ "avatar/" + picture);
    File oldFile = new File(getServletContext().getRealPath("/") 
               + "attached/" + picture);

	ImageHepler.cut(oldFile,
			newFile, imageWidth, imageHeight, rec);
	
	int uid = AttrParser.getUid(request);
    IUserDAO dao = new UserDAOImpl();
    dao.updateAvatar(uid, "../avatar/" + picture);

	response.sendRedirect("../home/uploadAvatar.jsp?picUrl=" + picture + "&step=3");
%>