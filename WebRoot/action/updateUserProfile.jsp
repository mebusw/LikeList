<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.EC"%>



<%
    request.setCharacterEncoding("UTF-8");
	try {
        JSONObject json = new JSONObject();
        IUserDAO dao = new UserDAOImpl();
        int uid = AttrParser.getUid(request);
        if (uid > 0) {
        	EsjUserInfo esjUserInfo = dao.readProfile(uid);
        	 
        	esjUserInfo.setFullName(AttrParser.getParaStr(request, "fullName"));
        	esjUserInfo.setAlipayAccount(AttrParser.getParaStr(request, "alipayAccount"));
            esjUserInfo.setBirthDay(AttrParser.getParaDate(request, "birthDay"));
            esjUserInfo.setResidency(AttrParser.getParaStr(request, "residency"));
            esjUserInfo.setUniversity(AttrParser.getParaStr(request, "university"));
            esjUserInfo.setHobby(AttrParser.getParaStr(request, "hobby"));
            esjUserInfo.setCompanyName(AttrParser.getParaStr(request, "companyName"));
            esjUserInfo.setSeekHelp(AttrParser.getParaStr(request, "seekHelp"));
            esjUserInfo.setPhone(AttrParser.getParaStr(request, "phone"));
            
            /*
            esjUserInfo.setMarried(AttrParser.getParaBool(request, "married"));
            esjUserInfo.setBirthPlace(request.getParameter("birthPlace"));
            esjUserInfo.setBloodType(request.getParameter("bloodType"));
            esjUserInfo.setCompanyName(request.getParameter("companyName"));
            esjUserInfo.setEmail2(request.getParameter("email2"));
            esjUserInfo.setFavouriteArea(request.getParameter("favouriteArea"));
            esjUserInfo.setFavouriteFood(request.getParameter("favouriteFood"));
            esjUserInfo.setHobby(request.getParameter("hobby"));
            esjUserInfo.setMsn(request.getParameter("msn"));
            esjUserInfo.setPassword(request.getParameter("password"));
            esjUserInfo.setQq(request.getParameter("qq"));
            esjUserInfo.setResidency(request.getParameter("residency"));
            esjUserInfo.setSex(Boolean.parseBoolean(request.getParameter("sex")));
            esjUserInfo.setAvatarDir(request.getParameter("avatarDir"));
            */
            boolean flag = dao.updateProfile(esjUserInfo);
            if (!flag) {
                json.put("ec", EC.UNSUCCESSFUL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                json.put("userId", esjUserInfo.getUserId());
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                json.put("lastUpdate", sdf.format(esjUserInfo.getLastUpdate()));

            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
	    out.write(json.toJSONString());
	    
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
