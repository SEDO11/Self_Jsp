package com;

import javax.naming.NamingException;
import java.sql.*;

public class FeedDAO {
	
	public String select() throws NamingException, SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			String str = "<table align=\"center\">";
			str += "<tr><th colspan=3><h3>글 작성 내역</h3></th><tr>";
			while(rs.next()) {
				str += "<tr><td colspan=3><hr></td><tr>";
				str += "<tr><td colspan=1>"+rs.getString("id")+"</td><td colspan=2>"+rs.getString("ts")+"</td><tr>";
				str += "<tr><td colspan=1>"+rs.getString("content")+"</td><tr>";
			}
			
			return str;
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean insert(String id, String content) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, content);
			
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
	}
}
