<%@page import="com.jaovo.msg.dao.UserDaoImpl" %>
<%@page import="com.jaovo.msg.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
    String id=request.getParameter("id");
    UserDaoImpl userDao=new UserDaoImpl();
    User user=userDao.load2(id);
    userDao.delete(user.getName());
    
 %>
 删除成功！
</body>
</html>