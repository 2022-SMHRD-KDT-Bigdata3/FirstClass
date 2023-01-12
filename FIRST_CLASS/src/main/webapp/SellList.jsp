<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.MemVO"%>
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

	<div
		style="float: top; width: 100%; hight: 100px; background-color: #BDDBEF">
		<h1><a href = "main.jsp">퍼스트</a></h1>
	</div>
	<div style="float: left; width: 20%; heigth: 80%; text-align: left">
		<a href="MemberUpdate.jsp">개인정보수정</a><br> 
		<a href="BuyList.jsp">구매내역조회</a><br>
		<a href="SellListService">판매내역조회</a><br> 
		<a href="PointCheckService">포인트조회/충전</a><br>
	</div>
	<div style="width: 80%; hight: 20px; float: left; text-align: center">
		<h4>판매내역 조회</h4>
	</div>
	<div style="width: 80%; hight: 560px; float: left; text-align: center">
		<h5>판매중인 물품</h5>
		<table border ="1" style =" width :80%">
			<tbody>
				<tr>
				<td>경매번호</td>
				<td>상품명</td>
				<td>시작 입찰가</td>
				<td>현재 입찰가</td>
				<td>즉시 구매가</td>
				</tr>
				
				<%
				MemVO info = (MemVO) session.getAttribute("info");
				int mem_num = info.getMem_num();
				ProdDAO dao = new ProdDAO();
				ArrayList<ProdVO> list = dao.Sell_List(mem_num);
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getProd_num()%></td>
					<td><%=list.get(i).getProd_name()%></td>
					<td><%=list.get(i).getProd_price()%></td>
					<td><%=list.get(i).getProd_cur()%></td>
					<td><%=list.get(i).getProd_imme()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		
		<h5>판매완료된 물품</h5>
		<table border ="1" style =" width :80%">
			<tbody>
				<tr>
				<td>경매번호</td>
				<td>상품명</td>
				<td>시작 입찰가</td>
				<td>낙찰 금액</td>
				</tr>
				<%
				ArrayList<ProdVO> list2 = dao.Sell_List2(mem_num);
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getProd_num()%></td>
					<td><%=list.get(i).getProd_name()%></td>
					<td><%=list.get(i).getProd_price()%></td>
					<td><%=list.get(i).getProd_cur()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>



</body>
</html>