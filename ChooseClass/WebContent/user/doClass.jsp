<!-- doClass.jsp -->
<%@page import="com.jaovo.msg.dao.UserDaoImpl2"%>
<%@page import="com.jaovo.msg.model.Class2"%>
<%@page import="java.util.Map"%>
<%@ page import="com.jaovo.msg.Util.ValidateUtil" %>

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
//接收客户端传递过来的参数
	String  classname= request.getParameter("classname");
	String teacher= request.getParameter("teacher");
	String address = request.getParameter("address");
	 boolean validate = ValidateUtil.validateNull(request, new String[]{"classname","teacher","address"});
		if(!validate){
	   
	%>
	    <jsp:forward page="Class.jsp"></jsp:forward>
	<%
	    }
	Class2 class2 = new Class2();
	class2.setClassname(classname);
	class2.setTeacher(teacher);
	class2.setAddress(address);
	UserDaoImpl2 userDao2 = new UserDaoImpl2();
	userDao2.add(class2);
	out.println("添加成功！！");
%>

</body>
</html>