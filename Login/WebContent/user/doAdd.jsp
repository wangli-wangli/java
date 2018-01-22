<%@page import="com.jaovo.msg.model.User"%>
<%@page import="com.jaovo.msg.dao.UserDaoImpl" %>
<%@ page import="com.jaovo.msg.Util.ValidateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
  
    String id=request.getParameter("id"); 
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    boolean validate = ValidateUtil.validateNull(request, new String[]{"id","username","password"});
	if(!validate){
   
%>
    <jsp:forward page="add.jsp"></jsp:forward>
<%
    }
    User user=new User();
    user.setId(id);
    user.setName(username);
    user.setPassword(password);
    UserDaoImpl userdao=new UserDaoImpl();
    userdao.add(user);
    out.println("添加成功");
    response.sendRedirect("list.jsp");
%>
  
</html>