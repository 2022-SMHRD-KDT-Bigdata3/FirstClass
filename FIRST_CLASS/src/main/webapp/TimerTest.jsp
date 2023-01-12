<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>현재 시각은?</title>

</head>
<body>
	<p>
		현재 시각 <span id="current" class="display"></span>
	</p>
	<script>
		setInterval(displayNow, 1000); // 1초마다 시간 갱신
		function displayNow() {
			let now = new Date();
			let currentTime = now.toLocaleTimeString();//현재 거주 지역에 맞는 시간

			document.querySelector("#current").innerHTML = currentTime
		}
	</script>
</body>
</html>