<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Customer</title>

<link type="text/css" 
	  rel="stylesheet" 
	  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>
		<div id="wrapper">
			<div id="header">
				<h2> Customer Relationship Management</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
			
			<!--  Add button -->
			
			<input type="button" value ="Add Customer" onclick="window.location.href = 'showFormForAdd';return false;" class="add-button"/>
			 <!--  add a search box -->
            <form:form action="search" method="POST">
                Search customer: <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
            </form:form>

				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					
					<c:forEach var="tempCustomer" items="${customers}">
					<c:url var = "updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param>
					</c:url>
					
					<c:url var = "deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param>
					</c:url>
					
					<tr>
						<td> ${tempCustomer.firstName}</td>
						<td> ${tempCustomer.lastName}</td>
						<td> ${tempCustomer.email}</td>
						<td> <a href="${updateLink}">Update</a>|<a href="${deleteLink}" onclick="if (!(confirm('Are you sure, you want to delete this customer?'))) return false">Delete</a></td>
						<td></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
</body>
</html>