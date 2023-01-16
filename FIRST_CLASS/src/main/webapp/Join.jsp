<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="wrap">
    <div class = "intro_bg">
        <div class = "header">
            <div class = "main">
                <a href="main.jsp">피베이</a>
            </div>
            <div class="search_area">
					<form action="searchResult.jsp">
                        <input type ="text" name="search" placeholder="검색어를 입력하세요"  onKeypress="javascript:if(event.keyCode==13) {enterkey()}">
                    	<div class="search_icon">
                            <input type="submit" class="searach_submit" value="검색">
                        </div>
                    </form>
				</div>
            <ul class = "nav">
                <li><a href= "Login.jsp">로그인</a></li>
                <li><a href= "Join.jsp">회원가입</a></li>                   
            </ul>
        </div>
        <div class = "header_menu">
            <div class="header_contents">
                <li><a href="PopProd.jsp">인기 경매</a></li>
                <li><a href="UrgencyProd.jsp">급처 경매</a></li>
                <li><a href="ProdSale.jsp">판매 등록</a></li>
                <li><a href="PostMain.jsp">문의 게시판</a></li>
            </div>
        </div>
    </div>
    <div class = "main_bg">
        <div class ="side_menu">
            <div class = "side_mypage">
                <span>회원가입</span>
            </div>
            <div class = "side_contents">
                <li><a href="Login.jsp">로그인</a></li>
            </div>
        </div>

            <div class = "main_menu">
                <div class = "main_name">
                    <li>회원가입</li>
                </div>
                <div class = "main_content">
                    <form action="JoinService" method="post" name="joinForm">
                        <fieldset class="join_form">
                            <legend></legend>
                            <div class="join_form_element">
                                <input id="mem_email" name="mem_email" type="text"	placeholder="이메일을 입력하세요.">
                                <button id="idCheck" type="button">중복확인</button><br>
                                <span id="idCheckResult"></span><br>
                                <input name="mem_pw" type="password" placeholder="비밀번호를 입력하세요."><br> 
                                <input name="mem_name" type="text" placeholder="이름을 입력하세요."><br>
                                <input name="mem_addr" type="text" placeholder="주소를 입력하세요."><br> 
                                <input name="mem_ph" type="text" placeholder="'-'를 제외한 휴대폰번호를 입력하세요."><br> 
                                <input type="submit" value="회원가입" id="joinBtn" disabled>
                            </div>
                        </fieldset>
                    </form>
                </div>
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
                    $("#idCheckResult").css("color", "green");
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
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {

			// 엔터키가 눌렸을 때 실행하는 반응
			$("#form").submit();
		}
	}
</script>
</div>
</div>
</body>
</html>