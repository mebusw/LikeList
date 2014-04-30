<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for DelDealForm form</title>
	</head>
	<body>
		<html:form action="/delDeal">
			dealId : <html:text property="dealId"/><html:errors property="dealId"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

