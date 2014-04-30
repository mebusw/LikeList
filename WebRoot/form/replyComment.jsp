<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for ReplyCommentForm form</title>
	</head>
	<body>
		<html:form action="/replyComment">
			text : <html:text property="text"/><html:errors property="text"/><br/>
			commentId : <html:text property="commentId"/><html:errors property="commentId"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

