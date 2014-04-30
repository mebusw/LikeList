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
		int albumId = Integer.parseInt(request.getParameter("albumid"));
        int photoId = Integer.parseInt(request.getParameter("photoid"));

		IAlbumDAO dao = new AlbumDAOImpl();
        JSONObject json = new JSONObject();

        int uid = AttrParser.getUid(request);
        if (uid > 0) {
            EsjAlbum esjAlbum = dao.findAlbum(albumId);

            if (null == esjAlbum) {
                json.put("ec", EC.NOT_FOUND.toInt());
            } else if (uid == esjAlbum.getOwnerId()) {
                esjAlbum = dao.switchCoverPhoto(uid, albumId, photoId);

                if (null == esjAlbum) {
                    json.put("ec", EC.DAO_FAIL.toInt());
                } else {
                    json.put("ec", EC.SUCCESS.toInt());
                    json.put("albumId", esjAlbum.getAlbumId());
                    json.put("coverPhotoId", esjAlbum.getCoverPhotoId());
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
