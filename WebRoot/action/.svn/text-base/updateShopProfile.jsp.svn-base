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
        JSONObject json = new JSONObject();
        IShopBizDAO dao = new ShopBizDAOImpl();
        int bid = AttrParser.getBid(request);
        if (bid > 0) {
        	EsjShop esjShop = dao.findShop(AttrParser.getParaInt(request, "shopId"));
        	if (null != esjShop && esjShop.getBizId() == bid)  {
        		esjShop.setDescription(AttrParser.getParaStr(request, "description"));
	            esjShop.setCategory1(AttrParser.getParaStr(request, "category1"));
	            esjShop.setShopPhone(AttrParser.getParaStr(request, "shopPhone"));
	            esjShop.setShopName(AttrParser.getParaStr(request, "shopName"));
	            esjShop.setLatitude(AttrParser.getParaFloat(request, "latitude"));
	            esjShop.setLongitude(AttrParser.getParaFloat(request, "longitude"));
                
                esjShop.setWebsite(AttrParser.getParaStr(request, "website"));
                
                String province = AttrParser.getParaStr(request, "province");
                String city = AttrParser.getParaStr(request, "city");
                String district = AttrParser.getParaStr(request, "district");
                String street = AttrParser.getParaStr(request, "street");
                esjShop.setProvince(province);
                esjShop.setCity(city);
                esjShop.setDistrict(district);
                esjShop.setStreet(street);
                
                esjShop.setFullAddress(province + city + district + street);
                
	            boolean flag = dao.updateShop(esjShop);
	            if (!flag) {
	                json.put("ec", EC.DAO_FAIL.toInt());
	            } else {
	                json.put("ec", EC.SUCCESS.toInt());
	                json.put("shopId", esjShop.getShopId());
	                json.put("bizId", esjShop.getBizId());
	                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	                json.put("lastUpdate", sdf.format(esjShop.getLastUpdate()));
	
	            }
        	}else {
                json.put("ec", EC.ACCESS_DENIED.toInt());
            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
