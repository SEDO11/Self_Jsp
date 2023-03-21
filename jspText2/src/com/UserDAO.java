package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

public class UserDAO {
	
	private String id = "";
	private String name = "";
	
	/* 	아이디 중복확인
	 	중복된 아이디가 있으면 false, 중복된 아이디가 없으면 true */
	private boolean exists(String id) throws SQLException, NamingException {
		Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT id FROM user WHERE id = ?";
        boolean result = false;

        try {
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            result = !rs.next();
        } finally {
            close(conn, stmt, rs);
        }

        return result;
	}

	/*
	 * 로그인, 아이디 비밀번호 일치 확인
	 */
	public boolean login(String id, String pw) throws SQLException, NamingException {
		Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT id, name FROM user WHERE id = ? AND password = ?";
        boolean result = false;

        try {
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, pw);
            rs = stmt.executeQuery();

            if (rs.next()) {
                this.id = rs.getString("id");
                this.name = rs.getString("name");
                result = true;
            }
        } finally {
            close(conn, stmt, rs);
        }

        return result;
	}
	
	/* 회원가입
	 * exists를 통해서 중복아이디 검사 후 중복된 아이디가 없으면 회원가입
	 */
	public boolean insert(String id, String pw, String name) throws SQLException, NamingException {
		if (!exists(id)) {
            return false;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";

        try {
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, pw);
            stmt.setString(3, name);
            stmt.executeUpdate();
        } finally {
            close(conn, stmt, null);
        }

        return true;
	}
	
	/*
	 * 회원탈퇴
	 * 아이디와 비밀번호가 일치하는경우 해당 아이디를 갖는 회원을 탈퇴시킨다.
	 */
	public boolean delete(String id, String pw) throws SQLException, NamingException {
		if(!login(id,pw)) {
			return false;
		}
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement("DELETE FROM user WHERE id=?");
			stmt.setString(1, id);
			stmt.executeUpdate();	
		} finally {
			close(conn, stmt, null);
		}
		
		return true;
	}
	
	private void close(Connection conn, PreparedStatement stmt, ResultSet rs) throws SQLException {
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
}
