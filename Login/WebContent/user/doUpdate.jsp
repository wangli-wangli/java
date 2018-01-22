<%@page import="com.jaovo.msg.model.User" %>
<%@page import="com.jaovo.msg.dao.UserDaoImpl" %>
<%@ page import="com.jaovo.msg.Util.ValidateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String password=request.getParameter("password");
    String id=request.getParameter("id");
    UserDaoImpl Dao=new UserDaoImpl();
    User user1=Dao.load2(id);
    boolean validate = ValidateUtil.validateNull(request, new String[]{"password"});
	if(!validate){
 %>
    <jsp:forward page="Update.jsp"></jsp:forward>
 <% 
    }
    User user=new User();
    user.setName(user1.getName());
    user.setPassword(password);
    user.setId(user1.getId());
    UserDaoImpl userdao=new UserDaoImpl();
    userdao.update(user);
    out.println("修改成功");
 
    
%>
</html>