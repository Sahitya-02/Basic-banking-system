<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TransferMoney</title>
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
	margin-top: 10%;
	
	align-items:center;
	margin-left:37%;
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

.form-container .btn {
  background-color: green;
   
	border: 2px solid green;
	border-radius: 4px;
	color: #fff;
	display: inline-block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	margin-left:30px;
	margin-top: 20px;
	width: 40%;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
	border: 2px solid red;
	border-radius: 4px;
	color: #fff;
	display: inline-block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	margin-top: 20px;
	width: 40%;
}

/* Add some hover effects to buttons */
.form-container .btn:hover {
  opacity: 1;
   
}

</style>
</head>
<body>
<%
int cid=Integer.valueOf(request.getParameter("cid"));
Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver class loaded");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement pstmt=con.prepareStatement("select * from customers where cid=?");
pstmt.setInt(1, cid);
ResultSet rs=pstmt.executeQuery();
rs.next();
String name=rs.getString(2);
int bal=rs.getInt(4);


%>

<form action="transfer.jsp" class="form-container">
    <h1 align="center">MONEY TRANSFER</h1><br>

    <label for="customer id" ><b>YOUR ID</b></label>
    <input type="number"  name="cid" value="<%=cid%>"  readonly>

    <label for="customer name"><b>YOUR NAME</b></label>
    <input type="text"  name="cname" value="<%=name%>" readonly>
    
     <label for="customer balance"><b>CURRENT BALANCE</b></label>
    <input type="number" id="cbal"  name="cbal" value="<%=bal%>" readonly>
   
	
	<label for="recipient"><b>Transfer to</b></label>
    <input type="number" placeholder="Enter Recipient Customer ID" name="rid">
    
    <label for="amt"><b>Amount to transfer</b></label>
    <input type="number"  id="check" name="amt" placeholder="Enter amount">
    
   

    <button type="submit" class="btn">Make Transfer</button>
    <button type="button" class="btn cancel" >Cancel</button>
    <br><br>
  </form>
  
</body>
</html>