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
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+session.getAttribute("database").toString(), "root" , "nav15csb");
	PreparedStatement ps;
	ps = conn.prepareStatement("select * from "+tablename);
	ResultSet rs = ps.executeQuery();
	ResultSetMetaData rm = rs.getMetaData();
	int count = rm.getColumnCount();
	%>
		<div id="container">
		<h2>Records Of The Table</h2>
		<table border="1" style="border-collapse: collapse;" align="center">
			<tr>
	<%
	for(int i=1;i<=count;i++){
		%>
				<th><%= rm.getColumnName(i)%></th>
		<%
	}
	%>
			</tr>
			<tr>
	<%
		while(rs.next()){
			for(int k=1;k<=count;k++){
				%>
					<td><%=rs.getString(k) %></td>
				<%
			}
			%>
				</tr>
			<%
		}
%>
</table>
</div>
</body>
</html>