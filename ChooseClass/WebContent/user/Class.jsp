<!-- Class.jap -->
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
   Map<String,String> errorMsg=(Map<String,String>)request.getAttribute("errormsg");
%>

   <form action="doClass.jsp" method="post">
   <table align="center" width="50%" border="1">
   <tr><td>课程名称</td>
   <td><input type="text" name="classname"/>
   <%=ValidateUtil.showError(request, "classname")%></td></tr>
  
   <tr><td> 任课教师</td>
   <td><input type="text" name="teacher"/>
   <%=ValidateUtil.showError(request, "teacher")%></td></tr>
   <tr><td> 上课地点</td>
   <td><input type="text" name="address"/>
   <%=ValidateUtil.showError(request, "address")%> </td></tr>
   <tr><td colspan="2" align="center">
   <input type="submit" value="保存"/>
   </td></tr>

</table>
 </form>  

</body>
</html>
