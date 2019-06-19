
<%@page import="java.sql.ResultSet"%>
<%@page import="shop.service.ShopService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>치킨</title>
<link rel="stylesheet" href="css/shops.css">

</head>
<body>

	<header class="login">
		<nav>
			<ul>
				<a href="index.jsp" style="margin-right: 600px;"><img
					src="image/logo1.png" width="7%"></a>
				<li><button id="join">
						<a href="index.jsp">로그아웃</a>
					</button></li>
				<li><button id="join">
						<a href="myinfor.jsp">마이 요기요</a>
					</button></li>
				<li><button id="join"
						style="background: #FD7200; width: 150px; margin-right: 400px;">
						<a href="#">주문표</a>
					</button></li>
			</ul>
		</nav>
	</header>
	<div class="clear"></div>
	<header class="Brand">
		<div class="menubar">
			<ul>
				<li><a href="#">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">1인분주문&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">프랜 차이즈&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">분식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">피자&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a class="active" href="#">치킨&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">족발/보쌈&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">야식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">한식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">중국집&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">일식/돈까스&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="#">카페/디저트&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</ul>
		</div>
	</header>

	<div class="clear"></div>
	<%
		String type = "chicken";
		ShopService service = ShopService.getInstance();
		ResultSet rs = service.selectByType(type);
	%>

	<table border="1" cellspacing="0">
		<tr>
			<td>음식점 이름</td>
			<td>영업 시간</td>
			<td>결제 방식</td>
		</tr>

		<%
			while (rs.next()) {
		%>
		<tr>
			<td>
			<form action="shops/shop.jsp">
				<input type="hidden" name="name" value="<%=rs.getString(1)%>">
				<button type="submit"><%=rs.getString(1) %></button>
			</form>
			</td>
			<%-- <td><a href="shops/<%=rs.getString(1)%>.jsp"><%=rs.getString(1)%></a></td> --%>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		rs.close();
	%>


	<div class="clear"></div>
	<header class="news">
		<nav>
			<ul>
				<li><a href="#">이용약관 |</a></li>
				<li><a href="#"> 개인정보 처리방침 |</a></li>
				<li><a href="#"> 통합멤버십정책 |</a></li>
				<li><a href="#"> 회사소개 |</a></li>
				<li><a href="#"> 여기요사장님 |</a></li>
				<li><a href="#"> 입점문의</a></li>
				<li><a href="#"> 공지사항</a></li>
			</ul>
		</nav>
	</header>
	<footer>
		<p style="font-weight: bold; font-size: 15px;">(용인)딜리버리히어로 유니버시티.</P>
		<P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX:
			031-332-6479</p>
		<p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 :
			partnership@deliveryhero.co.kr|고객만족센터 :
			support@yogiyo.co.kr|호스트서비스사업자 : (주)심플렉스인터넷</p>
	</footer>
</body>
</html>