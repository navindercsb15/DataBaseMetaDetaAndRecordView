<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="process.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	String data = request.getParameter("database");
	session.setAttribute("database", data);
	Class.forName("com.mysql.jdbc.Driver");
	
	// localhost or IP address() : is a machine name
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+data, "root" , "nav15csb");
	DatabaseMetaData dbms = conn.getMetaData();
	String table[] = {"TABLE"};
	ResultSet rs1 = dbms.getTables(null, null,null, table);
	if(rs1.next()){
	%>
		<table border="1" style="border-collapse: collapse;" align="center">
			<tr>
				<th style="padding: 8px;">Tables in the <%=data %> database</th>
				<th>View Structure</th>
				<th>View Record</th>
			</tr>
	<%
	while(rs1.next()){
		%>
		<tr>
			<td><%= rs1.getString(3).toUpperCase()%></td>
			<td><a href="tablestructure.jsp?id=+<%= rs1.getString(3)%>">Metadata</a></td>
			<td><a href="tablerecord.jsp?id=+<%= rs1.getString(3)%>">Records</a></td>
		</tr>
		<%
	}
}
	else{
		out.println("No such database exits.");
	}
%>
</table>
</body>
</html>