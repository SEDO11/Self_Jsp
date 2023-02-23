package dao;

import java.sql.*;
import java.sql.SQLException;
import javax.naming.NamingException;

public class UserDAO {
	public boolean exists(String id) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			return rs.next();
			
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean insert(String id, String pw, String name) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			stmt.setString(3, name);
			
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean delete(String id, String upw) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "DELETE FROM user WHERE id = ? AND password = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, upw);
			
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
	
	public int login(String id, String upw) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			if(!rs.next()) return 1; // 아이디가 없는 경우
			if(!upw.equals(rs.getString("password"))) return 2; // 비밀번호가 일치하지 않는 경우
			return 0; // 로그인
		} finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
	}
}
