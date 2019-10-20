<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="header/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css"></link>

<title>Insert title here</title>
</head>
<body>

	<div class="container">

		<h1>List of Employees</h1>
		<table id="tbl-employees" class="table table-striped table-hover" style="width:100%">
			<thead>
				<tr>
					<th>Name</th>
					<th>Gender</th>
					<th>Department</th>
					<th>Date of Birth</th>
					<th>Actions</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="e">
				<tr>
					<td>${e.name}</td>
					<td>${e.gender}</td>
					<td>${e.department}</td>
					<td>${e.dob}</td>
					<td><a
						href="${pageContext.request.contextPath}/employee/${e.id}">Edit</a>
						| <a href="${pageContext.request.contextPath}/delete/${e.id}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<button class="btn btn-primary" id="addEmployee"
			onclick="window.location.href='${pageContext.request.contextPath}/openEmployeeView'">Add
			Employee</button>

		<!-- <button class="btn btn-primary" id="btnAddEmployee"
			data-toggle="modal" data-target="#addEmployeeModal">Add
			Employee</button> -->

	</div>

	<script src="js/employee.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/dataTables.bootstrap4.min.js"></script>
	
	
	
	<script>
		$(document).ready(function(){
			$('#tbl-employees').DataTable();
		})
	</script>
</body>
</html>