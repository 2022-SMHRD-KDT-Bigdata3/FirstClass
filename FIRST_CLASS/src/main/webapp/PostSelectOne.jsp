<%@page import="com.smhrd.model.MemVO"%>
<%@page import="com.smhrd.model.PostVO"%>
<%@page import="com.smhrd.model.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<html lang="en">
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
	// request영역안에 있는 게시글 정보 불러오기
	ArrayList<PostVO> list = (ArrayList<PostVO>) request.getAttribute("list");
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
					<li><a href="PostMain.jsp">문의 게시판</a></li>
				</div>
			</div>
		</div>
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>문의 게시판</span>
				</div>
				<div class="side_contents"></div>
			</div>
			<div class="main_menu">
				<div class="main_name">
					<li>게시글 보기</li>
				</div>
				<div class="main_content">
					<form class="postSO" action="PostInsertService" method="post">

						<div class="postSO_element">
							<div class="postSO_con">
								<!-- 제목 : -->
								<!--  value에다가 출력 -->
								<input class="postSO_input" type="text" readonly="readonly"
									value="<%=list.get(0).getPost_title()%>"><br>
							</div>
							<div class="postSO_con">
								<!-- 작성자 :  -->
								<input class="postSO_input" type="text" readonly="readonly"
									value="<%=list.get(0).getMem_num()%>"><br>
							</div>
							<div class="postSO_con">
								<!-- 내용 :  -->
								<input id="postSO_con_con1" type="text" readonly="readonly"
									value="<%=list.get(0).getPost_con()%>"><br>
							</div>
							<div>
								<a href="PostMain.jsp"><button type="button"
										class="postSO_btn">뒤로가기</button></a>
							</div>
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