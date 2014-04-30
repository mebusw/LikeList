<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!--search begin-->
<div id="search" class="main-box">
  <div class="status-publisher">
    <form action="./search.jsp" method="get" id="searchForm">
      <input id="keyword" name="keyword" class="keyword required text-input" size="60" value="<%=keyword %>">
      <input type="hidden" id="pageSize" name="pageSize" value="10" />
      <input type="hidden" id="offset" name="offset" value="0" />
      <input type="submit" value="搜索" class="btn-search"/>
      <a id="showAdv" class="poi" onclick="$('#adv-Search').show();$('#showAdv').hide();">高级搜索</a>
      <div id="adv-Search" style="display:none">
        <%
	            List<String> cat1 = shopBizDao.findCategory(1);
	
	        %>
        <select id="category1" name="category1">
          <option value="" >--全部分类--</option>
          <%
	               
	               for (String cat : cat1) {
	            	   out.write(String.format("<option value='%s' %s>%s</option>",
	            			   cat, (category1.equals(cat))? "selected='selected'" : "", cat));
	            	   
	            		   
	               }
	           %>
        </select>
        <select id="province" name="province">
        </select>
        <select id="city" name="city">
        </select>
        <select id="district" name="district">
        </select>
        <script type="text/javascript">
	            new PCAS("province", "city", "district",
	    	             "<%=province%>", "<%=city%>", "<%=district%>");
	        </script> 
      </div>
    </form>
  </div>
</div>

<!--search over-->