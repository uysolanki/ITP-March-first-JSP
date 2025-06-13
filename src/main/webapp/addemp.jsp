<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.MySQLConnectionITP"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- <form action="addemp.jsp" method="post">
		Enter Emp Number : <input type="text" name="t1"><br>
		Enter Emp Name : <input type="text" name="t2"><br> Enter
		Emp Salary : <input type="text" name="t3"><br> <input
			type="submit" name="s1" value="REGISTER EMPLOYEE"><br>
	</form> -->


	<form action="addemp.jsp" method="post">
		<div class="form-group">
			<label for="exampleInputEmail1" class="col-form-label col-sm-2">Enter
				Emp Number</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="exampleInputEmpNumber1"
					aria-describedby="emailHelp" placeholder="Enter Emp Number " name="t1">
			</div>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1" class="col-form-label col-sm-2">Enter
				Emp Name</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="exampleInpuEmpName1"
					placeholder="Enter Emp Name" name="t2">
			</div>
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1" class="col-form-label col-sm-2">Enter
				Emp Salary</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="exampleInputSalary1"
					placeholder="Enter Emp Salary" name="t3">
			</div>
		</div>

		<button type="submit" class="btn btn-primary" name="s1"
			value="REGISTER EMPLOYEE">Submit</button>
	</form>

	<%
	if (request.getParameter("s1") != null) {
		int eno = Integer.parseInt(request.getParameter("t1"));
		String ename = request.getParameter("t2");
		int salary = Integer.parseInt(request.getParameter("t3"));

		try {
			Connection con = MySQLConnectionITP.getConnection(application);
			String query = "insert into emp values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, eno);
			ps.setString(2, ename);
			ps.setInt(3, salary);

			int rows = ps.executeUpdate();
			if (rows > 0) {
		RequestDispatcher rd = request.getRequestDispatcher("/allemp.jsp");
		rd.forward(request, response);
			} else
		out.print("Record Not Inserted");
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
	%>
</body>
</html>