package com;

import java.sql.*;

public class FeedDAO {

	public boolean insert(String id, String content) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
		boolean result = false;
		
		try {
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, content);
			
			int count = stmt.executeUpdate();
			if(count == 1) {
				result = true;
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		return result;
	}
}
