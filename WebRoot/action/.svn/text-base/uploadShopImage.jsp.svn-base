<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.EC"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>

<%
    request.setCharacterEncoding("utf-8");
	int bid = AttrParser.getBid(request);
    JSONObject json = new JSONObject();
    String shopId = "";
    
	if(bid > 0) {
	    final String[] allowedExt = new String[] { "gif", "jpg", "png" };
	    final String ATTACHED_FOLDER = "attached";
		String temp = getServletContext().getRealPath("/") + "temp"; //临时目录 
		String loadPath = getServletContext().getRealPath("/") + ATTACHED_FOLDER; //上传文件存放目录 
		DiskFileUpload fu = new DiskFileUpload();
		List uploaded = new LinkedList();
		Map uploadedOne = new LinkedHashMap();
		
		fu.setSizeMax(1 * 1024 * 1024); // 设置允许用户上传文件大小,单位:字节 
		fu.setSizeThreshold(4096); // 设置最多只允许在内存中存储的数据,单位:字节 
		fu.setRepositoryPath(temp); // 设置一旦文件大小超过getSizeThreshold()的值时数据存放在硬盘的目录 
	
		//开始读取上传信息 
		List fileItems = fu.parseRequest(request);
		
		Iterator iter = fileItems.iterator(); // 依次处理每个上传的文件 
	
        String generatedName = "";
	
		
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();// 忽略其他不是文件域的所有表单信息 

			if (!item.isFormField()) {
				String name = item.getName();//获取上传文件名,包括路径 
				name = name.substring(name.lastIndexOf("\\") + 1);//从全路径中提取文件名 
	            String ext = name.substring(name.lastIndexOf(".") + 1);//从文件名中提取扩展名 
	
				long size = item.getSize();
				if ((name == null || name.equals("")) && size == 0)
					continue;
				
			    generatedName = "s" + shopId + "_" + (new Date().getTime()) + "." + ext;
	            
			    
				String attachedPath = "../" + ATTACHED_FOLDER + "/" + generatedName;
				uploadedOne.put("filePath", attachedPath);
				uploadedOne.put("fileSize", item.getSize());
				uploaded.add(uploadedOne);
				File fNew = new File(loadPath, generatedName);
				item.write(fNew);
	
			}
			else if (item.getFieldName().equals("shopId")) {
	            shopId = item.getString();
	            //System.out.println("shopId=" + shopId);
				
			}
		}
	    json.put("ec", EC.SUCCESS.toInt());
		json.put("files", uploaded);
		
	    response.sendRedirect("../biz/uploadShopAvatar.jsp?step=2&picUrl=" + generatedName
	    		+ "&shopId=" + shopId);

	} else {
		json.put("ec", EC.UNAUTHORIZED.toInt());
	}
    out.println(json.toJSONString());
	
%>
