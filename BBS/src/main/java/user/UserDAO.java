package user;

//로그인 기능 구현

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//JSP에서 회원 데이터베이스 테이블에 접근할 수 있도록 생성한다.
//DAO = Data Access Object, 실질적으로 데이터베이스에서 회원정보를 관리, 처리할때 사용
public class UserDAO {

	
	private Connection conn; 
	//DB에 접근하게 해주는 객체
	
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	//정보를 담을 객체
	
	public UserDAO() //객체생성
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/BBS"; 
			//localhost의 MySQL 3306포트 BBS라는 DB 접속 경로를 dbURL에 저장.
			//로컬호스트는 본인 주소
			
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver"); 
			 //드라이버는 MySQL에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리, JDBC 드라이버 로드
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			//DB 접속되면 conn 객체에 접속정보가 저장됨.
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	// 위 코드까지가 MySQL DB에 접근할 수 있도록 설정하는 과정
    
    //로그인 영역
	public int login(String userID, String userPassword) 
	{
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        //각 userID에 해당하는 userPassword를 조회하는 쿼리
		
		
        try
		{
			pstmt = conn.prepareStatement(SQL); //sql 쿼리문을 대기 시킨다
			pstmt.setString(1, userID);  //위의 SQL 쿼리 ?에 조회할 userID적용, 첫번째 ?에 매개변수로 받아온 ID 대입
			rs = pstmt.executeQuery(); //쿼리의 실행 결과를 rs 객체에 저장
            
			if(rs.next()) //rs에 결과가 존재한다면
			{
				if(rs.getString(1).equals(userPassword)) 
				  //MySQL DB의 userPassword와 로그인 시도한 userPassword와 일치하면
				{
					return 1; //로그인 성공
				}
				else
					return 0; //로그인 실패(비밀번호 틀림)					
			}
			return -1; //아이디가 없음  userID=?부분 확인
            
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
}