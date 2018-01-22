<%@page import="com.jaovo.msg.dao.UserDaoImpl" %>
<%@page import="com.jaovo.msg.model.User" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	//接收客户端传递过来的参数
	String id = request.getParameter("id");
    String password = request.getParameter("password");
	 UserDaoImpl a=new UserDaoImpl();

	User user=a.load2(id);
	
	String retur=a.isLogin(id,password);
	if(retur.equals("登录成功"))
	{
	response.sendRedirect("list.jsp");
	}
	else 
	{
		out.println(retur);

	}
	
%>	

</html>  