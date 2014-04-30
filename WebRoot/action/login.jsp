<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>
<%@ page import="org.springframework.transaction.annotation.Transactional" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<%
    request.setCharacterEncoding("utf-8");
    String email = AttrParser.getParaStr(request, "email");
    String password = AttrParser.getParaStr(request, "password");
    String userType = AttrParser.getParaStr(request, "userType");
    boolean remember = AttrParser.getParaBool(request, "remember");

    JSONObject json = new JSONObject();
    
    json.put("userType", userType);
    json.put("remember", remember);
    json.put("ipAddress", request.getRemoteAddr());
    request.getSession().setAttribute("userId", null);
    request.getSession().setAttribute("bizId", null);
    request.getSession().setAttribute("role", null);
    request.getSession().setMaxInactiveInterval(5000);
    
    ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
    if (userType.equals("user")) {
        IUserDAO dao = (UserDAOImpl) ctx.getBean("userDAO");

        EsjUserInfo esjUserInfo = dao.login(email, password);  
        
        if (null == esjUserInfo) {
            json.put("ec", EC.NOT_FOUND.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            json.put("email", esjUserInfo.getEmail());
            json.put("fullName", esjUserInfo.getFullName());
            json.put("userId", esjUserInfo.getUserId());
            json.put("loginTimes", esjUserInfo.getLoginTimes());
            request.getSession().setAttribute("userId",
                    esjUserInfo.getUserId());
            request.getSession().setAttribute("role", Role.USER);
            request.getSession().setAttribute("emailChecked",
                    esjUserInfo.getEmailChecked());
            request.getSession().setAttribute("fullName",
                    esjUserInfo.getFullName());
            
        }        
        
    } else if (userType.equals("biz")) {
        IBizDAO dao = (BizDAOImpl) ctx.getBean("bizDAO");
        EsjBizInfo esjBizInfo = dao.login(email, password);
        
        if (null == esjBizInfo) {
            json.put("ec", EC.NOT_FOUND.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            json.put("email", esjBizInfo.getEmail());
            json.put("fullName", esjBizInfo.getFullName());
            json.put("bizId", esjBizInfo.getBizId());
            request.getSession().setAttribute("bizId",
                    esjBizInfo.getBizId());
            request.getSession().setAttribute("role", Role.BIZ);
            request.getSession().setAttribute("approved",
                    esjBizInfo.getApproved());
            request.getSession().setAttribute("fullName",
                    esjBizInfo.getFullName());
        }
      
    } else {
        json.put("ec", EC.UNSUCCESSFUL.toInt());
    }
    
    out.write(json.toJSONString());

        
%>
