<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import = "java.sql.ResultSet"
	import = "java.sql.Statement"
	import = "java.sql.Connection"
	import = "java.sql.DriverManager"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>홈 화면</title>
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
			margin-top: 100px;
			width:70%;
			height: 200px;
			float: left;
			margin-left: 350px;
			margin-bottom: 200px;
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
		h2{
		font-family:'굴림';
		padding-top:100px;
		text-align:center;
		color:black;
		}
		table{
		background-color:white;
		}
	</style>

</head>
<body>
	
<header class="login">
	<nav>
	<ul>
		<a href="index.jsp" style="margin-right:600px;"><img src="image/logo1.png" width="7%"></a>
		<li><button id="join"><a href="index.jsp">로그아웃</a></button></li>
		<li><button id="join"><a href="myinfor.jsp">마이 요기요</a></button></li>
		<li><button id="join" style="background:#FD7200; width:150px; margin-right:400px;"><a href="#">주문표</a></button></li>
	</ul>
	</nav>
</header>
<div class="clear"></div>
<div class="backimage" style="height:300px;">
<h1>"어디로 <span style="color:orange;">배달</span> 해드릴까요?"</h1>
<h3>배달 받으실  동 이름을 검색해주세요.</h3>
<input type="text" style="margin-left:725px; margin-top:0px;">
<input type="submit" value="검색">
</div>
<div class="clear"></div>
<div class="body">
<h2> 회원목록</h2>
<table width = "50%" border = "1" align="center">
	<tr>
            <td>아이디</td>
            <td>패스워드</td>
            <td>이름</td>
            <td>전화번호</td>
      </tr>
<% 

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null; // DBMS와 Java연결객체
	Statement stmt = null; // SQL구문을 실행
	ResultSet rs = null; // SQL구문의 실행결과를 저장


	conn = DriverManager.getConnection("jdbc:mysql://localhost/yugiyo?serverTimezone=UTC","root","cs1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select CustomerId,password,name,tel from customer");
	
	while(rs.next())
	{
	%>
	 <tr>
     <td><%= rs.getString("CustomerId") %></td>
     <td><%= rs.getString("password") %></td>
     <td><%= rs.getString("name") %></td>
     <td><%= rs.getString("tel") %></td>
	</tr>
	
	<%
	}
	rs.close();
	stmt.close();
	conn.close();
	%>
	</table>
	<form action="loginadmin.jsp" method="post">
	<input type="submit" value="메인페이지" style="margin-top:50px; margin-bottom:50px; margin-left:900px;">
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