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
        JSONObject json = new JSONObject();

        IAlbumDAO dao = new AlbumDAOImpl();
        EsjAlbum esjAlbum = dao.findAlbum(albumId);
        List<EsjPhoto> photoList = dao.findAllPhotos(albumId);
        if (null == photoList) {
            json.put("ec", EC.DAO_FAIL.toInt());
        } else {
            json.put("ec", EC.SUCCESS.toInt());
            List photos = new LinkedList();
            Map onePhoto;

            for (EsjPhoto e : photoList) {
                onePhoto = new LinkedHashMap();
                onePhoto.put("largePath", e.getLargePath());
                onePhoto.put("photoId", e.getPhotoId());
                onePhoto.put("description", e.getDescription());
                onePhoto.put("smallPath", e.getSmallPath());
                onePhoto.put("albumId", e.getAlbumId());

                SimpleDateFormat sdf = new SimpleDateFormat(
                        "MM/dd/yyyy HH:mm:ss");
                onePhoto.put("createTime", sdf.format(e.getCreateTime()));
              	onePhoto.put("isCoverPhoto", e.getPhotoId() == esjAlbum.getCoverPhotoId());
                photos.add(onePhoto);
            }
            json.put("photos", photos);
            json.put("coverPhotoId", esjAlbum.getCoverPhotoId());
            
       }

	   out.write(json.toJSONString());
	
	
	} catch (Exception e) {
        e.printStackTrace(response.getWriter());
	}
%>
