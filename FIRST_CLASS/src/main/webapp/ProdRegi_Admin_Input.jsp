<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.inp {
	background-color: #D3D3D3;
}
</style>
</head>
<body>
	<%
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	String prod_name = request.getParameter("prod_name");
	int mem_num = Integer.parseInt(request.getParameter("mem_num"));
	String bid_IsUrgency = request.getParameter("bid_IsUrgency");
	int aucTime; // 경매시간
	if (bid_IsUrgency.equals("Y")) {
		aucTime = 1;
	} else {
		aucTime = 2;
	}

	Date sysdate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss");
	String sdfSysdate = sdf.format(sysdate);

	Calendar cal = Calendar.getInstance();
	%>
	<h1>
		<a href="main.jsp">메인페이지로 이동</a>
	</h1>
	<form action="ProdRegi_Admin_InputService" method="post">
		<table border="1">
			<tr>
				<td>상품번호</td>
				<td><%=prod_num%> <input type="hidden" name="prod_num"
					id="prod_num"></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><%=prod_name%></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="cate_num" class=inp>
						<option value="4">디즈니
						<option value="6">귀멸의칼날
						<option value="8">건담
						<option value="10">원피스
						<option value="12">마블
						<option value="2">기타
				</select></td>
			</tr>
			<tr>
				<td>판매자</td>
				<td><%=mem_num%></td>
			</tr>
			<tr>
				<td>급처여부</td>
				<td><%=bid_IsUrgency%></td>
			</tr>

			<tr>
				<td>마감시간</td>
				<td>
					<input readonly type="text" name="prod_time" id="prod_time"
					class="inp">
					<button type="button" onclick="calDate();">계산</button>
				</td>
			</tr>

			<!-- 마감시간은 급처경매여부에 따라서 24시간/48시간 -->
			<!-- 01/09 테스트로 급처경매여부에 따라서 10분/20분 -->
			<!-- 01/11 입찰 테스트 : 1시간/2시간 -->
			<tr>
				<td>전문가의견</td>
				<td><input type="text" name="prod_opinion" class="inp"></td>
			</tr>
			<!-- 전문가가 정해준 가격의 90%(경매시작가, 현재경매가) 150%(즉시구매가) -->
			<tr>
				<td>전문가감정가</td>
				<td><input type="text" id="evaluation_price" class="inp">
					<button type="button" onclick="calPrice();">계산</button></td>
			</tr>
			<tr>
				<td>경매시작가</td>
				<td><input readonly type="text" name="prod_price"
					id="prod_price"> <input type="hidden" name="prod_cur"
					id="prod_cur"></td>
			</tr>
			<tr>
				<td>즉시구매가</td>
				<td><input readonly type="text" name="prod_imme" id="prod_imme"></td>
			</tr>
			<tr>
				<td>상품사진(경로)</td>
				<td><input type="text" name="prod_img" class="inp"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
		var calPrice = function() {
			var evaluation_price = document.querySelector("#evaluation_price").value;

			var prod_price = parseFloat(evaluation_price * 0.9);
			var prod_imme = parseFloat(evaluation_price * 1.5);

			document.querySelector("#prod_price").value = Math.ceil(prod_price);
			document.querySelector("#prod_cur").value = Math.ceil(prod_price);
			document.querySelector("#prod_imme").value = Math.ceil(prod_imme);
			document.querySelector("#prod_num").value = <%=prod_num%>
		;
		};

		var calDate = function() {
			/* aucTime이 어디 있는지 확인할 것 */
			var date =	<%=cal.get(Calendar.YEAR)%>+ "/"
						+<%=(cal.get(Calendar.MONTH) + 1)%>+ "/"
						+<%=cal.get(Calendar.DATE)%>+ "/"
						+<%=cal.get(Calendar.HOUR_OF_DAY)  %>+ ":"
						+<%=cal.get(Calendar.MINUTE) + aucTime%>+ ":"
						+<%=cal.get(Calendar.SECOND)%>;
			document.querySelector("#prod_time").value = date;
		};
	</script>
</body>
</html>