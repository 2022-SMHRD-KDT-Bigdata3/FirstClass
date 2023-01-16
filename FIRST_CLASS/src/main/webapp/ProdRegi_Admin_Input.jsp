<%@page import="com.smhrd.model.MemVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
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
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<div class="main">
					<a href="main.jsp">피베이</a>
				</div>
				<div class="search_area">
					<form action="searchResult.jsp">
						<input type="text" placeholder="검색어를 입력하세요"
							onKeypress="javascript:if(event.keyCode==13) {enterkey()}">
						<div class="search_icon">
							<input type="submit" class="searach_submit" value="검색">
						</div>
					</form>
				</div>
				<%
				if (info != null) {
				%>
				<ul class="nav">
					<li><%=info.getMem_grade()%>
					<li>
					<li><%=info.getMem_name()%>님</li>
					<li><a href="MemberUpdate.jsp">마이페이지</a></li>
					<li><a href="LogoutService">로그아웃</a></li>
				</ul>
				<%
				if (info.getMem_email().equals("admin")) {
				%>
				<ul class="nav2">
					<li><a href="MemberListService">회원목록</a></li>
					<li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
					<li><a href="AuctionConfirm.jsp">경매확인</a></li>
				</ul>
				<%
				}
				%>
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
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>관리자 판매등록</span>
				</div>
				<div class="side_contents">
					<li><a href="MemberListService">회원 목록</a></li>
					<li><a href="AuctionConfirm.jsp">경매 확인</a></li>
				</div>
			</div>
			<div class="main_menu">
				<div class="main_name">
					<li>관리자 판매등록</li>
				</div>
				<div class="selling_list">
					<div class="selling_list_name">
						<span>미등록 상품 목록</span>
					</div>
					<div class="admin_input_area">
						<form action="ProdRegi_Admin_InputService" method="post">
							<table class="selling_table">
								<tr>
									<td>상품 번호</td>
									<td><%=prod_num%> <input type="hidden" name="prod_num"
										id="prod_num"></td>
								</tr>
								<tr>
									<td>상품명</td>
									<td><%=prod_name%></td>
								</tr>
								<tr>
									<td>분류</td>
									<td><select name="cate_num" class="inp">
											<option value="4">디즈니
											<option value="6">귀멸의 칼날
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
									<td><input readonly type="text" name="prod_time"
										id="prod_time" class="inp">
										<button type="button" onclick="calDate()">계산</button></td>
								</tr>
								<tr>
									<td>전문가 의견</td>
									<td><input type="text" name="prod_opinion" class="inp"></td>
								</tr>
								<tr>
                                    <td>전문가 감정가</td>
                                    <td><input type="text" name="prod_price" id="evaluation_price">
                                        <button type="button" onclick="calPrice()">계산</button>
                                    </td>
                                </tr>
								 <tr>
                                    <td>경매 시작가</td>
                                    <td><input readonly type="text" name="prod_price" id="prod_price"> 
                                        <input type="hidden" name="prod_cur" id="prod_cur">
                                    </td>
                                </tr>
								<tr>
									<td>즉시 구매가</td>
                                    <td>
                                    <input readonly type="text" name="prod_imme" id="prod_imme">
                                    </td>
								</tr>
								<tr>
									<td>상품사진(경로)</td>
									<td><input type="text" name="prod_img" class="inp">
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
							<div class="admin_input_submit">
								<input type="submit" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var calPrice = function() {
		var evaluation_price = document.querySelector("#evaluation_price").value;

		var prod_price = parseFloat(evaluation_price * 0.9);
		var prod_imme = parseFloat(evaluation_price * 1.5);

		document.querySelector("#prod_price").value = Math.ceil(prod_price);
		document.querySelector("#prod_cur").value = Math.ceil(prod_price);
		document.querySelector("#prod_imme").value = Math.ceil(prod_imme);
		document.querySelector("#prod_num").value =
<%=prod_num%>
	;
	};

	var calDate = function() {
		/* aucTime이 어디 있는지 확인할 것 */
		var date =
<%=cal.get(Calendar.YEAR)%>
	+ "/"
				+
<%=(cal.get(Calendar.MONTH) + 1)%>
	+ "/"
				+
<%=cal.get(Calendar.DATE)%>
	+ "/"
				+
<%=cal.get(Calendar.HOUR_OF_DAY)%>
	+ ":"
				+
<%=cal.get(Calendar.MINUTE) + aucTime%>
	+ ":"
				+
<%=cal.get(Calendar.SECOND)%>
	;
		document.querySelector("#prod_time").value = date;
	};
</script>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {

			// 엔터키가 눌렸을 때 실행하는 반응
			$("#form").submit();
		}
	}
</script>
</html>