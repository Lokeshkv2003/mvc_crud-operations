<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>User Form</h2>
<form action="UserController" method="post">

<table border>

 <tr>
 <td>Name:</td>
 <td><input type="text" name="name"></td>
 </tr>
 
 <tr>
 <td>Email:</td>
 <td><input type="text" name="email"></td>
 </tr>
 
 <tr>
 <td>Country:</td>
 <td><input type="text" name="country"></td>
 </tr>
 
 <tr>
 <td>
 <input type="hidden" name="userId">
 </td>
 <td>
 <input type="submit" name="submit">
 </td>

 </tr>
 

</table>
</form>
<br><br>

<a href="UserController?action=listUser">User List</a>
</body>
</html>