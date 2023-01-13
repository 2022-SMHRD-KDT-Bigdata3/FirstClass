<%@page import="com.smhrd.model.BidVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@page import="com.smhrd.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
td {
	text-align: center;
}
</style>

</head>
<body>
	<%
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));

	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage + "?prod_num=" + prod_num;
	prevPage = prevPage.substring(13);

	session.setAttribute("prevPage", prevPage);
	session.setAttribute("prod_num", prod_num);

	MemVO info = (MemVO) session.getAttribute("info");

	if (info == null) {
		response.sendRedirect("Login.jsp");
	} else {

	ProdDAO dao = new ProdDAO();
	ProdVO vo = dao.selectOneProd(prod_num);

	Date date = vo.getProd_time();
	Date now = new Date();	
	
	long diffSec = ((date.getTime() - now.getTime()) / 1000) % 60; // 초 차이	
	%>
	<h1>
		<a href="main.jsp">메인페이지로 이동</a>
	</h1>
	<h1>상품 판매 페이지</h1>
	<table border="1" width="400px">
		<tr>
			<td>상품사진</td>
			<td style="inline-height: 0"><img src="<%=vo.getProd_img()%>"
				width="300px" height="300px" style="margin: 0; padding: 0"></td>
		</tr>
		<tr>
			<td>상품이름</td>
			<td><%=vo.getProd_name()%></td>
		</tr>
		<tr>
			<td>마감시간</td>
			<td id="remainTime">남은시간이 표시됩니다.</td>
		</tr>
		<tr>
			<td>전문가의견</td>
			<td><%=vo.getProd_opinion()%></td>
		</tr>
		<tr>
			<td>경매시작가</td>
			<td><%=vo.getProd_price()%></td>
		</tr>
		<tr>
			<td>현재입찰가</td>
			<%-- <td><%=vo.getProd_cur()%></td> --%>
			<td id="prod_cur"><%=vo.getProd_cur()%></td>
		</tr>
		<tr>
			<td>즉시구매가</td>
			<td id="prod_imme"><%=vo.getProd_imme()%></td>
		</tr>
		<tr>
			<td rowspan="4">입찰</td>
			<td><input type="text" id="bid">
				<button type="button" id="bidCheck">입찰가능?</button></td>
		</tr>
		<tr>
			<td><span id="bidCheckResult">입찰 가능시 아래 버튼이 활성화됩니다.</span></td>
		</tr>
		<tr>
			<td>
				<button type="button" id="bidCommit" disabled>입찰확정</button>
			</td>
		</tr>
		<tr>
			<td><span id="bidCommitResult">입찰 성공여부가 출력됩니다.</span></td>
		</tr>

	</table>

	<script type="text/javascript">
		var bid = 0;
		var prod_imme = 0;
		var value = "";
		var nowPo;
		var interval = setInterval(calRemain, 1000);
		
		$(document).ready(function() {
			console.log("문서 로드 완료");
			calRemain();
		});
		
 		setInterval(nowPo, 1000);
		function nowPo(){
			$.ajax({
				url : "nowPoService",
				method : "POST",
				dataType : "JSON",
				success : resultPo,
				error : errFun
			});
		}		
		function resultPo(data){
			nowPo=data[0].mem_po;
		} 

		function calRemain() {
			$.ajax({
				url : "calRemainService",
				method : "POST",
				dataType : "JSON",
				success : resultJson,
				error : errFun
			});
		}

		function resultJson(data) {
			console.log(data);
			value="";
			if (data[0].diffSec == 0 && data[0].diffMin == 0
					&& data[0].diffHour == 0 || data[0].diffSec < 0) {
				value += "경매종료";
				clearInterval(interval);
			} else {
				value += data[0].diffHour;
				value += ":";
				value += data[0].diffMin;
				value += ":";
				value += data[0].diffSec;
			}
			$("#remainTime").text(value);
			console.log(value);
		}

		function errFun(err) {
			console.log(err);
			console.log("통신실패...");
		}

		$('#bidCheck').click(function() {
			bid = Number($('#bid').val());
			prod_imme = Number($("#prod_imme").text());
			console.log(bid + '유효 검사 / 버튼 클릭');
			console.log("현재시간 : "+<%=diffSec%>);

			$.ajax({
				url : "bidCheckService",
				method : "POST",
				data : {"bid" : bid},
				dataType : "JSON",
				success : function(data) {
					console.log("통신성공");
					console.log(data.bidCheck);
					
					if(value!="경매종료"){
						if(bid<=nowPo){
							if (data.bidCheck == "OK") {
								if (prod_imme >= bid) {
									$("#bidCheckResult").text("최고입찰가! " + bid + "(으)로 입찰 가능!");
									$("#bidCheckResult").css("color", "black");
									$("#bidCommit").removeAttr("disabled");
									$("#bidCheck").attr("disabled", true);
									$("#bid").attr("readonly",true);
									updatePo();
								} else {
									$("#bidCheckResult").text("나같으면 즉시구매함 ㅋㅋ("+prod_imme+")");
									$("#bidCheckResult").css("color", "red");
									$("#bidCommit").attr("disabled", "disabled");
								}
							} else {
								$("#bidCheckResult").text("더 써보세요...");
								$("#bidCheckResult").css("color", "red");
								$("#bidCommit").attr("disabled", "disabled");
							}
						} else {
							$("#bidCheckResult").text("보유한 포인트가 부족합니다!\n("+nowPo+")원 보유중!");
							$("#bidCheckResult").css("color", "red");
							$("#bidCommit").attr("disabled", "disabled");
						}
					} else {
						$("#bidCheckResult").text("경매 끝났어요~");
						$("#bidCheckResult").css("color", "red");
						$("#bidCommit").attr("disabled", "disabled");						
					}
					
				},
				error : function() {
					console.log("통신실패");
				}
			});
		});
		
		$("#bidCommit").click(function(){
			bid = Number($('#bid').val());
			$.ajax({
				url : "bidCommitService",
				method : "post",
				data : {"prod_num":<%=prod_num%>,"bid_price" : bid,"mem_num":<%=info.getMem_num()%>},
				dataType : "JSON",
				success : function(data){
					console.log("통신성공");
					console.log(data.bidCommit);
					
					if(data.bidCommit == "OK"){
						$("#bidCommitResult").text("입찰성공!");
						$("#bidCommitResult").css("color","black");
						$("#bidCheck").attr("disabled", false);
						$("#bid").attr("readonly",false);
						$("#bidCommit").attr("disabled", "disabled");
						updateRealPo();
					} else {
						$("#bidCommitResult").text("입찰실패...");
						$("#bidCommitResult").css("color","red");
					}
				},
				error : function(){
					console.log("통신실패");
				}
			});		
		});
		
		setInterval(updateCur, 1000);
		function updateCur(){
			$.ajax({
				url : "updateCurService",
				method : "POST",
				dataType : "JSON",
				success : resultCur,
				error : errFun
			});
		}		
		function resultCur(data){
			var nowCur="";
			nowCur+=data[0].prod_cur;
			$("#prod_cur").text(nowCur);
		}
		// 포인트 얼마 까일지 계산하는 곳
 		function updatePo(){
			$.ajax({
				url : "updatePoService",
				method : "POST",
				data : {"bid_price":bid},
				dataType : "JSON",
				success:function(){
					console.log("통신성공");
				},
				error:errFun
			});
		}
 		// 실제 포인트 차감하는 곳
 		function updateRealPo(){
 			$.ajax({
 				url:"updateRealPoService",
 				method:"POST",
 				dataType:"JSON",
 				success:function(){
 					console.log("통신성공");
 				},
 				error:errFun
 			});
 		}
 		
	</script>
	<%}%>
</body>
</html>