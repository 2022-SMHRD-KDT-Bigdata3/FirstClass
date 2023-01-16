<%@page import="com.smhrd.model.MemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
	%>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<div class="main">
					<a href="main.jsp">피베이</a>
				</div>
				<div class="search_area">
					<form action="searchResult.jsp">
						<input type="text" name="search" placeholder="검색어를 입력하세요"
							onKeypress="javascript:if(event.keyCode==13) {enterkey()}">
						<div class="search_icon">
							<input type="submit" class="searach_submit" value="검색">
						</div>
					</form>
				</div>
				<%
				if (info != null) {
				%>
				<ul class="nav">
					<li><%=info.getMem_grade()%> 등급</li>
					<li><%=info.getMem_name()%>님</li>
					<li><a href="MemberUpdate.jsp">마이페이지</a></li>
					<li><a href="LogoutService">로그아웃</a></li>
				</ul>
				<%
				if (info.getMem_email().equals("admin")) {
				%>
				<ul class="nav2">
					<li><a href="MemberListService">회원목록</a></li>
					<li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
					<li><a href="AuctionConfirm.jsp">경매확인</a></li>
				</ul>
				<%
				}
				%>
				<%
				} else {
				%>
				<ul class="nav">
					<li><a href="Login.jsp">로그인</a></li>
					<li><a href="Join.jsp">회원가입</a></li>
				</ul>
				<%
				}
				%>
			</div>
			<div class="header_menu">
				<div class="header_contents">
					<li><a href="PopProd.jsp">인기 경매</a></li>
					<li><a href="UrgencyProd.jsp">급처 경매</a></li>
					<li><a href="ProdSale.jsp">판매 등록</a></li>
					<li><a href="PostMain.jsp">문의 게시판</a></li>
				</div>
			</div>
		</div>
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>회원정보 목록</span>
				</div>
				<div class="side_contents">
					<li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
					<li><a href="AuctionConfirm">경매확인</a></li>
				</div>
			</div>
			<div class="Urgency_list">
				<div class="list_name">
					<li>회원정보 목록</li>
				</div>
				<div class="list_contents">
					<table class="list_table">
						<thead>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody align="center">
							<%
							ArrayList<MemVO> list = (ArrayList<MemVO>) request.getAttribute("list");
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=list.get(i).getMem_email()%></td>
								<td><%=list.get(i).getMem_pw()%></td>
								<td><%=list.get(i).getMem_name()%></td>
								<td><%=list.get(i).getMem_ph()%></td>
								<td><%=list.get(i).getMem_addr()%>
								<td><a
									href="javascript:fnDel(<%=list.get(i).getMem_num()%>)">삭제</a></td>
							<%
							}
							%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function fnDel(mem_num) {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "MemberDeleteService?mem_num=" + mem_num;
		}
		return false;
	}
</script>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {

			// 엔터키가 눌렸을 때 실행하는 반응
			$("#form").submit();
		}
	}
</script>
</html>