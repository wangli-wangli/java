<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2 align="center">用户<%=request.getParameter("op") %>功能</h2>
   <a  href="doAdd.jsp">增加用户</a>&nbsp;&nbsp;<a  href="list.jsp">修改用户</a>&nbsp;&nbsp;<a  href="list.jsp">删除用户</a>
</body>
</html>