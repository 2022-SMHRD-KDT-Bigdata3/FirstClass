<%@page import="com.smhrd.model.MemVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="AllProdStyle.css">
<title>0113</title>
</head>
<body>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
	ArrayList<ProdVO> list = new ArrayList<ProdVO>();
	ProdDAO dao = new ProdDAO();
	list = dao.selectAllProd();

	Date now = new Date();
	%>
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
				if (info != null) {%>
			<ul class="nav">
				<li><%=info.getMem_grade()%> 등급</li>
				<li><%=info.getMem_name()%>님</li>
				<li><a href="MemberUpdate.jsp">마이페이지</a></li>
				<li><a href="LogoutService">로그아웃</a></li>
			</ul>
			<%if (info.getMem_email().equals("admin")) {%>
			<ul class="nav2">
				<li><a href="MemberListService">회원목록</a></li>
				<li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
				<li><a href="AuctionConfirm.jsp">경매확인</a></li>
			</ul>
			<% } %>
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
	<div class="grid-9">
		<%
		for (int i = 0; i < list.size(); i++) {
			Date date = list.get(i).getProd_time();
			SimpleDateFormat SDF = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
			String prod_time = SDF.format(date);
                 
			long diff = date.getTime() - now.getTime();
			
			if (diff > 0) {%>
		<div class="All_Prod">
			<div class="big" align="center">
				<div class="top">
					<a href="ProdSale.jsp?prod_num=<%=list.get(i).getProd_num()%>"><img
						class="prod-img" src="<%=list.get(i).getProd_img()%>"></a>
				</div>

				<div class="name font-small">
					<%=list.get(i).getProd_name()%>
				</div>

				<div class="bidurg font-small">
					급처여부:<%=list.get(i).getBid_isUrgency()%>
				</div>

				<div class="price font-small">
					현재가:<%=list.get(i).getProd_cur()%>원 <br> 
					즉시구매가:<%=list.get(i).getProd_imme()%>원
				</div>

				<div class="time font-small" font-color="red">
					<%=prod_time%>
				</div>
			</div>
		</div>
		<%}%>

		<%
		}
		%>
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