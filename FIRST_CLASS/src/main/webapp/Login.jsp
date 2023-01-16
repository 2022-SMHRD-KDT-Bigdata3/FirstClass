<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="ko">
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
</head>
<body>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<div class="main">
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
				<ul class="nav">
					<li><a href="Login.jsp">로그인</a></li>
					<li><a href="Join.jsp">회원가입</a></li>
				</ul>
			</div>
			<div class="header_menu">
				<div class="header_contents">
					<li><a href="PopProd.jsp">인기 경매</a></li>
					<li><a href="UrgencyProd.jsp">급처 경매</a></li>
					<li><a href="ProdSale.jsp">판매 등록</a></li>
					<li><a href="PostMain.jsp">문의 게시판</a></li>
				</div>
			</div>
		</div>
		<div class="main_bg">
			<div class="side_menu">
				<div class="side_mypage">
					<span>로그인</span>
				</div>
				<div class="side_contents">
					<li><a href="Join.jsp">회원가입</a></li>
				</div>
			</div>
			<div class="main_menu">
				<div class="main_name">
					<li>로그인</li>
				</div>
				<div class="main_login">
					<div class="nomal_login">
						<form action="LoginService" method="post">
							<div class="nomal_login_text">
								<span>퍼스트 로그인</span>
							</div>
							<div class="login_info">
								<li><span>이메일</span><input name="mem_email" type="text"
									placeholder="Email을 입력하세요"></li> <br>
								<li><span>비밀번호</span><input class="password_info"
									name="mem_pw" type="password" placeholder="비밀번호를 입력하세요"></li>
							</div>
							<div class="login_submit">
								<input type="submit" value="일반 로그인">
							</div>
						</form>
					</div>
					<div class="kakao_login_text">
						<span>간편 로그인</span>
					</div>
					<div class="kakao_login">
						<ul>
							<li onclick="kakaoLogin();"><a href="javascript:void(0)">
									<img src="image/kakao_login.png" class="kakao_img">
							</a></li>
						</ul>
					</div>


				</div>

			</div>
		</div>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init('b4b16d99716ca09d7889315c447f8ced'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인
    function kakaoLogin() {
        Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
            url: '/v2/user/me',
            success: function (response) {
        	    console.log(response)
            },
            fail: function (error) {
                console.log(error)
            },
            })
        },
            fail: function (error) {
                console.log(error)
        },
        })
    }
    </script>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {

			// 엔터키가 눌렸을 때 실행하는 반응
			$("#form").submit();
		}
	}
</script>
</body>
</html>