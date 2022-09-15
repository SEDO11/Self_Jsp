package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
//import java.util.*;

public class UserDAO {

	// 중복 아이디 찾기
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
			return rs.next();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	// 회원가입
	public boolean insert(String id, String pw, String name) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";

			conn = ConnectionPool.get(); // 해당 클래스의 get을 이용
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			stmt.setString(3, name);

			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;

		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				stmt.close();
		}
	}

	// 회원 탈퇴
	public boolean delete(String id) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "DELETE FROM user SELECT id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);

			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if (conn != null)
				conn.close();
			if (stmt != null)
				stmt.close();
		}
	}

	// 로그인
	public int login(String id, String pw) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);

			rs = stmt.executeQuery();
			if (!rs.next())
				return 1; // 아이디가 존재하지 않는 경우
			if (!pw.equals(rs.getString("password")))
				return 2; // 비밀번호가 일치하지 않는 경우
			return 0; // 정상적으로 수행된 경우
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public ArrayList<UserObj> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			// 반환된 결과 값 저장하기 위한 객체 생성
			ArrayList<UserObj> users = new ArrayList<UserObj>();

			// ResultSet 모든 레코드에 대해 실행
			while (rs.next()) {
				// id, content, ts 를 가져와서 Arraylist에 저장
				users.add(new UserObj(rs.getString("id"), rs.getString("name"), rs.getString("ts")));
			}
			// while 루프에 의해 생성된 객체 반환
			return users;
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}
}
