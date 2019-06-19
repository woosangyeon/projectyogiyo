<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/shops.css">
</head>
<body>
	<header class="login">
		<%
			if (session.getAttribute("id") == null) // 로그인이 안되었을 때
			{
		%>
		<nav>
			<ul>
				<a href="../index.jsp" style="margin-right: 600px;"><img
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
				<li><button id="join" style="width: 100px;">
						<a href="logoutProc.jsp">로그아웃</a>
					</button></li>
				<li><button id="join" style="width: 100px;">
						<a href="../myinfor.jsp">마이 요기요</a>
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

<%	
	String CustomerId = (String)session.getAttribute("id");
	String sql ="Select orderList.MenuID,orderList.address,orderList.quantity,menu.price, menu.price*orderList.quantity as total,OrderID from orderList, menu where orderList.MenuID = menu.MenuID and orderList.CustomerId =?";


	Connection conn = null;
	conn = DBConnection.getConnection();
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = null;
	
	pstmt.setString(1, CustomerId);
	rs = pstmt.executeQuery();
	
%>
<form action="addAddress.do">
배달지 입력 :<input type="text" name="address">
<input type="submit">
</form>

 <div class="col-25">
    <div class="container" style="height:500px;">
      <h4 style="margin-left:200px;">장바구니 목록 <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i></span></h4>
     	<table border="1" cellspacing="0" style="width:700px; margin-left:200px;">
	<tr>
	<td>메뉴이름</td>
	<td>배달 주소</td>
	<td>수량</td>
	<td>가격</td>
	<td>총합</td>
	<td>상품 삭제</td>
	</tr>
	
	<%
	int total =0;
	while(rs.next()){
		 
	%>
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getInt(3) %></td>
	<td><%=rs.getInt(4) %></td>
	<td><%=rs.getInt(5) %></td>
	<td>
	<form action="deleteOrder.do">
	<input type="hidden" name="OrderID" value="<%=rs.getInt(6)%>">
	<input type="submit" value="삭제">
	</form>
	</td>
	</tr>
	
	<%
	total = total + rs.getInt(5);
	}
	%>
	</table>
	<table border="1" cellspacing="0" style="float:right; margin-right:100px;">
	<tr>
	<td><h2 style="color: black;">총 결제 금액 : <%=total %>원</h2></td>

	<td><form action="purchaseList.do">
	<input type="hidden" name="money" value="<%=total%>">
		<input type="submit" value="결제하기" style="float: right;background-color: orange;
    color: white; padding: 14px 20px;
    margin: 8px 0;">
	</form></td>
	


	
	<%
	rs.close();
	%>
   </table>
    </div>
  </div>



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