<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div style = "float:top; width:100% ;hight:100px; background-color:#BDDBEF">
		<h1><a href = "main.jsp">퍼스트</a></h1>
	</div>
	<div style="float:left; width:20%; heigth:300px; text-align:left">
		<a href="MemberUpdate.jsp">개인정보수정</a><br> 
		<a href="BuyList.jsp">구매내역조회</a><br>
		<a href="SellList.jsp">판매내역조회</a><br> 
		<a href="PointCheckService">포인트조회/충전</a><br>
	</div>
	<div style=" width:80%; hight:20px; float:left; text-align: center">
		<h4>회원정보수정</h4>
	</div>
	<div style=" width:80%; hight:280px; float:left">
	<form action="MemUpdateService" method="post">
		<li><input type="password" id="pw" name="mem_pw"
			placeholder="비밀번호"></li>
		<li><input name="mem_name" type="text" placeholder="이름을 입력하세요"></li>
		<li><input name="mem_addr" type="text" placeholder="주소를 입력하세요"></li>
		<li><input name="mem_ph" type="text"
			placeholder="'-'를 제외한 휴대폰번호를 입력하세요"></li>
		<li><input type="submit" value="회원수정"></li>
	</form>
	</div>
	<script type="text/javascript">
	
	function isSame() {
	    var pw = document.mem_pw.value;
	    var confirmPW = document.twin.mem_pwok.value;
	    if (pw.length < 6 || pw.length > 16) {
	        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	        document.getElementById('pw').value=document.getElementById('pwok').value='';
	        document.getElementById('same').innerHTML='';
	    }
	    if(document.getElementById('pw').value!='' && document.getElementById('pwok').value!='') {
	        if(document.getElementById('pw').value==document.getElementById('pwok').value) {
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.color='blue';
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.color='red';
	        }
	    }
	}
	</script>
</body>
</html>