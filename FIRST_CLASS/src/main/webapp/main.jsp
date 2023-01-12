<%@page import="com.smhrd.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First_Class_Web_Page</title>
</head>
<body>
	<%
	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage.substring(13);
	session.setAttribute("prevPage", prevPage);
	
	// 회원 정보 세션에서 가져오기
	MemVO info = (MemVO)session.getAttribute("info");
	%>
	<h1> <a href="main.jsp">메인페이지로 이동</a></h1>
	<!-- 로그인 전 -> 로그인 탭 출력 -->
	<!-- 로그인 후 -> 로그아웃/개인정보수정 탭 출력 -->
	<div>
		<%if (info != null) {%>
		<ul>
			<li>
				<h5>
					등급:<%=info.getMem_grade()%>
					이메일:<%=info.getMem_email()%>
				</h5>
			</li>
			<li><a href="MemberUpdate.jsp">마이페이지</a></li>
			<li><a href="LogoutService">로그아웃</a></li>
		</ul>
			
		<%} else {%>
		<ul>
			<li> <h5>로그인해주세요</h5> </li>
			<li><a href="Login.jsp">로그인</a></li>
			<li><a href="Join.jsp">회원가입</a></li>
		</ul>
		<%}%>
	</div>
	<div>
		<%if (info != null) {%>
			<%if (info.getMem_email().equals("admin")) {%>
				<a href="MemberListService">회원목록</a>
				<a href="ProdRegi_Admin.jsp">판매등록</a>
			<%} else {%>
				<a href="ProdRegi_Member.jsp">판매등록</a>
			<%}
		}%>
		<a href="#">인기 경매</a>
		<a href="UrgencyProd.jsp">급처 경매</a>
		<a href="PostMain.jsp">문의게시판</a>
	</div>
	
	<div class="container">
		<a href="AllProd.jsp">전체 상품</a>
		<a href="CateProd.jsp?cate_num=12">MARVEL</a>
		<a href="CateProd.jsp?cate_num=4">디즈니</a> 
		<a href="CateProd.jsp?cate_num=6">귀멸의 칼날</a>
		<a href="CateProd.jsp?cate_num=8">건담</a>
		<a href="CateProd.jsp?cate_num=10">원피스</a>
		<a href="CateProd.jsp?cate_num=2">기타</a>
	</div>
</body>
</html>