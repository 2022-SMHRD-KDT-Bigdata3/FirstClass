<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> <a href="main.jsp">메인페이지로 이동</a></h1>
	<ul>
		<form action="LoginService" method="post">
			<li><input name="mem_email" type="text" placeholder="Email을 입력하세요"></li>
			<li><input name="mem_pw" type="password" placeholder="PW를 입력하세요"></li>
			<li><input type="submit" value="LogIn"></li>
		</form>
	</ul>
</body>
</html>