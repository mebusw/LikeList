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
        int albumId = Integer.parseInt(request.getParameter("albumId"));
        String photoPath = request.getParameter("photoPath");
        int uid = AttrParser.getUid(request);
        JSONObject json = new JSONObject();
        if (uid > 0) {
            IAlbumDAO dao = new AlbumDAOImpl();
            EsjAlbum esjAlbum = dao.findAlbum(albumId);

            if (null == esjAlbum) {
                json.put("ec", EC.NOT_FOUND.toInt());
            } else if (uid == esjAlbum.getOwnerId()) {

	            EsjPhoto esjPhoto = dao.addPhoto(uid, photoPath, albumId);
	            if (null == esjPhoto) {
	                json.put("ec", EC.UNSUCCESSFUL.toInt());
	            } else {
	                json.put("ec", EC.SUCCESS.toInt());
	                json.put("albumId", esjPhoto.getAlbumId());
	                json.put("photoId", esjPhoto.getPhotoId());
	                json.put("description", esjPhoto.getDescription());
	            }
            } else{
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
