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
	    //int countryId = Integer.parseInt(request.getParameter("countryId"));
        JSONObject json = new JSONObject();

        IAddressDAO dao = new AddressDAOImpl();
        List<EsjProvince> provinceList = dao.fetchProvince();

        if (null == provinceList) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            List provinces = new LinkedList();
            Iterator itr = provinceList.iterator();
            EsjProvince e;
            while(itr.hasNext()){
            	e = (EsjProvince)itr.next();
                Map oneProvince = new LinkedHashMap();
            	oneProvince.put("provinceId", e.getProvinceId());
            	oneProvince.put("provinceName", e.getProvinceName());
            	provinces.add(oneProvince);
            }
            json.put("provinces", provinces);
            
        }
	    out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
