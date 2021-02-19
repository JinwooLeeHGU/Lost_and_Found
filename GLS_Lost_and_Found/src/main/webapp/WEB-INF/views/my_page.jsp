<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>Lost & Found</title>
<style>
#page_name {
	text-align:center;
	margin : 100px;
}
</style>
</head>
<body>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	
	<%@include file="./modules/header.jsp" %>
	
	
	<div id="page_name">Hello this is my page</div>

	<%-- <center>
		<table border="3" width="70%">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Salary</th>
				<th>Designation</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="emp" items="${list}">
				<tr>
					<td>${emp.id}</td>
					<td>${emp.name}</td>
					<td>${emp.salary}</td>
					<td>${emp.designation}</td>
					<td><a href="editemp/${emp.id}">Edit</a></td>
					<td><a href="deleteemp/${emp.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</center> --%>

	<br>
	<br>
	
	<%@include file="./modules/footer.jsp"%>
	
</body>
</html>