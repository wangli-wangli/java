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
<title>三元运算</title>
<script type="text/javascript" src="js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="js/demo.js" ></script>
</head>
<body style="background-image:url(image/xuanze.jpg) ;background-size:cover">
<form action="doThreeOperation.jsp" method="post">
<div style="text-align:right;">
<span style="color:red;font-size:25px"><a href="choose.jsp">题目定制</a>&nbsp;&nbsp;
<a href="Welcome.jsp">退出</a><br><br></span>
</div>

<%
int character1=0;//第一个运算符+，-，*，/
 int character2=0;//第二个运算符 
 int num1=0;//运算式中第一个数
 int num2=0;//运算式中第二个数
 int num3=0;//运算式中的第三个数
 int correct=0;//计算正确的数目
 int error=0;//计算错误的数目
 String operat=null;//计算式
 int operationNumber=Integer.parseInt(request.getParameter("OperationNumber"));//打印题目的数量
 int minute=30*operationNumber/60;
 %>
 <span style="color:red;font-size:27px">本次测试共有<%=operationNumber %>道题，满分100分，期望时间不超过<%=minute %>分钟，请小朋友们注意时间答题哦！
</span>
  <br><br>
<% 
 String question[]=new String[operationNumber];
 double result[]=new double[operationNumber];//计算式的结果
 Random random = new Random();
 int Endtime=1; //跳转时间

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
	 
	character1=random.nextInt(4)%4+1; 
	if(character1==1)//计算加法
	{
		num1=random.nextInt(100)%100;//随机出一个0~100的数
		num2=random.nextInt(100)%100;
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"+"+number2;
		result[i]=num1+num2;
	}
	else if(character1==2)//计算减法
	{
		num1=random.nextInt(100)%100;//随机出一个1~100的数
		if(num1==0)
			num1=num1+2;//若num1=0,则加2
		num2=(int)random.nextInt(num1)%(num1);//随机出一个0~num1的数
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"-"+number2;
		result[i]=num1-num2;
	}
	else if(character1==3)//计算乘法
	{
		num1=random.nextInt(9)%9;//随机出一个0~9的数
		num2=random.nextInt(9)%9;
		String number1=String.valueOf(num1);
		String number2=String.valueOf(num2);
		operat="第("+(i+1)+")题： "+number1+"×"+number2;
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
		operat="第("+(i+1)+")题： "+number1+"÷"+number2;
		result[i]=num1/num2;
		}while((result[i]>=10)||(num1%num2!=0));//商为10以内的数
		
	}
	
	
	
	
	character2=random.nextInt(4)%4+1; 
	if(character2==1)//计算第二个加号
	{
		num3=random.nextInt(100)%100;
		String number3=String.valueOf(num3);
		operat=operat+"+"+num3+"=";
		result[i]=result[i]+num3;
	}
	else if(character2==2)//第二个运算符是减号
	{
		if(result[i]==0)
			result[i]=result[i]+2;
		if(result[i]<100){
		     num3=(int)random.nextInt((int)result[i])%((int)result[i]);//随机出一个小于被减数的数
		}
		else
		{
			num3=random.nextInt(100)%100;
		}
		String number3=String.valueOf(num3);
	    operat=operat+"-"+num3+"=";
	    result[i]=result[i]-num3;
	}
	else if(character2==3)//乘号
	{
		if(character1==2)//若第一个运算符是减号，则再随机出来一个第二个数与第三个随机的数小于第二个数   num1>=num2*num3  num3<=num1/num2
		{
			if(num2>9)
			{
				num2=(int)random.nextInt(9)%(9);
			}
			if(num1==0)
				num3=0;
			else 
			{
				if(num2==0) num2=num2+1;
				int num4=num1/num2;
				num3=(int)random.nextInt(num4)%(num4);
			}
			if(num3>9)
			{
				num3=(int)random.nextInt(9)%(9);
			}
			String number3=String.valueOf(num3);
			operat="第("+(i+1)+")题： "+num1+"-"+num2+"×"+num3+"=";
			result[i]=num1-(num2*num3);
		}
		else //第一个符号是加乘除。若是加，则先计算num2与num3,若是乘除，则计算顺序不变
		{
			if(character1==1){//第一个运算符是加号
				num3=(int)random.nextInt(100)%(100);
				String number3=String.valueOf(num3);
				operat=operat+"×"+num3+"=";
				result[i]=num1+(num2*num3);
			}
			else if(character1==3)//第一个符号是乘号，num1*num2<=9
		    {   
				String number2,number3;
			    do{
			    	num2=(int)random.nextInt(9)%(9);
			    	result[i]=num1*num2;
			    	number2=String.valueOf(num2);
			    }while(result[i]>9);
			    num3=(int)random.nextInt(9)%(9);
				number3=String.valueOf(num3);
				operat="第("+(i+1)+")题： "+num1+"×"+num2+"×"+num3+"=";
				result[i]=num1*num2*num3;
			}
			else {//第一个符号是除号
				num3=(int)random.nextInt(9)%(9);
				String number3=String.valueOf(num3);
				operat=operat+"×"+num3+"=";
				result[i]=result[i]*num3;
			}
		}
	}
	else//第二个运算符是除号
	{
		
		if(num2>81){//第二个符号是除号
			num2=(int)random.nextInt(81)%(81);
		}
		if(character1==1)//第一个运算符是加号，先算num2/num3,再算num+(num2/num3)
		{   
			String number3,number2;
			if(num2>81){//第二个符号是除号
				num2=(int)random.nextInt(81)%(81);
			}
			do{
				
				if(num2>9)
				    num3=random.nextInt(9)%9;
				else 
				{
					if(num2==0)
						num2++;
					num3=(int)random.nextInt(num2)%(num2);
				}
				if(num3==0)
				{
					num3=num3+1;
				} 
				number3=String.valueOf(num3);
				num2=random.nextInt(81)%(81);
				}while(((num2/num3)>=10)||(num2%num3!=0));//商为10以内的数
				operat="第("+(i+1)+")题： "+num1+"+"+num2+"÷"+num3+"=";
			   result[i]=num1+(num2/num3);
		}
		else if(character1==2)//第一个运算式减号，则num1-num2/num3
		{
			String number3=null;
			int k=0;
			if(num2>81){//第二个符号是除号
				num2=(int)random.nextInt(81)%(81);
			}
			do{
				if(num2>9)
				    num3=random.nextInt(9)%9;
				else 
				{
					if(num2==0)
						num2++;
					num3=(int)random.nextInt(num2)%(num2);
				}
				
				if(num3==0)
				{
					num3=num3+1;
				} 
				number3=String.valueOf(num3);
				num2=(int)random.nextInt(81)%(81);
				
			}while(((num2/num3)>=10)||(num2%num3!=0)||((num2/num3)>num1));//商为10以内的数
				operat="第("+(i+1)+")题： "+num1+"-"+num2+"÷"+num3+"=";
			   result[i]=num1-(num2/num3);
		}
		else if(character1==4)//第一个运算符是除号，按顺序计算
		{
			String number3;
			do{
				if(result[i]>9)
				    num3=random.nextInt(9)%9;
				else 
				{
					if(result[i]==0)
						num2++;
					num3=(int)random.nextInt((int)result[i])%((int)result[i]);
				}
				if(num3==0)
				{
					num3=num3+1;
				} 
				number3=String.valueOf(num3);
				
				}while(((result[i]/num3)>=10)||(result[i]%num3!=0));//商为10以内的数
				operat=operat+"÷"+number3+"=";
			result[i]=result[i]/num3;
		}
		else //第一个运算符是乘号，按顺序计算
		{
			do{
				if(result[i]>9)
				    num3=random.nextInt(9)%9;
				else 
				{
					if(result[i]==0)
						result[i]++;
					num3=(int)random.nextInt((int)result[i])%((int)result[i]);
				}
				if(num3==0)
				{
					num3=num3+1;
				} 
				String number3=String.valueOf(num3);
				}while(((result[i]/num3)>=10)||(result[i]%num3!=0));//商为10以内的数 
				operat=operat+"÷"+num3+"=";
			    result[i]=result[i]/num3;
		}
	}
	if(Double.valueOf(result[i])>100) {//如果结果大于100或小数位数大于1则不输出
		i--;
	}
	else {
		question[i]=operat;
		System.out.println(operat+result[i]);
	    %>
	    <span style="font-size:22px"><%=operat %><input  size="10" type="text" name="child_result<%=i %>" ><br> <br>
	    </span><% 
		
	}
}
 
%>
  <input type="submit" style="font-size:20px;background-color:pink" value="提交" name="提交">  

<%


doubleoperation.setOperationNumber(operationNumber);
doubleoperation.setQuestion(question);
doubleoperation.setResult(result); 

%>
<input name="time" class="timer" type="text" />
</form>
</body>
</html>