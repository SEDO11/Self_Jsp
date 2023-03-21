package com;

import java.sql.*;

public class FeedDAO {

	public boolean insert(String id, String content, String images) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO feed(id, content, images) VALUES(?, ?, ?)";
		boolean result = false;
		
		try {
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
	
	public void close(Connection conn, PreparedStatement stmt, ResultSet rs) throws SQLException {
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
}
