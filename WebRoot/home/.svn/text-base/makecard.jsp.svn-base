<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@  page import="org.likelist.makecard.*"%>
<%
	String myshopId = request.getParameter("shopId"); 
	String myCardUri = request.getParameter("shopCarduri");
	if(null == myshopId)
		return;
	if(null == myCardUri)
		return; 
	String dirPath = getServletContext().getRealPath("/") + "/CardImg/";
   try{
            if (!(new java.io.File(dirPath).isDirectory()))
             {
                    new java.io.File(dirPath).mkdir();       
             }
        }catch(Exception e){
          e.printStackTrace();
          response.sendRedirect("index.html");
          return;
    }
	String Filepath = dirPath + myshopId + ".jpg"; 
	MakeCard.SaveCard( myCardUri,Filepath);
	String cardpicuri = "http://www.penghoo.com/CardImg/"+ myshopId + ".jpg";
	
	response.sendRedirect(cardpicuri);
%>
