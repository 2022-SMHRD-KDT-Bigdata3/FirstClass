<%@page import="com.smhrd.model.PostVO"%>
<%@page import="com.smhrd.model.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		// request영역안에 있는 게시글 정보 불러오기
		ArrayList<PostVO> list = (ArrayList<PostVO>)request.getAttribute("list");
	%>
	<div class="container">
	  <h2>게시글 보기</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">퍼스트 게시판</div>
	   
	    <div class="panel-body">

				  <div class="form-group">
				    <label class="control-label col-sm-2">제목 :</label>
				    <div class="col-sm-10">
				    	<!--  value에다가 출력 -->
				      <input type="text" class="form-control" readonly="readonly" value="<%= list.get(0).getPost_title() %>">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2">작성자:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" readonly="readonly" value="<%=list.get(0).getMem_num() %>">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2">내용 :</label>
				    <div class="col-sm-10">
						<input type="text" class="form-control" readonly="readonly" value="<%=list.get(0).getPost_con() %>">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <a href="PostMain.jsp">
				      	<button type="button" class="btn btn-success">뒤로가기</button>
				      </a>
				    </div>
				  </div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>