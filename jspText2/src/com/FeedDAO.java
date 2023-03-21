package com;

import java.sql.*;

public class FeedDAO {

	public boolean insert(String id, String content, String images) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
<<<<<<< HEAD
		String sql = "INSERT INTO feed(id, content, images) VALUES(?, ?, ?)";
=======
		
>>>>>>> 1b7e6aac35a4aaeb5721ff976ac7fa913e4e4a21
		boolean result = false;
		
		if(id == null) {
			return result;
		}
		
		try {
			String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, content);
			stmt.setString(3, images);
			
			int count = stmt.executeUpdate();
			if(count == 1) {
				result = true;
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			close(conn, stmt, null);
		}
		
		return result;
	}
	
<<<<<<< HEAD
	public void close(Connection conn, PreparedStatement stmt, ResultSet rs) throws SQLException {
=======
	public String select() throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String result = "<table align=center>";
		result += "<tr><th colspan=2>작성글 리스트</th><tr>";
		
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				result += "<tr><td colspan=2><hr></td></tr>";
				result += "<tr>";
				result += "<td><small>"+ rs.getString("id") + "</small></td>";
				result += "<td><small>&nbsp;"+ rs.getString("ts") + "</small></td>";
				result += "</tr>";
				result += "<tr><td colspan=2>"+ rs.getString("content") +"</td></tr>";
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			result += "</table>";
			close(conn, stmt, rs);
		}
		
		return result;
	}
	
	private void close(Connection conn, PreparedStatement stmt, ResultSet rs) throws SQLException {
>>>>>>> 1b7e6aac35a4aaeb5721ff976ac7fa913e4e4a21
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
}
