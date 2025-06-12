<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.MySQLConnectionITP" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form action="addemp.jsp" method="post">
			Enter Emp Number  : <input type="text" name="t1"><br>
			Enter Emp Name  : <input type="text" name="t2"><br>
			Enter Emp Salary  : <input type="text" name="t3"><br>
			<input type="submit" name="s1" value="REGISTER EMPLOYEE"><br>
		</form>
		
		<%
		if(request.getParameter("s1")!=null)
		{
		int eno=Integer.parseInt(request.getParameter("t1"));
		String ename=request.getParameter("t2");
		int salary=Integer.parseInt(request.getParameter("t3"));
		
		try {
			Connection con=MySQLConnectionITP.getConnection(application);
			String query="insert into emp values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, eno);
			ps.setString(2, ename);
			ps.setInt(3, salary);
			
			int rows=ps.executeUpdate();
			if(rows>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/confirm.jsp");
				rd.forward(request, response);
			}
			else
				out.print("Record Not Inserted");
		} catch (Exception e) {
			out.print(e.getMessage());
		}
		}
		%>
</body>
</html>