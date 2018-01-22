
<!-- login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head> 
<body>
   <form action="doLogin.jsp"  method="get" >
   <h2 align="center">用户登录</h2>
   <table align="center" width="50%" border="1">
   <tr><td> 学号：</td>                                                             s             
      <td><input type=" text" name="id"/></td></tr>
   <tr><td>  登录密码：</td>
     <td><input type="password" name="password"/></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="登录" ><td></tr>
    </table>
   </form>
</body>
</html>