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
         text-align: right;
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
      border-color:black;
      color:white;
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
            <li><button id="join" style="width: 100px;">
                  <a href="logoutProc.jsp">로그아웃</a>
               </button></li>
            <li><button id="join" style="width: 100px;">
                  <a href="myinfor.jsp">마이 요기요</a>
               </button></li>
            <li><button id="join"
                  style="background: #FD7200; width: 150px; margin-right: 400px;">
                  <a href="orderList.jsp">주문표</a>
               </button></li>
         </ul>
      </nav>
      <%
         }
      %>
   </header>

<div class="clear"></div>
<!--<div class="infor">
  <header class="head"><p class="normal" style="color:white; font-weight:bold; font-size:25px">&nbsp;&nbsp;자주 사용하는 주소 목록</p></header>
   </div> -->
<!--<div class="infor">
<header class="head"><p class="normal" style="color:white; font-weight:bold; font-size:25px">&nbsp;&nbsp;이전에 주문했던 목록</p></header>
   </div> -->
   <div class="infor">
<header class="head"><p class="normal" style="color:white; font-weight:bold; font-size:25px; margin-bottom:30px;">&nbsp;&nbsp;쿠폰함</p></header>
   <table width = "50%" border = "1" align="left">
   <tr>
            <td>쿠폰이름</td>
            <td>할인</td>
      </tr>
      <% 
      String id = (String)session.getAttribute("id");

      String sql ="Select * from coupon WHERE CustomerId =?";


     Connection conn = null;
     conn = DBConnection.getConnection();

     PreparedStatement pstmt = conn.prepareStatement(sql);
     ResultSet rs = null;

     pstmt.setString(1, id);
     rs = pstmt.executeQuery();
   
   while(rs.next())
   {
   %>
    <tr>
     <td><%= rs.getString(1) %></td>
     <td><%= rs.getString(3) %></td>
   </tr>
   
   <%
   }
   rs.close();
   pstmt.close();
   %>
   </table>
   </div>
   <div class="infor">
<header class="head"><p class="normal" style="color:white;font-weight:bold; font-size:25px">&nbsp;&nbsp;리뷰 관리</p></header>
   <table width = "90%" border = "1" align="left" style="margin-top:30px;">
   <tr>
         <td>음식점</td>
            <td>내용</td>
            <td>평점</td>
            <td>일자</td>
            <td>리뷰 삭제</td>
      </tr>
       <% 

      String sql3 ="Select * from review WHERE CustomerId =?";

     conn = DBConnection.getConnection();

     pstmt = conn.prepareStatement(sql3);
     pstmt.setString(1, id);
     ResultSet rs3 = pstmt.executeQuery();
   
   while(rs3.next())
   {
   %>
    <tr>
     <td><%= rs3.getString(2) %></td>
     <td><%= rs3.getString(4) %></td>
    <td><%= rs3.getString(6) %></td>
     <td><%= rs3.getString(5) %></td>
     <td>
     <form action="deleteReview.do">
	<input type="hidden" name="ReviewId" value="<%=rs3.getInt(1) %>">
	<input type="submit" value="리뷰삭제">
	</form>
     </td>
   </tr>
   
   <%
   }
   rs.close();
   pstmt.close();
   %>
   </table>
   </div> 
   <div class="infor">
<header class="head"><p style="color:white; font-weight:bold; font-size:25px">&nbsp;&nbsp; 포인트 </p></header>
<ol class="mylist">
   <li><p class="normal" style="border-bottom:2px dotted black">보유포인트</p> </li><br><br>
   <li><p class="normal" style="border-bottom:2px dotted black">포인트사용목록</p> </li>
   </ol>
   </div>
   <div class="infor" style="height:450px;">
<header class="head"><p class="normal" style="color:white; font-weight:bold; font-size:25px">&nbsp;&nbsp;정보변경</p></header>

<%   
   
   String sql2 ="Select * from customer WHERE CustomerId =?";


   conn = DBConnection.getConnection();

   pstmt = conn.prepareStatement(sql2);
   pstmt.setString(1, id);
   ResultSet rs2 = pstmt.executeQuery();

   
   
   
%>
<%
   while(rs2.next()){

      
%>
<div class="container">
      <ol class="mylist">
      <li><p class="normal" style="border-bottom:2px dotted black">회원정보수정</p> </li><br><br>
      </ol>

         <form action="customerUpdate.do" method="get">
         &nbsp;&nbsp;아이디&nbsp;:&nbsp;&nbsp;&nbsp;<input type="text" readonly value=<%= rs2.getString(1) %> name="CustomerId">
         비밀번호 : <input type="text" value=<%= rs2.getString(2) %> name="password"><br><br>
         &nbsp;&nbsp;이&nbsp;&nbsp;름&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%= rs2.getString(3) %> name="name">
         전화번호 : <input type="text" value=<%= rs2.getString(4) %> name="tel"><br><br>
         &nbsp;&nbsp;주&nbsp;&nbsp;소&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%= rs2.getString(5) %> name="address"><br><br><br>
         <input type="submit" value="정보 수정">
         </form>
         <form action="customerDelete.do">
         <input type="submit" value="회원탈퇴">
         </form>
      
         </div>
   <%
   }
  %>
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