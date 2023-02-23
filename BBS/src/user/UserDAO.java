package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc::mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPW = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPassword FROM USER WHERE = ?";
		try {
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, userID);
			rs = stmt.executeQuery();
			// 입력된 아이디가 있는 경우
			if(rs.next()) {
				// 비밀번호가 일치하는 경우
				if(rs.getString(1).equals(userPW)) {
					return 1; // 로그인 성공
				}
			} else { // 비밀번호가 틀린경우
				return 0;
			}
			return -1; // 아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}

}
