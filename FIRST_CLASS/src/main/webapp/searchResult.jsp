<%@page import="com.smhrd.model.MemVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.ProdDAO"%>
<%@page import="com.smhrd.model.ProdVO"%>
<%@page import="java.util.ArrayList"%>
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
</head>
<body>
	<%
	MemVO info = (MemVO) session.getAttribute("info");
	String prod_name = request.getParameter("search");
	
	ArrayList<ProdVO> list = new ArrayList<>();
	ProdDAO dao = new ProdDAO();
	list = dao.searchProd(prod_name);
	Date now = new Date();
	%>
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
                <%
				if (info != null) {%>
				<ul class="nav">
					<li><%=info.getMem_grade()%> 등급</li>
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
            <div class = "header_menu">
                <div class="header_contents">
                    <li><a href="Popprod.jsp">인기 경매</a></li>
                    <li><a href="UrgencyProd.jsp">급처 경매</a></li>
                    <li><a href="ProdRegi_Member.jsp">판매 등록</a></li>
                    <li><a href="PostMain.jsp">문의 게시판</a></li>
                </div>
            </div>
        </div>
        <div class = "main_bg">
            <div class ="side_menu">
                <div class = "side_mypage">
                    <span>검색 결과</span>
                </div>
                <div class = "side_contents">
                    <li><a href="CateProd.jsp?cate_num=12">Marvel</a></li>
                    <li><a href="CateProd.jsp?cate_num=4">디즈니</a></li>
                    <li><a href="CateProd.jsp?cate_num=6">귀멸의 칼날</a></li>
                    <li><a href="CateProd.jsp?cate_num=8">건담</a></li>
                    <li><a href="CateProd.jsp?cate_num=10">원피스</a></li>
                </div>
            </div>
            <div class = "prod_list">
                <div class = "list_name">
                    <li>'<%=prod_name %>'에 대한 검색 결과</li>
                </div>
                <div class = "list_contents">
                    <table class = "list_table">
                        <tr>
                            <td>상품 사진</td>
                            <td>상품명</td>
                            <td>급처 경매여부</td>
                            <td>마감 시간</td>
                            <td>현재 입찰가</td>
                            <td>즉시 구매가</td>
                            <td>이동</td>
                        </tr>
                        <%
						for (int i = 0; i < list.size(); i++) {
							Date date = list.get(i).getProd_time();
							SimpleDateFormat SDF = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
							String prod_time = SDF.format(date);

							long diff = date.getTime() - now.getTime();
							if (diff > 0) {
						%>
						<tr>
							<td><img src="<%=list.get(i).getProd_img()%>" style = "width:150px;height:150px"></td>
							<td><%=list.get(i).getProd_name()%></td>
							<td><%=list.get(i).getBid_isUrgency()%></td>
							<td><%=prod_time%></td>
							<td><%=list.get(i).getProd_cur()%></td>
							<td><%=list.get(i).getProd_imme()%></td>
							<td><a
								href="ProdSale.jsp?prod_num=<%=list.get(i).getProd_num()%>">이동</a></td>
						</tr>
						<%
						}
						%>
						<%
						}
						%>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">function enterkey() {
    if (window.event.keyCode == 13) {
    	 
        // 엔터키가 눌렸을 때 실행하는 반응
        $("#form").submit();
   }
}</script>
</html>