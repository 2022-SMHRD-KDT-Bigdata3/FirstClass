<%@page import="com.smhrd.model.Join3VO"%>
<%@page import="com.smhrd.model.Join3DAO"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
td {
	text-align:center;
}
</style>
</head>
<body>
	<h1>
		<a href="main.jsp">메인페이지로 이동</a>
	</h1>
	<h1>경매 결과 확인 페이지</h1>
	<div>
		<h2>낙찰 상품 목록</h2>
		<table border="1">
			<tbody>
				<tr>
					<td>사진</td>
					<td>상품번호</td>
					<td>상품명</td>
					<td>판매자</td>
					<td>낙찰가</td>
					<td>낙찰자</td>
					<td>확인</td>
				</tr>
			</tbody>
			<tbody id="sucBidList">
			</tbody>
		</table>
		<h2>유찰 상품 목록</h2>
		<table border="1">
			<tbody>
				<tr>
					<td>사진</td>
					<td>상품번호</td>
					<td>상품명</td>
					<td>판매자</td>
				</tr>
			</tbody>
			<tbody id="failBidList">
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
		// 낙찰 상품 실시간 업데이트
		setInterval(updateSucBid, 1000);
		function updateSucBid(){
			$.ajax({
				url:"updateSucBidService",
				method:"post",
				dataType:"JSON",
				success:resultSucBid,
				error:errFun
			});
		}
		
		function resultSucBid(data){
			var html="";
			for(var i=0;i<data.length;i++){
				html += "<tr>";
				html += "<td><img src='";
				html += data[i].prod_img;
				html += "' width='200px' height='200px'></td>";				
				html += "<td>" + data[i].prod_num + "</td>";
				html += "<td>" + data[i].prod_name + "</td>";
				html += "<td>" + data[i].seller + "</td>";
				html += "<td>" + data[i].bid_price + "</td>";
				html += "<td>" + data[i].suc_bidder + "</td>";
				html += "<td><a href='setSucBidderService?";
				html +=	"prod_num=" + data[i].prod_num; 
				html += "&bidder_id=" + data[i].bidder;
				html += "&bid_price=" + data[i].bid_price;
				html += "&seller_id=" + data[i].seller;
				html += "'>확인</a></td>";
				html += "</tr>";
			}
			$("#sucBidList").html(html);
		}
		
		// 유찰 상품 실시간 업데이트
		setInterval(updateFailBid, 1000);
		function updateFailBid(){
			$.ajax({
				url:"updateFailBidService",
				method:"post",
				dataType:"JSON",
				success:resultFailBid,
				error:errFun
			});
		}
		
		function resultFailBid(data){
			var html="";
			for(var i=0;i<data.length;i++){
				html += "<tr>";
				html += "<td><img src='";
				html += data[i].prod_img;
				html += "' width='200px' height='200px'></td>";				
				html += "<td>" + data[i].prod_num + "</td>";
				html += "<td>" + data[i].prod_name + "</td>";
				html += "<td>" + data[i].seller + "</td>";
				html += "</tr>";
			}
			$("#failBidList").html(html);
		}
		
		function errFun(err) {
			console.log(err);
			console.log("통신실패...");
		}
	</script>
</body>
</html>