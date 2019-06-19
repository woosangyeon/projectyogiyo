<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 결과</title>	
<style>
		body{
			background:#F2F2F2;
		}
		#join {
			margin-top: 10px;
			margin-bottom: 10px;
			width:80px;
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
			text-align: right;
		}
		ul li a{
			color:white;
			text-decoration: none;
		}
		.news ul li a{
			color:#848484;
		}
		input[type="text"]{
		width: 400px;
		height: 40px;
		border-radius:5px;
		border-color:white;
		}
		input[type="submit"]{
		height: 45px;
		background-color: orange;
		border-radius:5px;
		border-color:white;
		color:white;
		border:none;
		padding-left:10px;
		padding-right:10px;
		}
		h3{
		text-align:center;
		font-weight:lighter;
		color:white;
		}
		h1{
		font-family:'바탕';
		padding-top:100px;
		text-align:center;
		color:white;
		}
	</style>
</head>
<body>

<header class="login">
	<nav>
	<ul>
		<a href="index.jsp" style="margin-right:600px;"><img src="image/logo1.png" width="7%"></a>
		<li><button id="join"><a href="loginform.jsp">로그인</a></button></li>
		<li><button id="join"><a href="registerform.jsp">회원가입</a></button></li>
		<li><button id="join" style="background:#FD7200; width:150px; margin-right:400px;"><a href="#">주문표</a></button></li>
	</ul>
	</nav>
</header>


 <h1 style="color: black;">뭔가 잘못된 거 같아요!</h1>
            <br>
            <div>
            <h4>DB 연동 중 오류가 발생하여 추가에 실패했습니다. 다시 시도해주세요</h4>
         <form action="addmenu.jsp">
			<button id="join" type="submit" style="margin-left: 37%; width: 500px;">다시 시도</button>					
		</form>
		<form action="loginadmin.jsp">
			<button id="join" type="submit" style="margin-left: 37%; width: 500px;">메인으로</button>					
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