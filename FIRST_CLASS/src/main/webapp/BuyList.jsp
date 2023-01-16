<%@page import="com.smhrd.model.JoinVO"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.BidVO"%>
<%@page import="com.smhrd.model.BidDAO"%>
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
					<li><a href="ProdRegi_Member.jsp">판매 등록</a></li>
					<li><a href="PostMain.jsp">문의 게시판</a></li>
				</div>
			</div>
		</div>
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>마이페이지</span>
				</div>
				<div class="side_contents">
					<li><a href="MemberUpdate.jsp">회원 정보수정</a></li>
					<li><a href="BuyList.jsp">구매 내역조회</a></li>
					<li><a href="SellList.jsp">판매 내역조회</a></li>
					<li><a href="PointCheckService">포인트 충전/조회</a></li>
				</div>
			</div>
			<div class="main_menu">
				<div class="main_name">
					<li>구매 내역 조회</li>
				</div>
				<div style="overflow:scroll;" class="buying_list">
					<div class="buying_list_name">
						<span>진행중인 경매</span>
					</div>
					<div class="buying_area">
						<table class="buying_table" id="userListTable">
							<thead>
								<tr>
									<th>경매 번호</th>
									<th>상품명</th>
									<th>내 입찰가</th>
									<th>경매 페이지</th>
								</tr>
							</thead>
								<%
								int mem_num = info.getMem_num();

								JoinDAO jdao = new JoinDAO();

								ArrayList<JoinVO> jlist = jdao.buyingList(mem_num);

								for (int i = 0; i < jlist.size(); i++) {
								%>
							<tbody>
								<tr>
									<td style="width: 10%"><%=jlist.get(i).getProd_num()%></td>
									<td style="width: 40%"><%=jlist.get(i).getProd_name()%></td>
									<td style="width: 20%"><%=jlist.get(i).getBid_price()%></td>
									<td style="width: 30%"><a
										href="ProdSale.jsp?prod_num=<%=jlist.get(i).getProd_num()%>">이동</a></td>
								<%
								}
								%>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div style="overflow:scroll;" class="buyed_list">
					<div class="buying_list_name">
						<span>완료된 경매</span>
					</div>
					<div class="buyed_area">
						<table class="buyed_table" id="userListTable">
							<thead>
								<tr>
									<th>경매 번호</th>
									<th>상품명</th>
									<th>내 입찰가</th>
									<th>경매 낙찰가</th>
									<th>이동</th>
								</tr>
							</thead>
							<tbody>
								<%
								ArrayList<JoinVO> jlist2 = jdao.boughtList(mem_num);

								for (int i = 0; i < jlist2.size(); i++) {
									int prod_num = jlist2.get(i).getProd_num();

									ProdDAO pdao = new ProdDAO();
									ProdVO pvo = pdao.selectOneProd(prod_num);

									int prod_cur = pvo.getProd_cur();
									String isSucBid = "";
									if (prod_cur > jlist2.get(i).getBid_price()) {
										isSucBid = "패찰";
									} else {
										isSucBid = "낙찰";
									}
								%>
								<tr>
									<td style="width: 10%"><%=jlist2.get(i).getProd_num()%></td>
									<td style="width: 30%"><%=jlist2.get(i).getProd_name()%></td>
									<td style="width: 20%"><%=jlist2.get(i).getBid_price()%></td>
									<td style="width: 20%"><%=isSucBid%></td>
									<td style="width: 10%"><a
										href="ProdSale.jsp?prod_num=<%=jlist2.get(i).getProd_num()%>">이동</a></td>
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