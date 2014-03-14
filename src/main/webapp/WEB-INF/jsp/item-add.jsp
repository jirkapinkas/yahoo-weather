<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>New item:</h1>

	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:if test="${param.saved eq true}">
		<br />
		item saved
		<br />
	</c:if>

	<form:form commandName="item">
		name: 
		<form:input path="name" />
		<form:errors path="name" />
		<br />
		
		description:
		<form:input path="description" />
		<form:errors path="description" />
		<br />
		
		price:
		<form:input path="price" />
		<form:errors path="price" />
		<br />

		<input type="submit" value="save" />
	</form:form>

</body>
</html>