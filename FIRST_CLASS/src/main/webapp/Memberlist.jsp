<%@page import="com.smhrd.model.MemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fnDel(mem_num) {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "MemberDeleteService?mem_num=" + mem_num;
		}
		return false;
	}
</script>
</head>
<body>
	<div>
		<h1>
			<a href="main.jsp">메인페이지로 이동</a>
		</h1>
		<h2>회원목록</h2>
		<table border="1">
			<thead align="center">
				<tr>
					<td>번호</td>
					<td>이메일</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>삭제</td>
				</tr>
			</thead>

			<tbody align="center">
				<%
				ArrayList<MemVO> list = (ArrayList<MemVO>) request.getAttribute("list");
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=i + 1%></td>
					<td><%=list.get(i).getMem_email()%></td>
					<td><%=list.get(i).getMem_pw()%></td>
					<td><%=list.get(i).getMem_name()%></td>
					<td><%=list.get(i).getMem_ph()%></td>
					<td><%=list.get(i).getMem_addr()%>
					<td><a href="javascript:fnDel(<%=list.get(i).getMem_num()%>)">삭제</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>