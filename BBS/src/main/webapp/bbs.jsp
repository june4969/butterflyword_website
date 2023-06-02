<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css"> 
	<title>JSP</title>
	   <style type="text/css">
	        a, a:hover {
	            color: #000000;
	            text-decoration: none; /* 밑줄 없애기 */
	        }
    	</style>

</head>
<body>
	 
	 <% 
		 String userID = null;
		 
	     if (session.getAttribute("userID") != null) {
	         userID = (String) session.getAttribute("userID");
	     }
	
	     int pageNumber = 1; //기본 페이지 1로 설정
	         
	     if (request.getParameter("pageNumber") != null) {
	         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
  	<div class="collapse navbar-collapse id="bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav">
  			<li><a href="main.jsp">메인</a></li>
  			<li class="active"><a href="bbs.jsp">게시판</a></li>
  		</ul>
  		<%
  			if(userID == null ){
  				
  			
  		%>
  		<ul class="nav navbar-nav navbar-right">
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle" 
	  				data-toggle="dropdown" role="button" aria-haspopup="true"
	  				aria-expanded="false">접속하기<span class="caret"></span></a>
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
  	<div class="row">
  		<table class="table table-striped" style="text-align: ceneter; border: 1px solid #dddddd">
  			<thead>
  				<tr>
  					<th style ="background-color: #eeeeee; text-align: center;">번호</th>
  					<th style ="background-color: #eeeeee; text-align: center;">제목</th>
  					<th style ="background-color: #eeeeee; text-align: center;">작성자</th>
  					<th style ="background-color: #eeeeee; text-align: center;">작성일</th>
  					
  				</tr>
  				
  				
  			</thead>
  			
  			<tbody>
  			

  					<%
                        BbsDAO bbsDAO = new BbsDAO();
                        ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                        for (int i = 0; i < list.size(); i++) {
                    %>
                    <tr style ="text-align: center;" >
                        <td><%=list.get(i).getBbsID()%></td>
                        <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
                        <td><%=list.get(i).getUserID()%></td>
                        <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
                    </tr>
                    
                    <%
                        }
                    %>
  			</tbody>
  		
  		
  		
  		</table>
  		
  		 <%
                if (pageNumber != 1) {    //현재 페이지가 1이 아니라면
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left" style="margin:5px;">이전</a>
            <%
                }    if (bbsDAO.nextPage(pageNumber)) {    //다음 페이지가 존재할 경우
 
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left" style="margin:5px;">다음</a>
            <%
                }
            %>
            
            <div class="col float-right">                
                 <div class="dropdown actionButtons float-right">
                     <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
                   </div>
            </div>
        </div>
    </div>
 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
 
</body>
</html>
