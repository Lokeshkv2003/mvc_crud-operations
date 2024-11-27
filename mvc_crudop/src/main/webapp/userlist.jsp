<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*, java.io.*" %>
<html>
<head>
    <title>User List</title>
</head>
<style>

*{
  background-image: url('https://img.freepik.com/free-photo/fading-blue-background_53876-88684.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
h2{
color:"darkgreen";

}

</style>
<body>
<h2 align="center">List of Users</h2>
<br><br><br>
<table border="1" cellpadding="5" cellspacing="5" align="center">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    <% 
      try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con=DriverManager.getConnection
    	("jdbc:mysql://localhost/mvc","root","Lokeshk@2003");
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("select * from users");
        while(rs.next()){
     %>    
        <tr>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td>
                <a href="UserController?action=edit&userId="<%=rs.getString(1)%>>Edit</a>
                <a href="UserController?action=delete&userId=<%=rs.getString(1)%>" style="color: #cc0000">Delete</a>
            </td>
        </tr>
    <%
        }
      }
      catch(Exception exp){
    	  exp.printStackTrace();
      }
    %>
</table>
<br><br><br><br>
<a href="userform.jsp" >Add New User</a>
</body>
</html>