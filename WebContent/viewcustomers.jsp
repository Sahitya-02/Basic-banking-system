<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>
<style>
 *{padding: 0; margin: 0; box-sizing: border-box;}

   
 body{
  
    background-image:  linear-gradient(rgba(236, 227, 227, 0.3),rgba(240, 227, 227, 0.1)),url(https://wallpapercave.com/wp/wp4316561.jpg);
    font-family: 'Josefin Sans', cursive;
    
	
	
	
	min-height: 100vh;
	margin: 0;
    background-repeat: no-repeat;
    background-size: cover;
    
  }
header{
	padding:30px;
}
 
h1 {
	font-family: 'Dancing Script', cursive;
	font-size: 50px;
	margin-left: 500px;
}



button {
	border: none;
	outline: none;
	padding: 10px 20px;
	border-radius: 50px;
	color: #333;
	background: #fff;
	margin-bottom: 50px;
	
	box-shadow: 0 3px 20px 0 #0000003b;
}
button:hover{
	cursor: pointer;
}
.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
#requests {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 70%;
  height:50%;
  margin-left:17%;
  
}

#requests td, #requests th {
  border: 4px solid black;
  padding: 8px;
 color:black;
}





#requests th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #264653;
  color: white;
}


#submit{
	background-color: black;
	border: 2px solid black;
	border-radius: 4px;
	color: #fff;
	
	font-family: inherit;
	font-size: 16px;
	
	width: 100%;
}
#submit:hover{
	background-color: white;
	color: black;
}
.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
section{
	align:center;
}
section::after {
  content: "";
  display: table;
  
  clear: both;
}

/* Style the footer */
footer {
 
  padding: 10px;
  text-align: center;
  color: white;
}
</style>
</head>
<body>

<header>
<h1>CUSTOMER DETAILS</h1>
</header>

	
<section>
<table  border=1 id="requests">
	<tr>
	<th>CUSTOMER ID</th>
	<th>CUSTOMER NAME</th>
	<th>CUSTOMER BALANCE</th>
	<th></th>
	</tr>
	<%
	Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    ResultSet rs=con.createStatement().executeQuery("select * from customers");
    
    
    while(rs.next()){
    %>
    <tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getInt(4)%></td>
    
    <td><a href="transferm.jsp?cid=<%=rs.getString("cid")%>"><input type="submit" id="submit" value="Transfer Money"></a></td>
    </tr>
    <% 
    }
    %>
	
	</table>
<br><br>
</section>
<footer><a href="Homepage.html"><button class="button" style="vertical-align:middle"><span>GO BACK HOME</span></button></a></footer>
</body>
</html>