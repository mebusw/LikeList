<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for FindPhotoForm form</title>
	</head>
	<body>
		<html:form action="/findPhoto">
			photoId : <html:text property="photoId"/><html:errors property="photoId"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

