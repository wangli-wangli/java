<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>连接</title>
</head>
<body>
<%
  String type=request.getParameter("elementNum");
  String OperationNumber=request.getParameter("count");
  if(OperationNumber==null||"".equals(OperationNumber))
  {
	  OperationNumber="10";
  }
  if(type.equals("2"))
  {
	  response.sendRedirect("DoubleOperation.jsp?OperationNumber="+OperationNumber);
  }
  else
  {
	  response.sendRedirect("ThreeOperation.jsp?OperationNumber="+OperationNumber);
  }
  
%>


</body>
</html>