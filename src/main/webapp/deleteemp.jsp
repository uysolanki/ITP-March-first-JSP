<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.MySQLConnectionITP" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int eno=Integer.parseInt(request.getParameter("t1"));


	try {
	Connection con=MySQLConnectionITP.getConnection(getServletContext());
	String query="delete from emp where eno= ?";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setInt(1, eno);
	
	int rows=ps.executeUpdate();
	if(rows>0)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/allemp.jsp");
		rd.forward(request, response);
	}
	else
		out.print("Record Not Deleted");
} catch (Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>