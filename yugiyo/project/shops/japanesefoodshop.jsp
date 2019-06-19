<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="shop.service.ShopService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/shops.css">
<style type="text/css">
	.restaurant-title{
	padding: 10px;
    font-size: 110%;
    border-bottom: 1px solid #d9d9d9;
}
.restaurant-content {
    position: relative;
    padding: 10px;
}
	}
</style>
<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 220px;
  font-size: 17px;
  width: 25%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: black;
  display: none;
  padding: 100px 20px;
  height: 100%;
}
</style>
</head>
<body>
<header class="login">
		<nav>
			<ul>
				<a href="../index.jsp" style="margin-right: 600px;"><img
					src="../image/logo1.png" width="7%"></a>
				<li><button id="join">
						<a href="index.jsp">로그아웃</a>
					</button></li>
				<li><button id="join">
						<a href="myinfor.jsp">마이 요기요</a>
					</button></li>
				<li><button id="join"
						style="background: #FD7200; width: 150px; margin-right: 400px;">
						<a href="../orderList.jsp">주문표</a>
					</button></li>
			</ul>
		</nav>
	</header>
	<div class="clear"></div>
	<header class="Brand">
		<div class="menubar">
			<ul>
				<li><a href="../foods/allmenu.jsp">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/1person.jsp">1인분주문&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/franchise.jsp">프랜 차이즈&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/basedfood.jsp">분식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/pizza.jsp">피자&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/chicken.jsp">치킨&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/foot.jsp">족발/보쌈&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/nightfood.jsp">야식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/koreanfood.jsp">한식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/chinesefood.jsp">중국집&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a class="active" href="../foods/japanesefood.jsp">일식/돈까스&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="../foods/cafe.jsp">카페/디저트&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</ul>
		</div>
	</header>
<%
	String name = request.getParameter("name");
	ShopService service = ShopService.getInstance();
	ResultSet rs = service.selectByName(name);
	
	String ShopId = null;
	int rank = 0;
	int reqprice = 0;
	String payment = null;
	String address = null;
	String tel = null;
	String availTime = null;
	
	while(rs.next()){
	ShopId = rs.getString(1);
	rank = rs.getInt(10);
	reqprice = rs.getInt(4);
	payment = rs.getString(5);
	address = rs.getString(8);
	tel = rs.getString(7);
	availTime = rs.getString(9);
	}
	
%>

<div>
<div class="restaurant-title">
        <span class="restaurant-name ng-binding" ng-bind="restaurant.name"><%=name %></span>
        
</div>

<div class="restaurant-content">
        <ul>
        	<li>평점:<%=rank %> </li><br>
        	<li>최소 주문 금액:<%=reqprice %> </li><br>
        	<li>결제 방법:<%=payment %> </li><br>
        </ul>
      </div>
</div>
<button class="tablink" onclick="openPage('Home', this, 'black')"id="defaultOpen" >메뉴</button>
<button class="tablink" onclick="openPage('News', this, 'black')" >리뷰</button>
<button class="tablink" onclick="openPage('Contact', this, 'black')">정보</button>
<!-- 메뉴 -->
<div id="Home" class="tabcontent">
<%
Connection conn = null;
conn = DBConnection.getConnection();

System.out.println(ShopId);

String sql2 ="SELECT MBoardId FROM menuBoard WHERE ShopId= ? ";

String sql ="SELECT DISTINCT menu.name, menu.price,menu.MenuID FROM menu,menuBoard,shop WHERE menuBoard.MBoardID = menu.MBoardID and menu.MBoardID=? and menuBoard.ShopId=?"; 
String menuBoardId =null;

PreparedStatement pstmt = conn.prepareStatement(sql2);
pstmt.setString(1, ShopId);
ResultSet rs2 = pstmt.executeQuery();
	 
while(rs2.next()){
	menuBoardId = rs2.getString(1);
	}
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, menuBoardId);
pstmt.setString(2, ShopId );
rs2 = pstmt.executeQuery();


%><p>
	<table border="1" cellspacing="0" style="background-color:white; border-color:white;">
		<tr style="background-color:red; color:white;">
			<th>메뉴 이름</th>
			<th>가격</th>
			<th>수량</th>
			<th>확인</th>
		</tr>
			
		<%
			while (rs2.next()) {
		%>
		<tr>
			<td><%=rs2.getString(1)%></td>
			<td><%=rs2.getInt(2)%></td>

			<form action="orderListAdd.do" method="get">
					<input type="hidden" name="MenuID" value="<%=rs2.getString(3)%>">
					<td>수량 : <input type="text" name="quantity"></td>
					<td><button type="submit" style="background-color:orange;border-radius: 5px;border-color: white;color: white;
					border: none;padding-left: 10px;padding-right: 10px;">담기</button></td>
			</form>

		</tr>
		<%
			}
		%>
	</table>
	<%
		rs.close();
		rs2.close();
	%>
  </p>
</div>
<!-- 리뷰 -->
<div id="News" class="tabcontent">
<%

String sql3 ="SELECT RBoardId FROM reviewBoard WHERE ShopId= ? ";

String sql4 ="SELECT DISTINCT review.ReviewId, review.CustomerId,review.detail,review.date,review.reputation FROM review,reviewBoard,shop WHERE reviewBoard.RBoardID = review.RBoardID and reviewBoard.RBoardID=? and reviewBoard.ShopId=?;"; 
String reviewBoardId =null;

pstmt = conn.prepareStatement(sql3);
pstmt.setString(1, ShopId);
ResultSet rs3 = pstmt.executeQuery();
	 
while(rs3.next()){
	reviewBoardId = rs3.getString(1);
	}
pstmt = conn.prepareStatement(sql4);
pstmt.setString(1, reviewBoardId);
pstmt.setString(2, ShopId );
rs3 = pstmt.executeQuery();


%>
<form action="writeReview.do">
	<input type="hidden" name="RBoardID" value="<%=reviewBoardId%>">
	내용:<input type="text" name="detail">
	평점:<input type="text" name="rank">
	<input type="submit" value="쓰기">
</form>
<p>
	<table border="1" cellspacing="0" style="margin-left:100px; margin-top:100px; width:700px; background-color:white;">
		<tr>
			<th>리뷰 번호</th>
			<th>게시자</th>
			<th>내용</th>
			<th>날짜</th>
			<th>평점</th>
		</tr>
			
		<%
			while (rs3.next()) {
		%>
		<tr>
			<td><%=rs3.getInt(1) %></td>
			<td><%=rs3.getString(2) %></td>
			<td><%=rs3.getString(3) %></td>
			<td><%=rs3.getDate(4)  %></td>
			<td><%=rs3.getInt(5)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		rs.close();
		rs2.close();
	%>
  </p>
</div>
<!-- 정보 -->
<div id="Contact" class="tabcontent">
 <p style="border-bottom:1px dotted black;background-color:white; font-size:20px;">최소 주문 금액</p><br> <%=reqprice%>원
  <p style="border-bottom:1px dotted black;background-color:white; font-size:20px;"> 결제방식</p><br> <%=payment %>
  
  <p style="border-bottom:1px dotted black; background-color:white; font-size:20px;"> 전화번호</p><br> <%=tel %>
  <p style="border-bottom:1px dotted black;background-color:white; font-size:20px;"> 주소</p><br> <%=address %>
  <p style="border-bottom:1px dotted black;background-color:white; font-size:20px;"> 영업시간</p><br><%=availTime %>
</div>

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
		<p style="font-weight: bold; font-size: 15px;">(용인)딜리버리히어로 유니버시티.</P>
		<P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX:
			031-332-6479</p>
		<p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 :
			partnership@deliveryhero.co.kr|고객만족센터 :
			support@yogiyo.co.kr|호스트서비스사업자 : (주)심플렉스인터넷</p>
	</footer>
<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</body>
</html>