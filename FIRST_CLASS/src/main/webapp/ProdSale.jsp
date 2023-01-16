<%@page import="com.smhrd.model.BidVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@page import="com.smhrd.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="AllProdStyle.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>상품 상세</title>
</head>
<body>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));

	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage + "?prod_num=" + prod_num;
	prevPage = prevPage.substring(13);

	session.setAttribute("prevPage", prevPage);
	session.setAttribute("prod_num", prod_num);


	if (info == null) {
		response.sendRedirect("Login.jsp");
	} else {

	ProdDAO dao = new ProdDAO();
	ProdVO vo = dao.selectOneProd(prod_num);

	Date date = vo.getProd_time();
	Date now = new Date();	
	
	long diffSec = ((date.getTime() - now.getTime()) / 1000) % 60; // 초 차이
/* 	int mem_po = (int) session.getAttribute("realDecPo"); */
	%>
	<div class="intro_bg">
		<div class="header">
			<div class="main">
				<a href="main.jsp">피베이</a>
			</div>
			<div class="search_area">
				<form action="searchResult.jsp">
					<input type="text" name="search" placeholder="검색어를 입력하세요"
						onKeypress="javascript:if(event.keyCode==13) {enterkey()}">
					<div class="search_icon">
						<input type="submit" class="searach_submit" value="검색">
					</div>
				</form>
			</div>
			<%
				if (info != null) {%>
			<ul class="nav">
				<li><%=info.getMem_grade()%> 등급</li>
				<li><%=info.getMem_name()%>님</li>
				<li><a href="MemberUpdate.jsp">마이페이지</a></li>
				<li><a href="LogoutService">로그아웃</a></li>
			</ul>
			<%if (info.getMem_email().equals("admin")) {%>
			<ul class="nav2">
				<li><a href="MemberListService">회원목록</a></li>
				<li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
				<li><a href="AuctionConfirm.jsp">경매확인</a></li>
			</ul>
			<% } %>
			<%
				} else {
				%>
			<ul class="nav">
				<li><a href="Login.jsp">로그인</a></li>
				<li><a href="Join.jsp">회원가입</a></li>
			</ul>
			<%
				}
				%>
		</div>
		<div class="header_menu">
			<div class="header_contents">
				<li><a href="PopProd.jsp">인기 경매</a></li>
				<li><a href="UrgencyProd.jsp">급처 경매</a></li>
				<li><a href="ProdRegi_Member.jsp">판매 등록</a></li>
				<li><a href="PostMain.jsp">문의 게시판</a></li>
			</div>
		</div>
	</div>

	

	<div class="detail">
		<span>➡<%=vo.getProd_name()%></span> <a href="AllProd.jsp"
			class="total-button" style="float: right; margin-top: 10px;">목록보기</a>
		<br>
		<div class="wrap">
			<div class="left-wrap inner-wrap">
				<div class="detail_image">
					<img src="<%=vo.getProd_img()%>">
				</div>
			</div>
			<div class="right-wrap inner-wrap">
				<div class="detail-prod-data">
					<div class="detail_finish">
						<!-- 마감시간 -->
						<div class="detail-finish-box">
							<span style="font-size: 20px; vertical-align: top;">남은시간 :
							</span> <span id="remainTime">남은시간이 표시됩니다.</span>
						</div>
					</div>
					<div class="detail_name">
						<!-- 상품명 -->
						<%=vo.getProd_name()%>
					</div>
					<div class="detail_Prodop">
						<!-- 전문가의견 -->
						<%=vo.getProd_opinion()%>
					</div>
					<div class="detail_Prodprice">
						<!-- 경매시작가 -->
						<div class="detail-price-inner">
							<span>감정가</span> <span style="float: right;"><%=vo.getProd_price()%>
								원</span>
						</div>
					</div>
					<div class="detail_Prodcur">
						<!-- 현재입찰가 -->
						<div class="detail-bidcost-inner">
							<!-- 							<span id="prod_cur">현재 입찰가</span> -->
							<span>현재 입찰가</span> 
							<span style="float: right; padding-left: 6px;">원</span>
							<span id="prod_cur" style="float: right;"><%=vo.getProd_cur()%></span>
						</div>
					</div>
					<div class="prod_imme">
						<!-- 즉시구매가 -->
						<div class="detail-current-inner">
							<span>즉시 구매가</span> <span
								style="float: right; padding-left: 6px;">원</span> <span
								style="float: right;" id="prod_imme2"> <%=vo.getProd_imme()%></span>
						</div>
					</div>
					<div class="bidding-wrap">
						<div class="detail-bidding-left">
							<span class="bidding-name">입찰</span>
						</div>
						<div class="detail-bidding-right">
							<div>
								<input type="text" id="bid" placeholder="입찰가 입력">
								<button type="button" id="bidCheck">조회</button>
							</div>
							<hr class="detail-bidding-hr">
							<span id="bidCheckResult">입찰 가능시 아래 버튼이 활성화됩니다.</span><br>
							<hr class="detail-bidding-hr">
							<button type="button" class="total-button success-button"
								id="bidCommit" disabled>확정</button>
							<br>
							<hr class="detail-bidding-hr">
							<span id="bidCommitResult">입찰 성공여부가 출력됩니다.</span><br>
							<hr class="detail-bidding-hr">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var bid = 0;
		var prod_imme = 0;
		var value = "";
		var nowPoint;
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
			nowPoint=data[0].mem_po;
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
			prod_imme = Number($('#prod_imme2').text());
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
					
					if(value!="경매종료"){ //경매 중
						if(bid<=nowPoint<%--  || nowPoint-<%=mem_po%> >0 --%>){ //내가 가진 포인트가 입력한 값보다 크거나 같을 때 
							if (data.bidCheck == "OK") { //입찰 가능할 때 
								if (prod_imme >= bid) { // 입력한 값이 즉시 구매가보다 작을 때
									$("#bidCheckResult").text("최고입찰가! " + bid + "(으)로 입찰 가능합니다!");
									$("#bidCheckResult").css("color", "black");
									$("#bidCommit").removeAttr("disabled");
									$("#bidCheck").attr("disabled", true);
									$("#bid").attr("readonly",true);
									updatePo();
								} else { //즉시 구매가가 입력한 값보다 작을 때
									$("#bidCheckResult").text("즉시구매 가능한 입찰가입니다. 즉시구매를 추천합니다.("+prod_imme+")");
									$("#bidCheckResult").css("color", "red");
									$("#bidCommit").attr("disabled", "disabled");
								}
							} else { //입찰 안될 때 
								$("#bidCheckResult").text("현재 입찰가보다 적은 금액을 입력하셨습니다. 금액을 올려서 다시 입찰해주세요.");
								$("#bidCheckResult").css("color", "red");
								$("#bidCommit").attr("disabled", "disabled");
							}
							
						} else { //내가 가진 포인트가 입력한 값보다 작을 때 
							$("#bidCheckResult").text("보유한 포인트가 부족합니다.\n 보유중인 포인트는("+nowPoint+")원 입니다.");
							$("#bidCheckResult").css("color", "red");
							$("#bidCommit").attr("disabled", "disabled");
						}
					} else { //경매 종료
						$("#bidCheckResult").text("경매가 종료되었습니다.");
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
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			// 엔터키가 눌렸을 때 실행하는 반응
			$("#form").submit();
		}
	}
</script>
</html>