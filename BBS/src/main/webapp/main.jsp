<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> 
<title>나비 월드</title>
<style>
    .item {
        max-width: 100%;
        max-height: auto; /* 원하는 높이로 조정하세요 */
        margin: 0 auto;
    }
    
    .item img {
        width: 100%;
        height: auto;
    }
</style>




</head>
<body>
	 
	 <% 
	 	String userID = null;
	 	if (session.getAttribute("userID") != null){
	 		userID = (String) session.getAttribute("userID");
	 	}
	 %>


  <nav class="navbar navbar-default">
  	<div class="navbar-header">
  		<button type="button" class="navbar-toggle collapsed"
  			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
  			aria-expanded="false">
  			<span class="icon-bar"></span>	
  			<span class="icon-bar"></span>	
  			<span class="icon-bar"></span>	
  		</button>
  		<a class="navbar-brand" href="main.jsp">나비 월드</a>
  	</div>
  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav">
  			<li class="active"><a href="main.jsp">메인</a></li>
  			<li><a href="bbs.jsp">게시판</a></li>
  		</ul>
  		<%
  			if(userID == null ){
  		%>
  		<ul class="nav navbar-nav navbar-right">
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle" 
	  				data-toggle="dropdown" role="button" aria-haspopup="true"
	  				aria-expanded="false">Log in<span class="caret"></span></a>
  				<ul class="dropdown-menu">
  				
  				<!-- active는 현재 선택이 되었다는 것을 의미한다 -->
  				  <li><a href="login.jsp">로그인</a></li>
  				  <li><a href="join.jsp">회원가입</a></li>
  				</ul>
  			</li>
  		</ul>
  		<%
  			} else {
  		%>
  		<ul class="nav navbar-nav navbar-right">
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle" 
	  				data-toggle="dropdown" role="button" aria-haspopup="true"
	  				aria-expanded="false">회원관리<span class="caret"></span></a>
  				<ul class="dropdown-menu">
  				  <li><a href="logoutAction.jsp">로그아웃</a></li>
  				</ul>
  			</li>
  		</ul>
  		<%
  			}
  		%>
  	</div>
  </nav>
  
  <div class="container">
  	<div class="jumbotron">
  		<div class="container">
  			<h1>웹 사이트 소개</h1>
  			<p>국내,해외에 존재하는 나비에 대한 이야기를 나눌 수 있는 공간</p>
  			<p><a class="btn btn-primary btn-pull" href="#">게시글을 올려보세요!</a></p>
  		</div>
  	</div>
  </div>
 
 <div class="container"> 
 	<div id="myCarousel" class="carousel slide" data-ride="carousel">
 		<ol class="carousel-indicators">
 			<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
 			<li data-target="#myCarousel" data-slide-to="2"></li>
 		</ol>
 		
 		<div class="carousel-inner">
 			<div class="item active">
 				<img src="images/1.jpg">
 			</div>
 			
 			<div class="item">
 				<img src="images/2.jpg">
 			</div>
 		</div>
 		
 		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
 			<span class="glyphicon glyphicon-chevron-left"></span>
 		</a>
 		<a class="right carousel-control" href="#myCarousel" data-slide="next">
 			<span class="glyphicon glyphicon-chevron-right"></span>
 		</a>	
  	</div>
 </div>

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>