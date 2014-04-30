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
    String email = AttrParser.getParaStr(request, "regEmail");
    String password = AttrParser.getParaStr(request, "regPassword1");
    String fullName = AttrParser.getParaStr(request, "regFullName");
    String userType = AttrParser.getParaStr(request, "userType");

    JSONObject json = new JSONObject();
    json.put("userType", userType);

    if (userType.equals("user")) {
        IUserDAO dao = new UserDAOImpl();

        if (dao.emailExist(email))  {
        	json.put("ec", EC.EXISTED.toInt());
	        json.put("email", email);
	    }
        else {
            EsjUserInfo esjUserInfo = new EsjUserInfo(fullName, password, "", "", "", email,
                    false, 0, 0, new Date(), new Date());
            
	        dao.signup(esjUserInfo);
	    
	        if (null == esjUserInfo) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	            json.put("ec", EC.SUCCESS.toInt());
	            json.put("email", esjUserInfo.getEmail());
	            json.put("userId", esjUserInfo.getUserId());
	            json.put("fullName", esjUserInfo.getFullName());
	            json.put("code", esjUserInfo.getEmailCheckCode());
	            
	            //send out validation mail
				/*
	            HtmlEmail vMail = new HtmlEmail();       
	            vMail.setTLS(true);            
	            vMail.setHostName("smtp.gmail.com");          
	            vMail.setAuthentication("eshunjian@gmail.com", "yubao8412");       
	            
	            try { 
	                vMail.addTo(email);    
	                vMail.setFrom("mebusw@gmail.com");           
	                vMail.setSubject("[No-reply]ESJ注册成功");     
	                vMail.setCharset("UTF-8");                         
	                String validLink = "http://127.0.0.1:8080/LikeList/home/validateEmail.jsp?email="
	                		+ email + "&validCode=" + esjUserInfo.getEmailCheckCode()
	                		+ "&userId=" + esjUserInfo.getUserId();
	                vMail.setHtmlMsg(esjUserInfo.getFullName() +",点击链接以验证邮箱<br>" + 
	                		"<a href='" + validLink + "'>" + validLink + "</a>");     
	                vMail.send();     
	                    
	            } catch (EmailException e) {    
	                e.printStackTrace(response.getWriter());    
	            }  // end of validation mail     
				*/
	        }
        }
        
    } else if (userType.equals("biz")) {
        IBizDAO dao = new BizDAOImpl();
        if (dao.emailExist(email))  {
            json.put("ec", EC.EXISTED.toInt());
            json.put("email", email);
        }
        else {

	        EsjBizInfo esjBizInfo = new EsjBizInfo(fullName, password, "", "", "", false, 
	        		email, new Date(), new Date()); 
            /////TODO
            esjBizInfo.setApproved(true);

	        esjBizInfo = dao.signup(esjBizInfo);
	        
	        if (null == esjBizInfo) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	            json.put("ec", EC.SUCCESS.toInt());
	            json.put("email", esjBizInfo.getEmail());
	            json.put("bizId", esjBizInfo.getBizId());
	            json.put("fullName", esjBizInfo.getFullName());
	        }      
        }
    } else {
      json.put("ec", EC.UNSUCCESSFUL.toInt());
      
    }

    out.write(json.toJSONString());

        
%>
