<%@page import="com.smhrd.model.MemVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<%
	// 이전 페이지 지정(로그인 후 돌아올 곳 지정)
	String prevPage = request.getRequestURI().toString();
	prevPage = prevPage.substring(13);
	session.setAttribute("prevPage", prevPage);

	MemVO info = (MemVO) session.getAttribute("info");
	// 회원 정보 세션에서 가져오기
	if (info == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
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
				<%
				if (info != null) {%>
				<ul class="nav">
					<li><%=info.getMem_grade()%></li>
					<li><%=info.getMem_name()%>님</li>
					<li><a href="MemberUpdate.jsp">마이페이지</a></li>
					<li><a href="LogoutService">로그아웃</a></li>
				</ul>
					<%if (info.getMem_email().equals("admin")) {%>
					<ul class ="nav2">
                    <li><a href="MemberListService">회원목록</a></li>
                    <li><a href="ProdRegi_Admin.jsp">판매등록</a></li>
                    <li><a href="AuctionConfirm.jsp">경매확인</a></li>
                </ul><% } %>
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
                    <span>판매등록</span>
                </div>
                <div class="side_contents"></div>
            </div>
            <div class="main_menu">
                <div class="main_name">
                    <li id="prm_name">상품등록 페이지</li>
                </div>
                <div class="main_content">
                    <form class="prm_element" action="ProdRegi_MemberService" method="post">
                        <table class="prm_table" border="1">
                            <tr>
                                <td><span id="prm_title">상품이름</span></td>
                                <td><input type="text" name="prodName"></td>
                            </tr>
                            <tr>
                                <td><span class="prm_isUrg">급처경매</span></td>
                                <td>
                                    <input id="prm_isUrg_Y" type="radio" name="isUrg" value="Y">예
                                    <input id="prm_isUrg_N" type="radio" name="isUrg" value="N">아니오
                                </td>
                            </tr>
                            <tr>
                                <td class="prm_btn" colspan="2">
                                    <input type="reset" value="초기화">
                                    <input type="submit" value="등록">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>