<%@page import="com.jaovo.msg.dao.UserDaoImpl" %>
<%@page import="java.util.List" %>
<%@page import="com.jaovo.msg.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理系统</title>
</head>
<%
    UserDaoImpl userDao=new UserDaoImpl();
    List<User> users=userDao.load();
%>
<body>
  <jsp:include page="ics.jsp">
   <jsp:param name="op" value="添加"/>
   </jsp:include>
     <h2 align="center" >信息管理系统</h2>
     <table align="center" border="1" width="500">
       <tr>
           <td>学号</td>
          <td>姓名</td>
          <td>密码</td>
          <td>管理</td>
       </tr>
       <%
         for(User user:users){
       %>
       <tr>
         <td><%=user.getId() %></td>
         <td><%=user.getName() %></td>
         <td><%=user.getPassword() %></td>
         
         <td> <a href="delete.jsp?id=<%=user.getId() %>">删除</a>
         <a href="Update.jsp?id=<%=user.getId()%>">修改</a></td>
         </tr>
        <%
         }
        %> 
        
     
     
     
     
     </table>
</body>
</html>