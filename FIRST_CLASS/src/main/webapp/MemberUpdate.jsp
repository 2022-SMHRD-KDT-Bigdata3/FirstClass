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
					<li><%=info.getMem_grade()%>
					<li>
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
				<form action="MemUpdateService" method="post">
					<div class="main_name">
						<li>회원정보수정</li>
					</div>
					<div class="main_content">
						<div class="contents_menu">
							<li>비밀번호</li>
							<li>이름</li>
							<li class="hidden"></li>
							<li>핸드폰번호</li>
							<li>주소</li>
						</div>
						<div class="contents_menu_input">
							<input name="mem_pw" type="password" class="password" placeholder="비밀번호를 입력하세요">
							<input name="mem_name" type="text" class="passwordok"
								placeholder="이름을 입력하세요"> 
							<input name="mem_ph" type="text" class="name" placeholder="전화번호를 입력하세요"><br>
							<textarea name="mem_addr"class="addr" placeholder="주소 입력하세요"></textarea>
						</div>
					</div>
					<div class="contents_menu_submit">
						<input type="submit" value="회원 수정">
					</div>
				</form>
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