<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Developed By Navinder</title>
<link href="style.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
function fetch(){
	var input = document.getElementById('database').value;
	var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        	var data = this.responseText;
        	document.getElementById('show').innerHTML = data;
        }
    };
    xmlhttp.open("GET", "process.jsp?database="+input, true);
    xmlhttp.send();
    //xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //xmlhttp.send("fname=Navinder&lname=Singh");
}
</script>
</head>
<body>
<div id="container">
	<h1>Structure of The DataBase</h1>
	<marquee>This application is used to see the tables and its metadata of the database you want.</marquee>
	<form>
		<label>Enter Database Name: </label>
		<input id="database" type="text" name="database">
		<button onclick="return false;" onmousedown="fetch();">Click</button>
	</form>
	<Strong>Developed By Navinder</Strong>
	<div id="show"></div>
</div>
</body>
</html>