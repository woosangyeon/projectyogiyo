<%@ page language="java" contentType="text/html; charset=EUC-KR"
import="coupon.model.Coupon"
import="java.sql.*"
import="util.DBConnection"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이요기요</title>
	<style>
		body{
			background:#F2F2F2;
		}
		#join {
			margin-top: 10px;
			margin-bottom: 10px;
			width:100px;
			height:50px;
			color: white;
			background:#EC1616;
			border:1px white outset;
			font-size:1.0em;
		}
		.login{
			background:#EC1616;
			text-align: right;
			font-size: 15px;
			z-index: 1;
		}
		.news{
			text-align: center;
			font-size: 15px;
			z-index: 1;
			border:1px solid;
			border-color: #cccccc;
		}
		.infor{
			height: 300px;
			text-align:justify;
			margin-bottom:20px;
			margin-left:150px;
			background-color:white;
			box-sizing: border-box;
			border-radius:20px;
			width:80%;
			float:left;
			padding-bottom:30px;
			color:black;
		}
		.Brandimage{
			width: 100%;
			height:180px;
			float: left;
			margin-left: 650px;
		}
		.backimage{
		background-image:url('image/back.png');
		background-repeat:no-repeat;
		background-size:cover;
		}
		section{
			margin-top: 20px;
			width:70%;
			height: 200px;
			float: left;
			margin-left: 350px;
		}
		article{
			width:20%;
			height: 100%;
			margin-left: 10px;
			border:solid 1px #cccccc;
			float: left;
		}
		.clear{
			clear: both;
		}
		footer{
			border:1px solid;
			border-color: #cccccc;
			padding:10px;
			padding-right: 50px;
			color: black;
			text-align: right;
			font-size: 12px;

		}
		ul{
			list-style-type: none;
		}
		ul li{
			display: inline;
			text-align: left;
		}
		ul li a{
			color:white;
			text-decoration: none;
		}
		.news ul li a{
			color:#848484;
		}
		h3{
		font-weight:lighter;
		}
		.head{
		background-color:#EC1616;
		border-radius:20px 20px 0 0 / 20px 20px 0 0;
		}
		p {
    	display: block;
   	 	margin-block-start: 0em;
   	 	margin-block-end: 0em;
   	 	margin-inline-start: 0px;
   	 	margin-inline-end: 0px;
		}
		input[type="text"]{
		width: 200px;
		height: 40px;
		border-radius:5px;
		border-color:black;
		}
		input[type="password"]{
		width: 200px;
		height: 40px;
		border-radius:5px;
		border-color:black;
		}
		input[type="submit"]{
		height: 45px;
		width: 100px;
		background-color: #848484;
		border-color:white;
		color:white;
		border:none;
		padding-left:10px;
		padding-right:10px;
		}
	</style>

</head>
<body>
	
<header class="login">
		<%
			if (session.getAttribute("id") == null) // 로그인이 안되었을 때
			{
		%>

		<nav>
			<ul>
				<a href="index.jsp" style="margin-right: 600px;"><img
					src="image/logo1.png" width="7%"></a>
				<li><button id="join">
						<a href="loginform.jsp">로그인</a>
					</button></li>
				<li><button id="join">
						<a href="registerform.jsp">회원가입</a>
					</button></li>
				<li><button id="join"
						style="background: #FD7200; width: 150px; margin-right: 400px;">
						<a href="#">주문표</a>
					</button></li>
			</ul>
		</nav>

		<%
			} else { // 로그인 했을 경우
		%>

		<nav>
			<ul>
				<a href="index.jsp" style="margin-right: 600px;"><img
					src="image/logo1.png" width="7%"></a>
					<li><%=session.getAttribute("id") %> 님 환영합니다.
					</li>
				<li><button id="join">
						<a href="logoutProc.jsp">로그아웃</a>
					</button></li>
				<li><button id="join">
						<a href="inforUpdate.jsp">내 정보수정</a>
					</button></li>
				<li><button id="join"
						style="background: #FD7200; width: 150px; margin-right: 400px;">
						<a href="#">주문표</a>
					</button></li>
			</ul>
		</nav>
		<%
			}
		%>






	</header>
<div class="clear"></div>
<%
	String ShopId = (String)request.getAttribute("ShopId");
%>
<header class="head"><p class="normal" style="color:white; font-weight:bold; font-size:25px">&nbsp;&nbsp;메뉴의 정보를 기입해주세요</p></header>

<form action="mboardInsert.do" method="get">
			<ul>
				<li>
					<input type="text" name="MBoardID" placeholder="MBoardID" required><br><br>
				</li>
				<li>
					<input type="text" name="ShopId" readonly value=<%=ShopId %> required><br><br>
				</li>
				<li>
					<input type="submit" value="추가" ><br>
				</li>
			</ul>
		</form>
	</div>
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
	<p style="font-weight:bold; font-size:15px;">(용인)딜리버리히어로 유니버시티.</P>
	<P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX: 031-332-6479</p>
	<p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 : partnership@deliveryhero.co.kr|고객만족센터 : support@yogiyo.co.kr|호스트서비스사업자 : (주)심플렉스인터넷</p>
</footer>
</body>
</html>