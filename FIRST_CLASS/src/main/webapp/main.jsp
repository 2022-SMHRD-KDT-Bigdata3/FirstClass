<%@page import="com.smhrd.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
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
                        <input type ="text" name="search" placeholder="검색어를 입력하세요"  onKeypress="javascript:if(event.keyCode==13) {enterkey()}">
                    	<div class="search_icon">
                            <input type="submit" class="searach_submit" value="검색">
                        </div>
                    </form>
				</div>
				<%
				if (info != null) {%>
				<ul class="nav">
					<li><%=info.getMem_grade()%>등급</li>
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
		<div class="intro_text">
			<div class="mavel_text">
				<li>
					<h4>한정판 마블 피규어</h4>
				</li>
				<li>
					<h4>퍼스트에서</h4>
				</li>
				<li><a href="AllProd.jsp">전체상품보기</a></li>
			</div>
			<div class="mavel_image">
				<li><img src="image/ironman PNG.png" class="ironman"
					width="280px;" height="280px"></li>
				<li><img src="image/thor PNG.png" class="thor" width="280px;"
					height="280px"></li>
				<li><img src="image/deadpool PNG.png" class="deadpool"
					width="280px;" height="280px"></li>
			</div>
		</div>
		<div class="main_text0">
			<div class="icons">
				<div class="all_prod">
					<div class="box">
						<li><a href="AllProd.jsp"><img style = "width : 85.5%;"
								src="image/allProd_logo.png" class="logo"></a></li>						
					</div>
					<div class="box">
						<li><a href="CateProd.jsp?cate_num=12"><img
								src="image/marvel_logo.png" class="logo"></a></li>
					</div>
					<div class="box">
						<li><a href="CateProd.jsp?cate_num=4"><img
								src="image/disney_logo.png" class="logo"></a></li>
					</div>
					<div class="box">
						<li><a href="CateProd.jsp?cate_num=6"><img
								src="image/demon_slayer_logo.png" class="logo"></a></li>
					</div>
					<div class="box">
						<li><a href="CateProd.jsp?cate_num=8"><img
								src="image/bandai_logo.png" class="logo"></a></li>
					</div>
					<div class="box">
						<li><a href="CateProd.jsp?cate_num=10"><img
								src="image/onepice_logo.png" class="logo"></a></li>
					</div>
				</div>
			</div>
			<div class="prod_text">
				<a href="AllProd.jsp">
					<li>전체 상품</li>
				</a> <a href="CateProd.jsp?cate_num=12">
					<li>MARVEL</li>
				</a> <a href="CateProd.jsp?cate_num=4">
					<li>디즈니</li>
				</a> <a href="CateProd.jsp?cate_num=6">
					<li>귀멸의칼날</li>
				</a> <a href="CateProd.jsp?cate_num=8">
					<li>건담</li>
				</a> <a href="CateProd.jsp?cate_num=10">
					<li>원피스</li>
				</a>
			</div>
		</div>
		<div class="sub_text0" style ="width: 100%; height:100px;">
			
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