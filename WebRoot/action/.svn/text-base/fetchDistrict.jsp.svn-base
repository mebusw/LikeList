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
	    int cityId = Integer.parseInt(request.getParameter("cityId"));
        JSONObject json = new JSONObject();

        IAddressDAO dao = new AddressDAOImpl();
        List<EsjDistrict> provinceList = dao.fetchDistrict(cityId);

        if (null == provinceList) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            List districts = new LinkedList();
            Iterator itr = provinceList.iterator();
            EsjDistrict e;
            while(itr.hasNext()){
            	e = (EsjDistrict)itr.next();
                Map oneDistrict = new LinkedHashMap();
                oneDistrict.put("districtId", e.getDistrictId());
            	oneDistrict.put("districtName", e.getDistrictName());
            	districts.add(oneDistrict);
            }
            json.put("districts", districts);
            
        }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
