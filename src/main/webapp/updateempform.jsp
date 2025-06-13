<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.MySQLConnectionITP" %>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-..." crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int eno=Integer.parseInt(request.getParameter("t1"));
String ename="";
int salary=0;

try {
Connection con=MySQLConnectionITP.getConnection(getServletContext());
String query="select * from emp where eno= ?";
PreparedStatement ps=con.prepareStatement(query);
ps.setInt(1, eno);

ResultSet rs=ps.executeQuery();
if(rs.next())
{
	ename=rs.getString("ename");
	salary=rs.getInt("sal");
}
else
	out.print("Record Not Deleted");
} catch (Exception e) {
e.printStackTrace();
}
%>


<form action="updateemp.jsp" method="post">
		<div class="form-group">
			<label for="exampleInputEmail1" class="col-form-label col-sm-2">Enter
				Emp Number</label>
			<div class="col-sm-6">
				<input  readonly type="text" class="form-control" id="exampleInputEmpNumber1"
					aria-describedby="emailHelp" placeholder="Enter Emp Number " name="t1" value="<%= eno %>">
			</div>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1" class="col-form-label col-sm-2">Enter
				Emp Name</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="exampleInpuEmpName1"
					placeholder="Enter Emp Name" name="t2" value="<%= ename %>">
			</div>
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1" class="col-form-label col-sm-2">Enter
				Emp Salary</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="exampleInputSalary1"
					placeholder="Enter Emp Salary" name="t3" value="<%= salary %>">
			</div>
		</div>

		<button type="submit" class="btn btn-primary" name="s1"
			value="SAVE">Submit</button>
	</form>
</body>
</html>