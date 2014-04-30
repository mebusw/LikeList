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
	    int grId = AttrParser.getParaInt(request, "grId");
        String subject = AttrParser.getParaStr(request, "subject");
        float origPrice = AttrParser.getParaFloat(request, "origPrice");
        float curPrice = AttrParser.getParaFloat(request, "curPrice");
	    String content = AttrParser.getParaStr(request, "content");
	    Date timeFrom = AttrParser.getParaDate(request, "timeFrom");
	    Date timeTo = AttrParser.getParaDate(request, "timeTo");
	    String imagePath = AttrParser.getParaStr(request, "imagePath");
	    
	    
        JSONObject json = new JSONObject();
	    int bid = AttrParser.getBid(request);
	    if (bid > 0) {
	        IShopBizDAO dao = new ShopBizDAOImpl();
	        
	        EsjShopGrouprate gr = dao.findGrouprate(grId);
	        gr.setSubject(subject);
	        gr.setContent(content);
	        gr.setOrigPrice(origPrice);
	        gr.setCurPrice(curPrice);
	        gr.setPercent((int)(curPrice / origPrice) * 100);
	        gr.setTimeFrom(timeFrom);
	        gr.setTimeTo(timeTo);
	        gr.setLastUpdate(new Date());
	        gr.setImagePath(imagePath);
	        gr = dao.updateGrouprate(gr);

	        if (null == gr) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	            json.put("ec", EC.SUCCESS.toInt());
	            json.put("grId", gr.getGrouprateId());
	            json.put("shopId", gr.getShopId());
	            json.put("bizId", gr.getBizId());
	            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	            json.put("lastUpdate", sdf.format(gr.getLastUpdate()));
	        }
	    } else {
	        json.put("ec", EC.UNAUTHORIZED.toInt());
	    }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
