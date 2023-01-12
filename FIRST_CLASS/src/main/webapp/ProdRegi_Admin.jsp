<%@page import="com.smhrd.model.ProdDAO"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="java.util.ArrayList"%>
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
	ProdDAO dao = new ProdDAO();
	ArrayList<ProdVO> list = dao.prodList();
	%>
	<h1> <a href="main.jsp">메인페이지로 이동</a></h1>
	<h1>관리자 판매등록 페이지</h1>
	<div>
		<h2>미등록 상품 목록</h2>
		<table border="1">
			<tbody>
				<tr>					
					<td align="center">상품번호</td>
					<td align="center">이름</td>
					<td align="center">등록회원</td>
					<td align="center">급처경매여부</td>
					<td align="center">등록</td>
				</tr>
			</tbody>
			<tbody>
				<%for (int i = 0; i < list.size(); i++) {%>
				<tr>
					<td align="center"><%=list.get(i).getProd_num()%></td>
					<td align="center"><%=list.get(i).getProd_name()%></td>
					<td align="center"><%=list.get(i).getMem_num()%></td>
					<td align="center"><%=list.get(i).getBid_isUrgency()%></td>
					<td>
						<a href="ProdRegi_Admin_Input.jsp?prod_num=<%=list.get(i).getProd_num()%>&prod_name=<%=list.get(i).getProd_name()%>&mem_num=<%=list.get(i).getMem_num()%>&bid_IsUrgency=<%=list.get(i).getBid_isUrgency()%>">등록</a>
					</td>
				</tr>
				<%}%>
			</tbody>
		</table>
	</div>
</body>
</html>