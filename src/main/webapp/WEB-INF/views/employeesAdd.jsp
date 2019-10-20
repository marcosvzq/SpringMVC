<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h1>Add Employee</h1>
		<form:form action="${pageContext.request.contextPath}/save"
			modelAttribute="employee">


			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="">Enter Name:</label>
					<form:input class="form-control" path="name" />
					<form:errors path="name" style="color:Red"/>
				</div>
			</div>

			<h4>Select Gender:</h4>
			<div class="d-block my-3">
				<div class="custom-control custom-radio">
					<form:radiobutton path="gender" value="Male" />Male
				</div>
				<div class="custom-control custom-radio">
					<form:radiobutton path="gender" value="Female" />Female
				</div>
			</div>
		
			 
			<h4>Departement:</h4>
			<div class="row">
				<div class="col-md-5 mb-3">
					<form:select path="department" class="custom-select">
						<form:option value="Support">Support</form:option>
						<form:option value="Testing">Testing</form:option>
						<form:option value="Development">Development</form:option>
						<form:option value="Business Analyst">Business Analyst</form:option>
					</form:select>
				</div>
			</div>
			
			<h4>Date of Birth:</h4>
			<div class="row">
				<div class="col-md-3 md-3">
					<form:input path="dob" type="date" class="form-control"/>
				</div>
			</div>
			 
			<hr class="mb-4"/>
			<form:hidden path="id" />
			<button class="btn btn-primary" type="submit">Save</button>
			
		</form:form>

	</div>


</body>
</html>