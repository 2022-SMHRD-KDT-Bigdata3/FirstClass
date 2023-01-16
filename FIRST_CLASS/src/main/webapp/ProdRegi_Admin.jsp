<%@page import="com.smhrd.model.MemVO"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
	ProdDAO dao = new ProdDAO();
	ArrayList<ProdVO> list = dao.prodList();
	%>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<div class="main">
					<a href="main.jsp">피베이</a>
				</div>
				<div class="search_area">
					<form action="searchResult.jsp">
						<input type="text" placeholder="검색어를 입력하세요"
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
					<li><%=info.getMem_grade()%>
					<li>
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
					<li><a href="ProdRegi_Member.jsp">판매 등록</a></li>
					<li><a href="PostMain.jsp">문의 게시판</a></li>
				</div>
			</div>
		</div>
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>관리자 판매등록</span>
				</div>
				<div class="side_contents">
					<li><a href="MemberListService">회원 목록</a></li>
					<li><a href="AuctionConfirm.jsp">경매 확인</a></li>
				</div>
			</div>
			<div class="main_menu">
				<div class="main_name">
					<li>관리자 판매등록</li>
				</div>
				<div class="selling_list">
					<div class="selling_list_name">
						<span>미등록 상품 목록</span>
					</div>
					<div class="selling_area">
						<table class="selling_table">
							<thead>
								<tr>
									<th>상품 번호</th>
									<th>상품명</th>
									<th>등록 회원</th>
									<th>급처 경매여부</th>
									<th>등록</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td align="center"><%=list.get(i).getProd_num()%></td>
									<td align="center"><%=list.get(i).getProd_name()%></td>
									<td align="center"><%=list.get(i).getMem_num()%></td>
									<td align="center"><%=list.get(i).getBid_isUrgency()%></td>
									<td><a
										href="ProdRegi_Admin_Input.jsp?prod_num=<%=list.get(i).getProd_num()%>&prod_name=<%=list.get(i).getProd_name()%>&mem_num=<%=list.get(i).getMem_num()%>&bid_IsUrgency=<%=list.get(i).getBid_isUrgency()%>">등록</a>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {

			// 엔터키가 눌렸을 때 실행하는 반응
			$("#form").submit();
		}
	}
</script>
</html>