<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
	String tablename = request.getParameter("id");
    String data= session.getAttribute("database").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+data, "root" , "nav15csb");
	PreparedStatement ps;
	ps = conn.prepareStatement("select * from"+tablename);
	ResultSet rs = ps.executeQuery();
	ResultSetMetaData rm = rs.getMetaData();
	int count = rm.getColumnCount();
	%>
		<div id="container">
		<h3>MetaData Of Table <%=tablename %> of Database <%=data %></h3>
		<table border="1" style="border-collapse: collapse;" align="center">
			<tr>
				<th>Column Name</th>
				<th>Column Type</th>
				<th>Size</th>
				<th>Column Class Name</th>
			</tr>
	<%
		for(int i=1;i<=count;i++){
			%>
			<tr>
				<td><%= rm.getColumnName(i) %></td>
				<td><%= rm.getColumnTypeName(i) %></td>
				<td><%= rm.getColumnDisplaySize(i) %></td>
				<td><%= rm.getColumnClassName(i) %></td>
				
			</tr>
			<%
		}
%>
</table>
</div>
</body>
</html>