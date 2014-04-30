<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>



<html>
	<head>
		<title>JSP for FindAlbumForm form</title>
	</head>
	<body>
<%
		int albumId = Integer.parseInt(request.getParameter("albumId"));
		IAlbumDAO dao = new AlbumDAOImpl();
	    boolean modifiable = false;
        int uid = AttrParser.getUid(request);
        		
		EsjAlbum esjAlbum = dao.findAlbum(albumId);
		if (null != esjAlbum) {
			if (uid > 0 && esjAlbum.getOwnerId() == uid) {
				modifiable = true;
			}
			List<EsjPhoto> photoList = dao.findAllPhotos(albumId);
			
			SimpleDateFormat sdf = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
%>
        <hr/>
                       专辑<b><%=esjAlbum.getAlbumName() %></b>
        <ul>
<%
            for (EsjPhoto p : photoList){
%>
        <li><img src="<%=p.getLargePath() %>"/> <%=sdf.format(p.getCreateTime()) %></li>
<%
		    }
		}
%>
        </ul>
	</body>
</html>

