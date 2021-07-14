<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction History</title>
<link href="customer.css" rel="stylesheet" />
</head>
<body>
<nav class="navigation">
		<span class="nav-title"></span>
		<a class="nav-home" href="index.html"><img src="img/home1.png"></a>
</nav>
<%
try {
	String qr="select * from transfers";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
		out.println("<table align=center>");
		out.println("<tr><th>Date of Transaction</th><th>Sender</th><th>Receiver</th><th>Amount</th></tr>");
		do
		{
			String dt=rs.getString("dt");
			String sender=rs.getString("sender");
			String receiver=rs.getString("receiver");
			String amount=rs.getString("amount");
			out.println("<tr>");
			out.println("<td>");
			out.println(dt);
			out.println("</td>");
			out.println("<td>");
			out.println(sender);
			out.println("</td>");
			out.println("<td>");
			out.println(receiver);
			out.println("</td>");
			out.println("<td>");
			out.println(amount);
			out.println("</td>");
			out.println("</tr>");
		}while(rs.next());
		out.println("</table>");
	}
	else
	{
		out.println("no records found");
	}
	con.close();
} catch (Exception e) {
	// TODO Auto-generated catch block
	out.println(e);
}
%>
</body>
</html>