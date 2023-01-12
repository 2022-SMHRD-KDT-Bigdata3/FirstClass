<%@page import="com.smhrd.model.MemDAO"%>
<%@page import="com.smhrd.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
</head>
<body>
	<div style="float: top; width: 100%; hight: 100px; background-color: #BDDBEF">
		<h1><a href = "main.jsp">퍼스트</a></h1>
	</div>
	<div style="float: left; width: 20%; heigth: 300px; text-align: left">
		<a href="MemberUpdate.jsp">개인정보수정</a><br> 
		<a href="BuyList.jsp">구매내역조회</a><br>
		<a href="SellListService">판매내역조회</a><br> 
		<a href="PointCheckService">포인트조회/충전</a><br>
	</div>
	<div style="width: 80%; hight: 20px; float: left; text-align: left">
		<h4>포인트 조회/충전</h4>
	</div>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
	int mem_num = info.getMem_num();
	MemDAO dao = new MemDAO();
	int result = dao.PointCheck(mem_num);
	%>

	<div style="width: 80%; hight: 280px; float: left">
		<h3 style="hight: 15px; float:left;">내 포인트</h3>
		<h3 style="hight: 15px; float:left; margin-left:20px;"><%=result%></h3>
		<button onclick= "request_pay()" style="float:left; margin-left:100px; margin-top:20px">충전</button>
	</div>
</body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	    <script>
        var IMP = window.IMP;
        var pin = "imp17474603";
        IMP.init(pin); 
      	
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
        function request_pay(){
        	console.log("클릭");
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : 'card',
                merchant_uid: "ORD20180131-0000111", 
                name : '레진 원피스 에이스 염화',
                amount : 500000,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456',
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
</html>