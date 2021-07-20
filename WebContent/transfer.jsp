<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>


  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Success</title>
<style>
 *{padding: 0; margin: 0; box-sizing: border-box;}

   
 body{
  
    background-image:  linear-gradient(rgba(236, 227, 227, 0.3),rgba(240, 227, 227, 0.3)),url(https://wallpapercave.com/wp/wp4316561.jpg);
    font-family: 'Josefin Sans', cursive;
   
	margin: 0;
    background-repeat: no-repeat;
    background-size: cover;
    
  }
.form-container {
	margin-top: 5%;
	
	align-items:center;
	margin-left:35%;
	width:450px;
	border: 5px solid black;
	border-radius:10px;
	
	box-shadow: 2px 2px 20px black;
}

.form-container label {
	display: block;
	margin-bottom: 5px;
	margin-left:22px;
	
}
.form-container input {
	border: 2px solid black;
	border-radius: 4px;
	display: block;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
	width: 80%;
	margin-left:22px;
	
	
	
}



/* Add some hover effects to buttons */
.form-container .btn:hover {
  opacity: 1;
   
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
.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
footer {
 
  padding: 10px;
  text-align: center;
  color: white;
}

</style>
</head>
<body>
<%
	int cid=Integer.valueOf(request.getParameter("cid"));
	int rid=Integer.valueOf(request.getParameter("rid"));
	int amt=Integer.valueOf(request.getParameter("amt"));
	Connection con=null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Driver class loaded");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	PreparedStatement psmt=con.prepareStatement("select * from customers where cid=?");
	psmt.setInt(1, cid);
	ResultSet rs=psmt.executeQuery();
	rs.next();
	int	bal=rs.getInt(4);
	System.out.println(bal);
	int cbalance=bal-amt;
	PreparedStatement pstmt=con.prepareStatement("update customers set balance=? where cid=?");
	pstmt.setInt(1,cbalance);
	pstmt.setInt(2, cid);
	pstmt.executeUpdate();
	System.out.println(bal-amt);  
	PreparedStatement psmt1=con.prepareStatement("select * from customers where cid=?");
	psmt1.setInt(1, rid);
	ResultSet rs1=psmt1.executeQuery();
	rs1.next();
	bal=rs1.getInt(4);
	System.out.println(bal);
	int rbalance=amt+bal;
	PreparedStatement pstmt2=con.prepareStatement("update customers set balance=? where cid=?");
	pstmt2.setInt(1,rbalance);
	pstmt2.setInt(2, rid);
	pstmt2.executeUpdate();
	System.out.println(bal+amt);
	

%>
<%
PreparedStatement psmt2=con.prepareStatement("select * from customers where cid=?");
psmt2.setInt(1, cid);
rs=psmt2.executeQuery();
rs.next();
%>

<form class="form-container">
	<h1 align="center">PAYMENT SUCCESSFUL</h1><br><br>

    <label for="customer id" ><b>CUSTOMER ID</b></label>
    <input type="number"  name="cid" value="<%=cid%>"  readonly>
      <label for="customer name"><b>CUSTOMER NAME</b></label>
    <input type="text"  name="cname" value="<%=rs.getString(2)%>" readonly>
     <label for="customer location"><b>CUSTOMER LOCATION</b></label>
    <input type="text"  name="cloc" value="<%=rs.getString(3)%>" readonly>
    
     <label for="customer balance"><b>CURRENT BALANCE</b></label>
    <input type="number" id="cbal"  name="cbal" value="<%=rs.getInt(4)%>" readonly>
	<br>
	</form>
	<footer>
	<a href="viewcustomers.jsp"><button class="button" style="vertical-align:middle"><span>View Customers </span></button></a>
	</footer>
</body>
</html>