<%@page import="com.smhrd.model.MemVO"%>
<%@page import="com.smhrd.model.Join3VO"%>
<%@page import="com.smhrd.model.Join3DAO"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%
	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage.substring(13);
	session.setAttribute("prevPage", prevPage);

	// 회원 정보 세션에서 가져오기
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
					<li><a href="Popprod.jsp">인기 경매</a></li>
					<li><a href="UrgencyProd.jsp">급처 경매</a></li>
					<li><a href="ProdRegi_Member.jsp">판매 등록</a></li>
					<li><a href="PostMain.jsp">문의 게시판</a></li>
				</div>
			</div>
		</div>
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>경매확인</span>
				</div>
				<div class="side_contents">
					<li><a href="MemberListService">회원 목록</a></li>
					<li><a href="ProdRegi_Admin.jsp">판매 등록</a></li>

				</div>
			</div>
			<div class="prod_list">
				<div class="list_name">
					<li id="auc_list_name">경매 결과 확인 페이지</li>
				</div>
				<div class="list_contents">
					<table class="auc_list_table">
						<thead>
							<tr id="auc_list_suc">낙찰 상품 목록
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="auc_list_img">사진</td>
								<td>상품번호</td>
								<td>상품명</td>
								<td>판매자</td>
								<td>낙찰가</td>
								<td>확인</td>
							</tr>
						</tbody>
						<tbody id="sucBidList">

						</tbody>
					</table>
					<table class="auc_list_table">
						<thead>
							<tr id="auc_list_fail">유찰 상품 목록
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>사진</td>
								<td>상품번호</td>
								<td>상품명</td>
								<td>판매자</td>
							</tr>
						</tbody>
						<tbody id="failBidList">
						</tbody>
					</table>
				</div>
			</div>

			<script type="text/javascript">
				// 낙찰 상품 실시간 업데이트
				setInterval(updateSucBid, 1000);
				function updateSucBid() {
					$.ajax({
						url : "updateSucBidService",
						method : "post",
						dataType : "JSON",
						success : resultSucBid,
						error : errFun
					});
				}

				function resultSucBid(data) {
					var html = "";
					for (var i = 0; i < data.length; i++) {
						html += "<tr>";
						html += "<td><img src='";
                        html += data[i].prod_img;
                        html += "' width='200px' height='200px'></td>";
						html += "<td>" + data[i].prod_num + "</td>";
						html += "<td>" + data[i].prod_name + "</td>";
						html += "<td>" + data[i].seller + "</td>";
						html += "<td>" + data[i].bid_price + "</td>";
						html += "<td><a href='setSucBidderService?";
						html += "prod_num=" + data[i].prod_num;
						html += "&bidder_id=" + data[i].bidder;
						html += "&bid_price=" + data[i].bid_price;
						html += "&seller_id=" + data[i].seller;
						html += "'>확인</a></td>";
						html += "</tr>";
					}
					$("#sucBidList").html(html);
				}

				// 유찰 상품 실시간 업데이트
				setInterval(updateFailBid, 1000);
				function updateFailBid() {
					$.ajax({
						url : "updateFailBidService",
						method : "post",
						dataType : "JSON",
						success : resultFailBid,
						error : errFun
					});
				}

				function resultFailBid(data) {
					var html = "";
					for (var i = 0; i < data.length; i++) {
						html += "<tr>";
						html += "<td><img src='";
                        html += data[i].prod_img;
                        html += "' width='200px' height='200px'></td>";
						html += "<td>" + data[i].prod_num + "</td>";
						html += "<td>" + data[i].prod_name + "</td>";
						html += "<td>" + data[i].seller + "</td>";
						html += "</tr>";
					}
					$("#failBidList").html(html);
				}

				function errFun(err) {
					console.log(err);
					console.log("통신실패...");
				}
			</script>

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