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
	    int provinceId = AttrParser.getParaInt(request, "provinceId");
        JSONObject json = new JSONObject();

        IAddressDAO dao = new AddressDAOImpl();
        List<EsjCity> provinceList = dao.fetchCity(provinceId);

        if (null == provinceList) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            List cities = new LinkedList();
            Iterator itr = provinceList.iterator();
            EsjCity e;
            while(itr.hasNext()){
            	e = (EsjCity)itr.next();
                Map oneCity = new LinkedHashMap();
                oneCity.put("cityId", e.getCityId());
            	oneCity.put("cityName", e.getCityName());
            	cities.add(oneCity);
            }
            json.put("cities", cities);
            
        }
        json.put("provinceId", provinceId);
	    out.write(json.toJSONString());
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
