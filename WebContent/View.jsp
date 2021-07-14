<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="db.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Customers</title>

<meta content="" name="description">
<meta content="" name="keywords">

<link href="customer.css" rel="stylesheet" />
</head>

<body>
	<nav class="navigation">
		<span class="nav-title"></span>
		<a class="nav-home" href="index.html"><img src="img/home1.png"></a>
	</nav>
<%
try {
	String qr="select * from customers";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
		out.println("<table align=center");
		out.println("<tr><th>Name</th><th>E-mail</th><th>Contact</th><th>Account_no</th><th>Address</th><th>Balance</th><th>#</th></tr>");
		do
		{
			String name=rs.getString("name");
			String email=rs.getString("email");
			String contact=rs.getString("contact");
			String accountno=rs.getString("accountno");
			String address=rs.getString("address");
			String balance=rs.getString("balance");
			out.println("<tr>");
			out.println("<td>");
			out.println(name);
			out.println("</td>");
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
			out.println("<a href=Open.jsp?name="+name+">Open</a>");
			out.println("</td>");
			out.println("</tr>");
		}while(rs.next());
		out.println("</table>");
	}
	con.close();
} catch (Exception e) {
	// TODO Auto-generated catch block
	out.println(e);
}
%>
</body>
</html>