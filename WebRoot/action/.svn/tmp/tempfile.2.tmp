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
	    int dealId = AttrParser.getParaInt(request, "dealId");
        String subject = AttrParser.getParaStr(request, "subject");
	    String content = AttrParser.getParaStr(request, "content");
	    int percent = AttrParser.getParaInt(request, "percent");
	    Date timeFrom = AttrParser.getParaDate(request, "timeFrom");
	    Date timeTo = AttrParser.getParaDate(request, "timeTo");

        JSONObject json = new JSONObject();
	    int bid = AttrParser.getBid(request);
	    if (bid > 0) {
	        IShopBizDAO dao = new ShopBizDAOImpl();
	        
	        EsjShopDiscount deal = dao.findDeal(dealId);
	        deal.setSubject(subject);
	        deal.setContent(content);
	        deal.setPercent(percent);
	        deal.setTimeFrom(timeFrom);
	        deal.setTimeTo(timeTo);
	        deal.setLastUpdate(new Date());
	        deal = dao.updateDeal(deal);

	        if (null == deal) {
	            json.put("ec", EC.DAO_FAIL.toInt());
	        } else {
	            json.put("ec", EC.SUCCESS.toInt());
	            json.put("dealId", deal.getShopDiscountId());
	            json.put("shopId", deal.getShopId());
	            json.put("bizId", deal.getBizId());
	            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	            json.put("lastUpdate", sdf.format(deal.getLastUpdate()));
	        }
	    } else {
	        json.put("ec", EC.UNAUTHORIZED.toInt());
	    }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
