<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.MySQLConnectionITP"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int eno = Integer.parseInt(request.getParameter("t1"));
	String ename = request.getParameter("t2");
	int salary = Integer.parseInt(request.getParameter("t3"));

	try {
		Connection con = MySQLConnectionITP.getConnection(getServletContext());
		String query = "update emp set ename=?,sal=? where eno=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, ename);
		ps.setInt(2, salary);
		ps.setInt(3, eno);

		int rows = ps.executeUpdate();
		if (rows > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/allemp.jsp");
			rd.forward(request, response);
		} else
			out.print("Record Not Updated");
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>