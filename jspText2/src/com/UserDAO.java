package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

public class UserDAO {
	
	/* 	아이디 중복확인
	 	중복된 아이디가 있으면 0, 중복된 아이디가 없으면 1 */
	private boolean exists(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM user";
		boolean result = true;
		
		try {
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				if(id.equals(rs.getString("id"))) {
					result = false;
				}
			}
		} catch(Exception e) {
			System.out.println("exists 에러: " + e);
		} finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		return result;
	}
	
	/*
	 * 로그인, 아이디 비밀번호 일치 확인
	 */
	public boolean login(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, password FROM user";
		boolean result = false;
		
		try {
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				if(id.equals(rs.getString("id")) && pw.equals(rs.getString("password"))) {
					result = true;
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("ipCheck 에러: "+e);
		} finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		
		return result;
	}
	
	/* 회원가입
	 * exists를 통해서 중복아이디 검사 후 중복된 아이디가 없으면 회원가입
	 */
	public int insert(String id, String pw, String name) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
		int result = 1;
		
		if(exists(id)) {
			try {
				conn = ConnectionPool.get();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, pw);
				stmt.setString(3, name);
				
				int count = stmt.executeUpdate();
				if(count == 1) {
					result = 0;
				}
			} catch(Exception e) {
				System.out.println("insert 에러: " + e);
			} finally {
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}
			
		} else {
			result = 2;
		}
		
		return result;
	}
	
	/*
	 * 회원탈퇴
	 * 아이디와 비밀번호가 일치하는경우 해당 아이디를 갖는 회원을 탈퇴시킨다.
	 */
	public boolean delete(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM user WHERE id=?";
		boolean result = false;
		
		if(login(id, pw)) {
			try {
				conn = ConnectionPool.get();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				
				int count = stmt.executeUpdate();
				if(count == 1) {
					result = true;
				}
				
			} catch (Exception e) {
				System.out.println("delete 에러: " + e);
			} finally {
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}
		}
		
		return result;
	}
	
}
