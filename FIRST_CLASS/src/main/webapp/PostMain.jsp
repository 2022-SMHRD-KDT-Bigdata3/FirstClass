<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.MemVO"%>
<%@page import="com.smhrd.model.PostDAO"%>
<%@page import="com.smhrd.model.PostVO"%>
<%@page import="java.util.ArrayList"%>
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
	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage.substring(13);

	session.setAttribute("prevPage", prevPage);

	MemVO info = (MemVO) session.getAttribute("info");

	if (info == null) {
		response.sendRedirect("Login.jsp");
	} else {
		// 서버가 가진 게시글 정보를 불러와서 ArrayList에 저장
		PostDAO dao = new PostDAO();
		PostVO pvo = new PostVO();

		int mem_num = info.getMem_num();
		String mem_email = info.getMem_email();

		ArrayList<PostVO> list = dao.postList();

		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");
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
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>문의 게시판</span>
				</div>
				<div class="side_contents"></div>
			</div>
			<div class="main_menu">
				<form>
					<div class="main_name">
						<li>게시판</li>
					</div>
					<div class="post_main_content">
						<table class="post_table" border="1">
							<thead>
								<tr>
									<td class="post_num">번호</td>
									<td class="post_title">제목</td>
									<td class="mem_num">작성자</td>
									<td class="post_date">날짜</td>
									<td class="delete">삭제</td>
								</tr>
							</thead>
							<tbody>
								<%
								// 서버가 가진 게시글 정보 출력
								for (int i = 0; i < list.size(); i++) {
									PostVO vo = (PostVO) list.get(i);
								%>
								<tr>
									<td><%=i + 1%></td>
									<td>
										<!-- 클릭한 한개의 게시글을 보러 클릭하면 PostSelectOneService
	    				 Servlet로 해당 게시글 번호를 넘겨 해당 게시글 정보를 VO로 Servlet에서 받아온다 --> <!-- 관리자는 전체 게시글 보기 가능 멤버는 자기 게시글만 보임 -->
										<%
										if (info.getMem_email().equals("admin")) {
										%> <a
										href="PostSelectOneService?post_num=<%=list.get(i).getPost_num()%>">
											<%=list.get(i).getPost_title()%></a> <%
										 } else {
										 %> <%
										 if (info.getMem_num() == vo.getMem_num()) {
										 %> <a
										href="PostSelectOneService?post_num=<%=list.get(i).getPost_num()%>&mem_num=<%=list.get(i).getMem_num()%>">
											<%=list.get(i).getPost_title()%></a> <%
										 } else {
										 %> <%=list.get(i).getPost_title().charAt(0) + "*****"%> <%
										 }
										 %> <%
										 }
										 %>
									</td>

									<td><%=list.get(i).getMem_num()%></td>
									<td><%=df.format(list.get(i).getPost_date())%></td>


									<!-- 본인 게시글만 삭제가 가능하다. 본인 게시글이 아니면 삭제 버튼이 뜨지 않는다. 관리자는 삭제 가능-->
									<%
									if (info.getMem_num() == vo.getMem_num() || info.getMem_email().equals("admin")) {
									%>
									<td><a
										href="PostDeleteService?post_num=<%=list.get(i).getPost_num()%>&mem_num=<%=list.get(i).getMem_num()%>">삭제</a></td>
									<%
									} else {
									%>
									<td></td>
								</tr>
								<%
								}
								}
								}
								%>
							</tbody>
						</table>

					</div>

						<div style="margin-top:20px">
							<button class="post_btn">
								<a href="PostInsert.jsp">글쓰기</a>
							</button>
						</div>
					</form>
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