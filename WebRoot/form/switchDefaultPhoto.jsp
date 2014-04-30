<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for SwitchDefaultPhotoForm form</title>
	</head>
	<body>
		<html:form action="/switchDefaultPhoto">
			albumId : <html:text property="albumId"/><html:errors property="albumId"/><br/>
			photoId : <html:text property="photoId"/><html:errors property="photoId"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

