<%@page import="com.smhrd.model.MemVO"%>
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
<style>
textarea {
    width: 25%;
    height: 6.25em;
    border: none;
    resize: none;
  }
</style>
</head>
<body>
	<div class="container">
		<h2>게시글 쓰기</h2>
		<div class="panel panel-default">
			<div class="panel-heading">퍼스트 게시판</div>

			<div class="panel-body">

				<form class="form-horizontal" action="PostInsertService"
					method="post">
					<div class="form-group">
						<label class="control-label col-sm-2">제목 :</label>
						<div class="col-sm-10">
							<input type="text" name="post_title" class="form-control"
								id="post_title" placeholder="제목을 입력하세요.">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">작성자:</label>
						<div class="col-sm-10">
							<!-- <input type="text" name="mem_num" class="form-control" id="mem_num" placeholder="작성자를 입력 안 받고 알아서 띄워야 할 거 같은데?"> -->
							<%
							MemVO info = (MemVO) session.getAttribute("info");
							int mem_num = info.getMem_num();
							%>
							<%=mem_num%>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">내용 :</label>
						<div class="col-sm-10">
							<textarea name="post_con" id="post_con" class="form-control"
								rows="10" cols="" ></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-success">작성</button>
							<button type="reset" class="btn btn-error">취소</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>