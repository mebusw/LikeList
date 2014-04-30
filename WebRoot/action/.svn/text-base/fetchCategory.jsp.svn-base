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
    request.setCharacterEncoding("utf-8");
	try {
	    int level = Integer.parseInt(request.getParameter("level"));
        JSONObject json = new JSONObject();

        IShopBizDAO dao = new ShopBizDAOImpl();
        List<String> categoryList = dao.findCategory(level);

        if (null == categoryList) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            json.put("categories", categoryList);
            
        }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
