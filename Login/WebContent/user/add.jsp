<%@ page import="com.jaovo.msg.Util.ValidateUtil" %>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户添加页面</title>
</head>
<body>
<%
   Map<String,String> errorMsg=(Map<String,String>)request.getAttribute("errormsg");
%>
   <jsp:include page="ics.jsp">
   <jsp:param name="op" value="添加"/>
   </jsp:include>
   <h2> 增加用户</h2>
   <form action="doAdd.jsp" method="post">
   <table align="center" width="50%" border="1">
   <tr><td> 学号</td>
   <td><input type="text" name="id"/>
   <%=ValidateUtil.showError(request, "id") %></td></tr>
   <tr><td> 用户名</td>
   <td><input type="text" name="username"/>
   <%=ValidateUtil.showError(request, "username") %></td></tr></td></tr>
   <tr><td>密码</td>
   <td><input type="text" name="password"/>
   <%=ValidateUtil.showError(request, "password") %></td></tr></td></tr>
   <tr><td colspan="2" align="center">
   <input type="submit" value="提交"/>
   <input type="submit" value="重置"/></td></tr>

</table>
</form>   
 </body>
</html>