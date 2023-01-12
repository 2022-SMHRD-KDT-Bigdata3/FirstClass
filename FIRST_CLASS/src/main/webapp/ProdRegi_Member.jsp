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
	<h1>멤버 상품등록 페이지</h1>
	<form action="ProdRegi_MemberService" method="post">
		<table border="1">
			<tr>
				<td><span>상품이름</span></td>
				<td><input type="text" name="prodName"></td>
			</tr>
			<tr>
				<td><span>급처경매</span></td>
				<td>
					<input type="radio" name="isUrg" value="Y">예 
					<input type="radio" name="isUrg" value="N">아니오
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="reset" value="초기화">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>