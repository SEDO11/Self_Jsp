package com;

import java.sql.*;

import javax.naming.NamingException;

public class UserDAO {

	public boolean exists(String id) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT id FROM user WHERE id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			System.out.print(rs);

			return rs.next();

		} finally {
			if (rs != null) rs.close();
			if (stmt != null) conn.close();
			if (conn != null) conn.close();
		}
	}
	
	public String select() throws NamingException, SQLException{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, name, ts FROM user";
			conn = ConnectionPool.get();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			String str = "<table align=\"center\">";
			str += "<tr><th colspan=3><h3>가입자 리스트</h3></th></tr>";
			while(rs.next()){
				str += "<tr><th colspan=3><hr></th></tr>";
				str += "<tr><td>" + rs.getString("id") + " " + rs.getString("name") + " (" + rs.getString("ts") +")</td></tr>";
			}
			str += "</table>";
			
			return str;
				
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) rs.close();
			if(conn != null) rs.close();
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
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public boolean withdraw(String id, String pw) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "DELETE FROM user WHERE id = ? AND password = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			int count = stmt.executeUpdate();
			
			return (count > 0) ? true : false;
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean login(String id, String pw) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean check = false;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			rs.next();
			if(pw.equals(rs.getString("password"))) {
				check = true;
			}

			return check;
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
}
