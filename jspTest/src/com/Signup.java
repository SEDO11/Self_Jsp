package com;

import java.sql.*;

public class Signup {
	
	private String dbURL = "jdbc:mysql://localhost:3306/web_sns";
	private String dbID = "root";
	private String dbPW = "0000";
	
	public int signup(String id, String pw1, String pw2, String name) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
		int check = 0;
		
		if(idCheck(id) == 1) {
			return 2; // 중복 아이디 발견
		}
		
		if(pwCheck(pw1, pw2) == 1) {
			return 3; // 비밀번호 불 일치
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPW);
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, pw1);
            stmt.setString(3, name);
            
            int count = stmt.executeUpdate();
            if (count == 0) {
            	check = 1;
            }
		} catch (Exception e) {
			System.out.println("에러: " + e);
			check = 1;
		} finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		return check;
	}
	
	public int withdraw(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM user WHERE id = ?";
		int check = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPW);
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            
            int count = stmt.executeUpdate();
            if(count == 0) {
            	check = 1;
            }
		} catch(Exception e) {
			System.out.println("에러: " + e);
			check = 1;
		} finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		return check;
	}
	
	public int idCheck(String id) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM user";
		int check = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				if(id.equals(rs.getString("id"))) {
					check = 1;
					break;
				}
			}
			
			
		} catch (Exception e) {
			System.out.println("에러발생");
			System.out.println(e);
			
		} finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		return check;
	}
	
	public int pwCheck(String pw1, String pw2) {
		int check = 1;
		if(pw1.equals(pw2)) {
			check = 0;
		}
		
		return check;
	}
}
