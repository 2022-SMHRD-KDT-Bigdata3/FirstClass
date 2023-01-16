<%@page import="com.smhrd.model.MemDAO"%>
<%@page import="com.smhrd.model.MemVO"%>
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
                        <input type ="text" name="search" placeholder="검색어를 입력하세요"  onKeypress="javascript:if(event.keyCode==13) {enterkey()}">
                    	<div class="search_icon">
                            <input type="submit" class="searach_submit" value="검색">
                        </div>
                    </form>
				</div>
				<%
				if (info != null) {%>
				<ul class="nav">
					<li><%=info.getMem_grade()%> 등급</li>
					<li><%=info.getMem_name()%>님</li>
					<li><a href="MemberUpdate.jsp">마이페이지</a></li>
					<li><a href="LogoutService">로그아웃</a></li>
				</ul>
					<%if (info.getMem_email().equals("admin")) {%>
					<ul class ="nav2">
                    <li><a href="MemberListService">회원목록</a></li>
                    <li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
                    <li><a href="AuctionConfirm.jsp">경매확인</a></li>
                </ul><% } %>
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
					<li><a href="LogoutService">문의 게시판</a></li>
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
					<li>포인트 조회/충전</li>
				</div>
				<%
				int mem_num = info.getMem_num();
				MemDAO dao = new MemDAO();
				int result = dao.PointCheck(mem_num);
				%>
				<div class="mypoint">
					<li>내 포인트</li>
					<li><%=result%></li>
					<button onclick="request_pay()" style="background-color: rgba(189, 219, 239, 1); border:none;">충전</button>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	var IMP = window.IMP;
	var pin = "imp17474603";
	IMP.init(pin);

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;

	function request_pay() {
		console.log("클릭");
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : "ORD20180131-0000111",
			name : '피베이',
			amount : 10,
			buyer_email : 'Iamport@chai.finance',
			buyer_name : '아임포트 기술지원팀',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp);
			} else {
				console.log(rsp);
			}
		});
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