<%@page import="com.jaovo.msg.dao.UserDaoImpl" %>
<%@ page import="com.jaovo.msg.Util.ValidateUtil" %>
<%@page import="com.jaovo.msg.model.User" %>
<%@page import="java.util.Map" %>
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
    User user2=userDao.load2(id);
    Map<String,String> errorMsg=(Map<String,String>)request.getAttribute("errormsg");
 %>
   <jsp:include page="ics.jsp">
   <jsp:param name="op" value="添加"/>
   </jsp:include>
    <h2>修改用户</h2>
         只能修改密码
    <form action="doUpdate.jsp" method="post">
    <table align="center" width="70%" border="1">
    <tr><td>学号</td>
    <td><input type="text" name="id" value="<%=id %>"/></td></tr>
    <tr><td>用户名</td>
    <td><input type="text" name="username" value="<%=user2.getName()%>"/></td></tr>
   
    <tr><td>密码</td>
    <td><input type="password" name="password"/>
     <%=ValidateUtil.showError(request, "password") %></td></tr>
    <tr><td colspan="2" align="center">
    <input type="submit" value="提交"/></td></tr>    
  </table>
 </form>
 
</body>
</html>