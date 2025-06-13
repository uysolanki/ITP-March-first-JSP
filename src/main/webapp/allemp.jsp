<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*,db.MySQLConnectionITP" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-..." crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function myConfirm()
{
return confirm("Are you Suere ?");
}
</script>
</head>
<body>
	<%
	try {
		Connection con = MySQLConnectionITP.getConnection(getServletContext());
		Statement st = con.createStatement();
		String query = "select * from emp";
		ResultSet rs = st.executeQuery(query);
	%>


	<a href='/ITPMarchFirstJSP/addemp.jsp' class='btn btn-primary'>Add	Employee</a>
	<table border='1' class='table'>
		<thead class='thead-dark'>
			<tr>
				<th>Employee No</th>
				<th>Employee Name</th>
				<th>Employee Salary</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getInt(3)%></td>

			<td><a href='deleteemp.jsp?t1=<%=rs.getInt(1)%>' class='btn btn-danger' onClick='return myConfirm()'>Delete</a></td>
			<td><a href='updateempform.jsp?t1=<%=rs.getInt(1)%>' class='btn btn-secondary' onClick='return myConfirm()'>Update</a></td>

		</tr>
		<%
		}
		%>
	</table>
	<%} catch (Exception e1) {
	out.print(e1.getMessage());
	}%>
</body>
</html>