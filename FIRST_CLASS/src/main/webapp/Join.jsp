<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div
		style="float: top; width: 100%; hight: 100px; background-color: #BDDBEF">
		<h1>
			<a href="main.jsp">메인페이지로 이동</a>
		</h1>
	</div>
	<div
		style="width: 50%; hight: 50%; margin-left: 30%; margin-top: 10%; text-align: center">
		<form action="JoinService" method="post" name="joinForm">
			<fieldset>
				<legend style="pading: 3px 6px; background-color: #BDDBEF">회원가입</legend>

				<input id="mem_email" name="mem_email" type="text"
					style="width: 220px" placeholder="email ">
				<button id="idCheck" type="button" style="width: 84px">중복확인</button>
				<br> <span style="font-size: 12pt" id="idCheckResult"></span><br>
				<input name="mem_pw" type="password" style="width: 310px"
					placeholder="pw"><br> <input name="mem_name"
					type="text" style="width: 310px" placeholder="name"><br>
				<input name="mem_addr" type="text" style="width: 310px"
					placeholder="addr"><br> <input name="mem_ph"
					type="text" style="width: 310px"
					placeholder="'-'를 제외한 휴대폰번호를 입력하세요"><br> <input
					type="submit" value="회원가입" id="joinBtn" disabled>
			</fieldset>
		</form>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		$('#idCheck').click(function() {
			var mem_email = $('#mem_email').val();
			console.log(mem_email + '아이디 중복체크 누름');

			$.ajax({
				url : "IdCheck",
				method : "post",
				data : {
					"mem_email" : mem_email
				},
				dataType : "JSON",
				success : function(data) {
					console.log("통신성공");
					console.log(data.idCheck);

					if (data.idCheck == "OK") {
						$("#idCheckResult").text("사용가능한 아이디 입니다.");
						$("#idCheckResult").css("color", "black");
						$("#joinBtn").removeAttr("disabled");
					} else {
						$("#idCheckResult").text("사용불가능한 아이디 입니다.")
						$("#idCheckResult").css("color", "red");
					}
				},
				error : function() {
					console.log("통신실패");
				}
			});
		});
	</script>

</body>
</html>