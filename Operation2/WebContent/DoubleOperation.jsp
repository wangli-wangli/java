<%@ page import="java.util.Random" %> 
<%@ page import="java.lang.Math" %>
<%@ page import="com.jaovo.msg.model.DoubleOperation" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二元运算</title>
   <script type="text/javascript" src="js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="js/demo.js" ></script>      
</head>
<body style="background-image:url(image/xuanze.jpg) ;background-size:cover">
<form action="doDoubleOperation.jsp" method="post">
<div style="text-align:right;">
<span style="color:red;font-size:25px"><a href="choose.jsp">题目定制</a>&nbsp;&nbsp;
<a href="Welcome.jsp">退出</a><br><br></span>

</div>
<% 
 int character=0;//运算符+，-，*，/
 int num1=0;//运算式中第一个数
 int num2=0;//运算式中第二个数
 int correct=0;//计算正确的数目
 int error=0;//计算错误的数目
 String operat=null;//计算式
 Random random = new Random();
 int Endtime=1; //跳转时间
 int operationNumber=Integer.parseInt(request.getParameter("OperationNumber"));//打印题目的数量
 int minute=30*operationNumber/60;
 %>
  <span style="color:red;font-size:27px">本次测试共有<%=operationNumber %>道题，满分100分，期望时间不超过<%=minute %>分钟，请小朋友们注意时间答题哦！
</span>
  <br><br>
 <% 
 String question[]=new String[operationNumber];
 double result[]=new double[operationNumber];//计算式的结果
  for(int i=0;i<operationNumber;i++)//初始化计算式的结果
  {
	  result[i]=0;
	  question[i]=null;
  }
 
  DoubleOperation doubleoperation=new DoubleOperation();//初始化.java文件中存储的计算公式个数，问题，答案
  doubleoperation.setOperationNumber(operationNumber);
  doubleoperation.setQuestion(question);
  doubleoperation.setResult(result); 
  
  for(int i=0;i<operationNumber;i++) 
  { 
	 
	character=random.nextInt(4)%4+1; 
	if(character==1)//计算加法
	{
		num1=random.nextInt(100)%100;//随机出一个0~100的数
		num2=random.nextInt(100)%100;
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"+"+number2+"=";
		result[i]=num1+num2;
	}
	else if(character==2)//计算减法
	{
		num1=random.nextInt(100)%100;//随机出一个1~100的数
		if(num1==0)
			num1=num1+2;//若num1=0,则加2
		num2=(int)random.nextInt(num1)%(num1);//随机出一个0~num1的数
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"-"+number2+"=";
		result[i]=num1-num2;
	}
	else if(character==3)//计算乘法
	{
		num1=random.nextInt(9)%9;//随机出一个0~9的数
		num2=random.nextInt(9)%9;
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"×"+number2+"=";
		result[i]=num1*num2;
	}
	else //计算除法
	{
		do{
		num1=random.nextInt(81)%81;//随机出一个0~81的数
		if(num1>9)
		    num2=random.nextInt(9)%9;
		else 
		{
			if(num1==0)
				num1++;
			num2=(int)random.nextInt(num1)%(num1);
		}
		if(num2==0)//当num2=0再重新生成num2
		{
			num2=num2+1;
		} 
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"÷"+number2+"=";
		result[i]=num1/num2;
		}while((result[i]>=10)||(num1%num2!=0));//商为10以内的数
		
	}
	
	if(Double.valueOf(result[i])>100) {//如果结果大于100或小数位数大于1则不输出
		i--;
	}
	else {
		question[i]=operat;
	    %>
	    <span style="font-size:22px"><%=operat %><input  size="10" type="text" name="child_result<%=i %>" ><br> <br>
	    </span>
		<% 
		
	}
}
 
%>
 <input type="submit" style="font-size:20px;background-color:pink" value="提交" name="提交">  

<%


doubleoperation.setOperationNumber(operationNumber);
doubleoperation.setQuestion(question);
doubleoperation.setResult(result); 

%>


<%-- <meta http-equiv="refresh" content ="<%=Endtime*60 %>;url=doDoubleOperation.jsp">  --%>
<!-- Endtime分钟后跳转到结果界面 -->
<input name="time" class="timer" type="text" />
</form>
</body>
</html>