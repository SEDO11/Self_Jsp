package com;

import java.sql.*;
import javax.naming.*;
import java.util.*;

public class FeedDAO {
	public boolean insert(String id, String content) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			if(!id.equals(null) && !content.equals(null)) {
				String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
				conn = ConnectionPool.get();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, content);
			}
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public ArrayList<FeedObj> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			// 반환된 결과 값 저장하기 위한 객체 생성
			ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
			
			// ResultSet 모든 레코드에 대해 실행
			while(rs.next()) {
				// id, content, ts 를 가져와서 Arraylist에 저장
				feeds.add(new FeedObj(rs.getString("id"),
						rs.getString("content"), rs.getString("ts")));
			}
			// while 루프에 의해 생성된 객체 반환
			return feeds;
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
}
