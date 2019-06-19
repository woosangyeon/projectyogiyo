<%@page import="java.sql.ResultSet"%>
<%@page import="shop.service.ShopService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>혼밥 배달전문 용인점</title>
<style>
body {
   background: #F2F2F2;
}
table {
   margin-left:350px;
   height:300px;
   width:800px;
   margin-top:50px;
   margin-bottom:50px;

}
thead   {
background-color:#ccddee;
}
tfoot   {
background-color:#ccddee;
}
tr   {
   text-align:center;

}
#join {
   margin-top: 10px;
   margin-bottom: 10px;
   width: 100px;
   height: 50px;
   color: white;
   background: #EC1616;
   border: 1px white outset;
   font-size: 1.0em;
}

.Brand {
   border-bottom: 1px solid;
   border-color: #black;
   margin-bottom: 20px;
   font-size: 20px;
   padding-right: 100px;
   text-align: left;
   margin-right: 50px;
   background-color: white;
}

.login {
   background: #EC1616;
   text-align: right;
   font-size: 15px;
   z-index: 1;
}

.news {
   text-align: center;
   font-size: 15px;
   z-index: 1;
   border: 1px solid;
   border-color: #cccccc;
}

.Brandimage {
   width: 100%;
   height: 180px;
   float: left;
   margin-left: 650px;
}


.backimage {
   background-image: url('image/back.png');
   background-repeat: no-repeat;
   background-size: cover;
}

section {
   margin-top: 20px;
   width: 70%;
   height: 150px;
   float: left;
   margin-left: 350px;
}

article {
   width: 40%;
   height: 100%;
   margin-left: 20px;
   border: solid 1px #cccccc;
   float: left;
}

.clear {
   clear: both;
}

footer {
   border: 1px solid;
   border-color: #cccccc;
   padding: 10px;
   padding-right: 50px;
   color: black;
   text-align: right;
   font-size: 12px;
}

ul {
   list-style-type: none;
}

ul li {
   display: inline;
   text-align: right;
}

ul li a {
   color: white;
   text-decoration: none;
}

.news ul li a {
   color: #848484;
}

.menu a {
   cursor: pointer;
}

.menu .hide {
   display: none;
}

.menubar {
   border: none;
   border: 0px;
   margin-left: 100px;
   padding: 0px;
   font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
      "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
      sans-serif;
   font-size: 15px;
}

.menubar ul {
   height: 40px;
   list-style: none;
   margin: 0;
   padding: 0;
}

.menubar li {
   float: left;
   padding: 0px;
}

.menubar ul li a {
   color: black;
   text-decoration: none;
}

.menubar li a {
   display: inline-block;
   text-align: center;
   text-decoration: none;
   line-height: 50px;
   margin: 0px;
   padding: 0px 15px;
}

.menubar li a:hover, .menubar ul li:hover a {
   color: #ccc;
   text-decoration: none;
}

.menubar a.active {
   background-color: black;
   color: white;
   display: inline-block;
   line-height: 40px;
}

.menubar li li {
   display: block;
   background-color: black;
   border: 0.5px dotted #ccc;
   text-align: left;
   float: none;
   margin: 0px;
   padding: 5px;
   font-size: 15px;
}

.menubar li ul a {
   display: block;
   height: 50px;
   font-size: 10px;
   font-style: normal;
   margin: 0px;
   padding: 0px 10px 0px 15px;
   text-align: left;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
   border: 0px;
   color: #ccc;
   background-color: #ccc;
   text-decoration: none;
}

input[type="text"] {
   width: 400px;
   height: 40px;
   border-radius: 5px;
   border-color: white;
}

input[type="submit"] {
   height: 45px;
   background-color: orange;
   border-radius: 5px;
   border-color: white;
   color: white;
   border: none;
   padding-left: 10px;
   padding-right: 10px;
}

h3 {
   text-align: center;
   font-weight: lighter;
   color: white;
}

h1 {
   font-family: '바탕';
   padding-top: 100px;
   text-align: center;
   color: white;
}
#footalign   {
   text-align:left;
   
}
</style>

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
            <li><a class="active" href="allmenu.jsp">전체보기&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="1person.jsp">1인분주문&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="franchise.jsp">프랜 차이즈&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="basedfood.jsp">분식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pizza.jsp">피자&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="chicken.jsp">치킨&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="foot.jsp">족발/보쌈&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="nightfood.jsp">야식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="koreanfood.jsp">한식&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="chinesefood.jsp">중국집&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="japanesefood.jsp">일식/돈까스&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="cafe.jsp">카페/디저트&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         </ul>
      </div>
   </header>
<div class="clear"></div>
<table border="1" cellspacing="0">
<thead>
<tr height="100px;">
   <td onclick="window.location='1person1.jsp'">메뉴</td>
   <td onclick="window.location='1person1review.jsp'">리뷰</td>
   </tr>
   </thead>
   <tr height="50px;">
         <th colspan="2"><img src="image/?" width="150px" height="100px"></th>
         
      </tr>
      <form action="*.do">
      <tr height="50px;">
         <td colspan="2">김치찌개 8000원</td>
         
         
         </tr>
         <tr height="50px;">
            <td colspan="2"><input type="submit" value="주문추가"></td>
            
            </tr>
         </form>
         <form action="*.do">
      <tr height="50px;">
         <td colspan="2">고추장찌개 7000원</td>
         
         
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="주문추가"></td>
            </tr>
         </form>
         <form action="*.do">
      <tr height="50px;">
         <td colspan="2">수육국밥 8000원</td>
         
         
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="주문추가"></td>
            </tr>
            </form>
            <form action = "*.do">
            <tfoot>
            <tr>
            <td colspan="2" id="footalign">&nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit" value="주문하기"></td>
            <tr>
            </form>