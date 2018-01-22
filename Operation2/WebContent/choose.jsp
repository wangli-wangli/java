<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css"/>
<title>小学生四则运算</title>
<style type="text/css">
  body{
      background-image:url(image/choose.jpg);background-size:cover;
  }
  </style>
</head>
<body>
<div style="text-align:right;">
<span style="color:red;font-size:25px">
<a href="Welcome.jsp">退出</a><br><br></span>
</div>
	<form action="Connect.jsp" class="option">
		<center><h2>四则运算</h2></center>
		<p>选择题目类型：
			<select name="elementNum">
				<option>2</option>
				<option>3</option>
			</select>元运算<br /></p>
		选择题目数量：
				<input name="count" value="10" type="radio" />10
				<input name="count" value="20" type="radio" />20
				<input name="count" value="30" type="radio" />30
				<input name="count" value="40" type="radio" />40
				<input name="count" value="50" type="radio" />50
			<br /><br />
		<button class="submit" style="margin-top:50px">开始答题！</button>
	</form>
</body>
</html>