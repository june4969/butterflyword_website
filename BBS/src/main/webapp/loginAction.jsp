<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %><!--  우리가 만든거 사용 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트문을 작성하기 위해 사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 모든 데이터를 UTF-8로 받음 -->


<!-- 자바 빈즈 사용 -->
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- scope => 현재의 페이지에서만 빈즈 사용 -->
<jsp:setProperty name="user" property="userID" /> <!-- 로그인 페이지에서 넘어온 아이디를 받아서 한명의 사용자의 userID에 넣어줌 -->
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
</head>

<!-- login.jsp에서 사용자가 입력한 아이디와 비밀번호를 전달받아 UserDAO의 login 함수를 실행하여 MySQL DB 조회 결과를 loginAction.jsp 페이지에서 보여준다. -->
<body>
	<%
		UserDAO userDAO = new UserDAO();
		/* 로그인 시도 */
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); 
		 /* login 페이지에서 ID, Password 입력된 값으로 넘어와서 login함수에 넣어서 실행
		 -2(데이터베이스 오류), -1(아이디가 없음), 0(로그인 실패), 1(로그인 성공)이 저장*/
		 
		 if(result == 1) /* 로그인 성공 */
		 {  //DB와 userID,userPassword가 일치하면 main.jsp페이지로 이동.
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("location.href = 'main.jsp'"); /* 메인으로 이동 */
			 script.println("</script>"); 
		 }
		 
		 else if(result == 0)
		 {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('비밀번호가 틀립니다.')");
			 script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
			 script.println("</script>");
		 }
		 
		 
		 else if(result == -1)
		 {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('존재하지 않는 아이디입니다')");
			 script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
			 script.println("</script>");
		 }
		 
		 else if(result == -1)
		 {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('데이터베이스 오류가 발생했습니다')");
			 script.println("history.back()"); //이전 페이지로 돌려보냄(login 페이지)
			 script.println("</script>");
		 }
	%>
</body>
</html>