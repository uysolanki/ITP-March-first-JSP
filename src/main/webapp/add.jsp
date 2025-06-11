<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- <h1>Welcome to my JSP page</h1>  -->
<%!int n1,n2,sum; 
double areaCircle(int radius)
{
	return Math.PI*radius*radius;
}
%>
<%
n1=Integer.parseInt(request.getParameter("t1"));
n2=Integer.parseInt(request.getParameter("t2"));
sum=n1+n2;
//out.print(sum);
%>
<%@ include file="header.html" %>
<h1>The Result is <%= sum %></h1>
<%
Random random=new Random();
n1=random.nextInt(100);
%>

<h1>The Area of Circle of radius <%=n1 %> is <%= areaCircle(n1) %></h1>
<%@ include file="header.html" %>
</body>
</html>