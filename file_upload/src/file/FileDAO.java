package file;

import javax.naming.NamingException;
import java.sql.*;

public class FileDAO {
	
	public boolean upload(String fileName, String fileRealName) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "INSERT INTO FILE VALUES(?, ?)";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fileName);
			stmt.setString(2, fileRealName);
			
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
}
