<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>
<%@  page import="org.apache.commons.mail.EmailException"%>
<%@  page import="org.apache.commons.mail.HtmlEmail"%>


<%
    request.setCharacterEncoding("utf-8");

	int uid = AttrParser.getUid(request);
    JSONObject json = new JSONObject();
	if (uid > 0) {

        String senderName = AttrParser.getParaStr(request, "senderName");
		if (senderName.equals(""))
			senderName = "朋互网";
        String url = AttrParser.getParaStr(request, "url");
		if (url.equals(""))
			url = "www.penghoo.com";
        String content = AttrParser.getParaStr(request, "content");
		if (content.equals(""))
			content = "欢迎来到朋互网";
        String senderEmail = AttrParser.getParaStr(request, "senderEmail");
		if (senderEmail.equals(""))
			senderEmail = "eshunjian@gmail.com";
        String sendPwd = AttrParser.getParaStr(request, "sendPwd");
		if (sendPwd.equals(""))
			sendPwd = "yubao8412";

        HtmlEmail vMail = new HtmlEmail();       
        vMail.setTLS(true);            
        vMail.setHostName("smtp.gmail.com");          
        vMail.setAuthentication(senderEmail, sendPwd);       
        
        
        try { 
        	String toStr = "";
            /* Support multi mail receivers.  */
        	for (String s : request.getParameterValues("to")){
                vMail.addTo(s);
                toStr += s + ";";
            }
            
            vMail.setFrom("eshunjian@gmail.com");           
            vMail.setCharset("UTF-8");                         
            vMail.setSubject("你的朋友" + senderName + "邀请你到朋互网");     
            vMail.setHtmlMsg("Hi,<br>" + content + "<a href='" + url + "'>" + url + "</a>");     
            vMail.send();     
            json.put("ec", EC.SUCCESS.toInt());
            json.put("to", toStr);
        } catch (EmailException e) {    
        	json.put("ec", EC.UNSUCCESSFUL.toInt());
            e.printStackTrace(response.getWriter());    
        }     
        
        out.write(json.toJSONString());

        
	} else {
        json.put("ec", EC.UNAUTHORIZED.toInt());
    }
%>
