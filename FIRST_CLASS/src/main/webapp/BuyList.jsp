<%@page import="com.smhrd.model.JoinVO"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.BidVO"%>
<%@page import="com.smhrd.model.BidDAO"%>
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
	<div style="float: left; width: 20%; heigth: 300px; text-align: left">
		<a href="MemberUpdate.jsp">개인정보수정</a><br>
		<a href="BuyList.jsp">구매내역조회</a><br>
		<a href="SellList.jsp">판매내역조회</a><br> 
		<a href="PointCheckService">포인트조회/충전</a><br>
	</div>
	<div style="width: 80%; hight: 20px; float: left; text-align: center">
		<h4>구매내역조회</h4>
	</div>
	<div style="width: 80%; hight: 280px; float: left; text-align: center">
		<h5>진행중인 경매</h5>
		<table border ="1" style =" width :80%">
			<tbody>
				<tr>
					<td>상품번호</td>
					<td>상품명</td>
					<td>내 입찰가</td>
					<td>마감시간</td>
					<td>이동</td>
				</tr>
				<%
				MemVO info = (MemVO)session.getAttribute("info");
				int mem_num = info.getMem_num();
				
				JoinDAO jdao = new JoinDAO();
				
				ArrayList<JoinVO> jlist = jdao.buyingList(mem_num);				
				
				for (int i = 0; i < jlist.size(); i++) {
				%>
				<tr>
					<td style = "width:10%"><%=jlist.get(i).getProd_num()%></td>
					<td style = "width:40%"><%=jlist.get(i).getProd_name()%></td>
					<td style = "width:20%"><%=jlist.get(i).getBid_price()%></td>
					<td style = "width:30%"><a href="ProdSale.jsp?prod_num=<%=jlist.get(i).getProd_num()%>">이동</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		
<%-- 		<h3>완료된 경매</h3>
		<table border ="1" style =" width :80%">
			<tbody>
			<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>낙찰가</td>
			<td>경매종료날짜</td>
			<td>이동</td>
			<%
			ArrayList<JoinVO> jlist2 = jdao.boughtList(mem_num);
			
			for (int i = 0; i < jlist2.size(); i++) {
			%>	
			<tr>
				<td style = "width:10%"><%=blist.get(i).getBid_num()%></td>
				<td style = "width:30%"><%=plist.get(i).getProd_name()%></td>
				<td style = "width:20%"><%=plist.get(i).getProd_price()%></td>
				<td style = "width:20%"><%=plist.get(i).getProd_cur()%></td>
				<td style = "width:20%"><%=prod_time%></td>
			</tr>
			<%}%>
			</tbody>
		</table> --%>
	</div>

	

</body>
</html>