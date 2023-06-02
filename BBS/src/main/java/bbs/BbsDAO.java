package bbs;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
 
public class BbsDAO {
    
    private Connection conn;
  
    private ResultSet rs;
 
    public BbsDAO() {
        try {
 
            String dbURL = "jdbc:mysql://127.0.0.1:3306/BBS?autoReconnect=true&amp&serverTimezone=UTC";
            String dbID = "root";
            String dbPassword = "root";
 
            Class.forName("com.mysql.cj.jdbc.Driver");
 
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
 
        } catch (Exception e) {
 
            e.printStackTrace(); 
        }
 
    }

	/* 현재의 시간을 가져오는 함수 */
    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); /* 실행준비문장으로 만듦 */
            rs = pstmt.executeQuery();
			if (rs.next()) { /* 결과가 있는 경우 현재 날짜 반환 */
                return rs.getString(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
		return ""; /* db오류를 알려줌 */
    }
    
    public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC"; /* 내림차순에서 마지막 글 가져옴 */
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) +1;
            }
            return 1; //현재 게시물이 첫번째인 경우
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return -1; // db오류발생시 -1 반환 
    }
    
    public int write(String bbsTitle, String userID, String bbsContent) {
        String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)"; 
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            //하나씩 값 넣어주기
            pstmt.setInt(1, getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1); //글이 보여지는 형태니 1을 넣어줌
            return pstmt.executeUpdate();
 
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return -1; // db오류
    }
    
    public ArrayList<Bbs> getList(int pageNumber){ 
    	 
        String SQL = "SELECT * FROM BBS WHERE bbsID < ?  AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
 
        ArrayList<Bbs> list = new ArrayList<Bbs>();
 
        try {
 
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
 
                Bbs bbs = new Bbs();
 
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                list.add(bbs);
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return list; 
 
    }
    
    public boolean nextPage (int pageNumber) {
    	 
        String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
        
        try {
 
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
 
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                return true;
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return false;         
    }
    
//    게시글 보기
	public Bbs getBbs(int bbsID) {
	        
	        String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
	        
	        try {
	 
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, bbsID);
	 
	            rs = pstmt.executeQuery();
	 
	            if (rs.next()) {
	                
	                Bbs bbs = new Bbs();
	 
	                bbs.setBbsID(rs.getInt(1));
	                bbs.setBbsTitle(rs.getString(2));
	                bbs.setUserID(rs.getString(3));
	                bbs.setBbsDate(rs.getString(4));
	                bbs.setBbsContent(rs.getString(5));
	                bbs.setBbsAvailable(rs.getInt(6));
	                
	                return bbs;
	            }
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	 
	        return null;     
	    }
	
	
	//글 수정
	public int update(int bbsID, String bbsTitle, String bbsContent) {
	        
	        String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, bbsTitle);
	            pstmt.setString(2, bbsContent);
	            pstmt.setInt(3, bbsID);
	            return pstmt.executeUpdate();
	 
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        return -1; // db오류
	    }
	    
	
	// 글 삭제
	public int delete(int bbsID) {
	        
	        String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, bbsID);
	            return pstmt.executeUpdate();
	 
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        return -1; // db오류
	    }


    
    
}
 