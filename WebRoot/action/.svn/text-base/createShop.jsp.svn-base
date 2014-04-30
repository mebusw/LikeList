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
	    String shopName = AttrParser.getParaStr(request, "shopName");
        String shopPwd = AttrParser.getParaStr(request, "shopPwd");
        String shopEmail = AttrParser.getParaStr(request, "shopEmail");
        String shopPhone = AttrParser.getParaStr(request, "shopPhone");
        String category1 = AttrParser.getParaStr(request, "category1");
        
        JSONObject json = new JSONObject();
        IShopBizDAO dao = new ShopBizDAOImpl();
        IAlbumDAO daoAlbum = new AlbumDAOImpl();
        int bid = AttrParser.getBid(request);
        if (bid > 0) {
        	Date date = new Date();
        	
        	EsjShop esjShop = new EsjShop(shopName, shopPwd, 
                    shopEmail, false, shopPhone, bid, new Date(), new Date());
        	/////TODO
        	esjShop.setApproved(true);
            dao.createShop(esjShop);
            
            EsjShopDiscount deal = new EsjShopDiscount(date, false, esjShop.getShopId(), bid, date);
            deal.setApproved(true);
            dao.createDeal(deal);
            EsjShopGrouprate gr = new EsjShopGrouprate(bid, esjShop.getShopId(), date, false, date);
            gr.setApproved(true);
            dao.createGrouprate(gr);
            EsjAlbum esjAlbum = daoAlbum.createAlbum(esjShop.getShopId());
            

            if (null == esjShop) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                json.put("shopId", esjShop.getShopId());
                json.put("shopName", esjShop.getShopName());
            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
