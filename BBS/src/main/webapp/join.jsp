<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> 
<title>나비 월드</title>
</head>
<body>
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
  	<div class="collapse navbar-collapse id="#bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav">
  			<li><a href="main.jsp">메인</a></li>
  			<li><a href="bbs.jsp">게시판</a></li>
  		</ul>
  		<ul class="nav navbar-nav navbar-right">
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle" 
	  				data-toggle="dropdown" role="button" aria-haspopup="true"
	  				aria-expanded="false">접속하기<span class="caret"></span></a>
  				<ul class="dropdown-menu">
  				
  				<!-- active는 현재 선택이 되었다는 것을 의미한다 -->
  				  <li><a href="login.jsp">로그인</a></li>
  				  <li  class="active"><a href="join.jsp">회원가입</a></li>
  				</ul>
  			</li>
  		</ul>
  	</div>
  </nav>
  <!-- 하나의 컨테이너 -->
  <div class="container">
  	<div class="col-lg-4"></div>
  	<div class="col-lg-4"> <!-- 로그인 양식 -->
  		<div class="jumbotron" style="padding-top: 20px;">
  			
  			<!-- 회원가입 폼 양식 -->
  			<!-- 메소드 포스트는 회원가입이나 로그인 처럼 어떠한 정보를 숨기면서 보낼때 사용하는 메소드이다 -->
  			<form method="post" action="joinAction.jsp"> <!-- 로그인액션이라는 페이지로 로그인 정보를 보내주겠다는 의미이다 -->
  				<h3 style="text-align: center;">회원가입 화면</h3> 
  				
  				<div class="form-group">
  					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlenth="20"> <!-- 네임은 나중에 서버 프로그램을 작성할 때 사용해서 중요하다 -->
  				</div>
  				
  				<div class="form-group">
  				
  					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlenth="20"> <!-- 유저는 소문자, 패스워드의 P는 대문자 아이디의 I는 대문자 -->
  				</div>
  				
  				<div class="form-group">
  					<input type="text" class="form-control" placeholder="이름" name="userName" maxlenth="20"> 
  				</div>
  				
  				<div class="form-group" style="text-align: center;">
  					<div class="btn-group" data-toggle="buttons">
  						<label class="btn btn-primary active">
  							<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
  						</label>
  						
  						<label class="btn btn-primary active">
  							<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
  						</label>	
  					</div>					
  				</div>
  				
  				<div class="form-group">
  					<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlenth="20"> 
  				</div>
  								
  				<input type="submit" class="btn btn-primary form-control" value="회원가입">
  			</form>
  		</div>
  	</div>
  	<div class="col-lg-4"></div>
  </div>
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>