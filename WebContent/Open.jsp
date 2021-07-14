<%@page import="java.sql.ResultSet"%>
<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link href="customer.css" rel="stylesheet" />
</head>
<body>
<nav class="navigation">
		<span class="nav-title"></span>
		<a class="nav-home" href="index.html"><img src="img/home1.png"></a>
</nav>
<%
String name=request.getParameter("name");
try {
	String qr="select * from customers where name=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, name);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		session.setAttribute("name", name);
		out.println("<table align=center >");
		out.println("<tr><th>E-mail</th><th>Contact</th><th>Account_no</th><th>Address</th><th>Balance</th><th>#</th></tr>");
		do
		{
			String email=rs.getString("email");
			String contact=rs.getString("contact");
			String accountno=rs.getString("accountno");
			String address=rs.getString("address");
			String balance=rs.getString("balance");
			session.setAttribute("balance", balance);
			out.println("<tr>");
			out.println("<td>");
			out.println(email);
			out.println("</td>");
			out.println("<td>");
			out.println(contact);
			out.println("</td>");
			out.println("<td>");
			out.println(accountno);
			out.println("</td>");
			out.println("<td>");
			out.println(address);
			out.println("</td>");
			out.println("<td>");
			out.println(balance);
			out.println("</td>");
			out.println("<td>");
			out.println("<a href=\"transfer.jsp\">Transfer Money</a>");
			out.println("</td>");
			out.println("</tr>");
		}while(rs.next());
		out.println("</table>");
	}
	else{
		out.println("wrong");
	}
	con.close();
} catch (Exception e) {
	// TODO Auto-generated catch block
	out.println(e);
}
%>
</body>
</html>