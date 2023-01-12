<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	int cate_num = Integer.parseInt(request.getParameter("cate_num"));
	ArrayList<ProdVO> list = new ArrayList<>();
	ProdDAO dao = new ProdDAO();
	list = dao.selectCate(cate_num);
	
	Date now = new Date();
	%>
	<h1> <a href="main.jsp">메인페이지로 이동</a></h1>
	<table border="1">
		<tr>
			<td>상품사진</td>
			<td>상품명</td>
			<td>급처경매여부</td>
			<td>마감시간</td>
			<td>현재입찰가</td>
			<td>즉시구매가</td>
			<td>이동</td>
		</tr>
		<%for (int i = 0; i < list.size(); i++) {
			Date date = list.get(i).getProd_time();
			SimpleDateFormat SDF = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
			String prod_time = SDF.format(date);
			
			long diff = date.getTime()-now.getTime();
			if(diff>0){
		%>
			<tr>
				<td style="inline-height: 0">
				<img src="<%=list.get(i).getProd_img()%>" 
					width="200px" height="200px" 
					style="margin: 0; padding: 0">
				</td>
				<td><%=list.get(i).getProd_name()%></td>
				<td><%=list.get(i).getBid_isUrgency()%></td>
				<td><%=prod_time%></td>
				<td><%=list.get(i).getProd_cur()%></td>
				<td><%=list.get(i).getProd_imme()%></td>
				<td><a href="ProdSale.jsp?prod_num=<%=list.get(i).getProd_num()%>">이동</a></td>			
			</tr>
			<%}%>	
		<%}%>
	</table>
</body>
</html>