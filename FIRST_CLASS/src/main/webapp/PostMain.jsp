<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.MemVO"%>
<%@page import="com.smhrd.model.PostDAO"%>
<%@page import="com.smhrd.model.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostMain</title>
</head>
<body>
	<%
	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage.substring(13);

	session.setAttribute("prevPage", prevPage);

	MemVO info = (MemVO)session.getAttribute("info");
	
	
	if(info == null) {
		response.sendRedirect("Login.jsp");
	}else{
		// 서버가 가진 게시글 정보를 불러와서 ArrayList에 저장
		PostDAO dao = new PostDAO();
		PostVO pvo = new PostVO();
	
		int mem_num = info.getMem_num();
		String mem_email = info.getMem_email();

		ArrayList<PostVO> list = dao.postList();

		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");%>
	<div class="container">
		<h2><a href="main.jsp">퍼스트 게시판</a></h2>
		<div class="panel panel-default">
			<div class="panel-heading">
				<span>게시글 목록</span>
				<span><a href="PostInsert.jsp"><button class="btn btn-sm btn-info">글쓰기</button></a></span>
			</div>

			<div class="panel-body">
				<table class="table table-bordered table_hover" border="1">
					<tr class="success">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>삭제</td>
					</tr>

					<%
					// 서버가 가진 게시글 정보 출력
					for (int i = 0; i < list.size(); i++) {
						PostVO vo = (PostVO) list.get(i);
					%>
					<tr>
						<td><%=i + 1%></td>
						<td>
							<!-- 클릭한 한개의 게시글을 보러 클릭하면 PostSelectOneService
	    				 Servlet로 해당 게시글 번호를 넘겨 해당 게시글 정보를 VO로 Servlet에서 받아온다 --> 
	    				 
	    				 <!-- 관리자는 전체 게시글 보기 가능 멤버는 자기 게시글만 보임 -->
	    				 <%if(info.getMem_email().equals("admin")){%>
	    				 <a	href="PostSelectOneService?post_num=<%=list.get(i).getPost_num()%>">
								<%=list.get(i).getPost_title()%></a>
	    				 <%}else{ %>
	    				 	<%if(info.getMem_num()==vo.getMem_num()){ %>
	    				 <a	href="PostSelectOneService?post_num=<%=list.get(i).getPost_num()%>&mem_num=<%=list.get(i).getMem_num()%>">
								<%=list.get(i).getPost_title()%></a>
	    					<%}else{ %>
	    						<%=list.get(i).getPost_title().charAt(0)+"*****"%>
							<%} %>
						<%} %>
						</td>
						
						<td><%=list.get(i).getMem_num()%></td>
						<td><%=df.format(list.get(i).getPost_date())%></td>
						
						
						<!-- 본인 게시글만 삭제가 가능하다. 본인 게시글이 아니면 삭제 버튼이 뜨지 않는다. 관리자는 삭제 가능-->
	    				<%if(info.getMem_num()==vo.getMem_num() || info.getMem_email().equals("admin")){%>
						 <td><a	href="PostDeleteService?post_num=<%=list.get(i).getPost_num()%>&mem_num=<%=list.get(i).getMem_num()%>">삭제</a></td>
						<%}else{%>
						<td></td>
					</tr>
						<%}
					}%>
				</table>
			</div>
		</div>
	</div>
	<%}%>
</body>
</html>