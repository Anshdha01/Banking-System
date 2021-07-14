<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
try {
	String qr="select name from customers";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Transfer</title>
<link href="customer.css" rel="stylesheet" />
</head>
<body>
<nav class="navigation">
		<span class="nav-title"></span>
		<a class="nav-home" href="index.html"><img src="img/home1.png"></a>
	</nav>
<div class="form_wrapper">
<form action="Transfer" style=margin-top:20px; margin-bottom:50px;>
<pre>
Enter Amount<input type="number" name="amount" required="required" />
Today's date<input type="date" onload="getDate()" class="form-control" id="date" name="date" required="required" />
To<select name="recepient" required="required">
<% while(rs.next()){
	String name = rs.getString("name");%>
	<option value="<%=name %>"><%=name %></option>
<% } %>
</select>
<%
}
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<input type="submit" value="Send" />
</pre>
</form>
</div>
</body>
</html>