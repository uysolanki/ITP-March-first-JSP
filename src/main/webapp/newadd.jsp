<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="newadd.jsp" method="get">
		Enter Number 1 : <input type="text" name="t1"><br> Enter
		Number 2 : <input type="text" name="t2"><br> <input
			type="submit" name="s1" value="ADDITION"><br>
	</form>


	<% if(request.getParameter("s1")!=null)
	{%>
	
	
	<%!int n1, n2, sum;

	double areaCircle(int radius) {
		return Math.PI * radius * radius;
	}%>
	
	<%
	n1 = Integer.parseInt(request.getParameter("t1"));
	n2 = Integer.parseInt(request.getParameter("t2"));
	sum = n1 + n2;
	//out.print(sum);
	%>
	<%@ include file="newheader.jsp"%>
	<h1>
		The Result is
		<%=sum%></h1>
	<%
	Random random = new Random();
	n1 = random.nextInt(100);
	%>

	<h1>
		The Area of Circle of radius
		<%=n1%>
		is
		<%=areaCircle(n1)%></h1>
	<%@ include file="header.html"%>
	
	<%}%>
</body>
</html>