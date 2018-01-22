
<%@ page import="com.jaovo.msg.model.DoubleOperation" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image:url(image/zuihou.jpg) ;background-size:cover">
<div style="text-align:right;">
<span style="color:red;font-size:25px"><a href="choose.jsp">题目定制</a>&nbsp;&nbsp;
<a href="Welcome.jsp">退出</a><br><br></span>
</div>

<%
    int correct=0;//计算正确的数目
    int error=0;//计算错误的数目
    int nullerror=0;//没答题的数目 
     DoubleOperation doubleoperation=new DoubleOperation();
    double[] result=doubleoperation.getResult();
    String[] question=doubleoperation.getQuestion();
    int operationNumber=doubleoperation.getOperationNumber();
    System.out.println("count="+operationNumber);
    for(int i=0;i<operationNumber;i++)
    {
        String child_result=request.getParameter("child_result"+i);
        %>
        
       <span style="font-size:22px"> <%=question[i] %><%=child_result %></span>
<% 
        if((null==child_result)||("".equals(child_result)))
        {
        	nullerror++;
        	%>
        	<span style="font-size:22px"><span style="color:red">×</span>&nbsp;&nbsp;&nbsp;正确答案是<%=result[i]%></span><br><br>
        	<% 
        }
        else
        {
        	double child_result2=Double.valueOf(child_result);
          if(child_result2==result[i])
          {
        	 correct++;
        	 %>
        	<span style="font-size:25px;color:green">√</span><br><br>
        	 <% 
          }
          else
          {
        	error++;
        	%>
       	 <span style="font-size:25px"><span style="color:red;font-size:25px">×</span>&nbsp;&nbsp;&nbsp;正确答案是<%=result[i]%></span><br><br>
       	 <% 
           }
        }
    }
%>
<span style="color:red;font-size:27px">恭喜你！答对了<%=correct %>道题，答错了<%=error %>道题，没答<%=nullerror %>道题,共得分<%=(correct*100/operationNumber)%>！！！ 用时：<%=request.getParameter("time") %>
</span>
</body>
</html>