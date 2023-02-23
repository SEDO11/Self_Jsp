package com;

import javax.sql.*;
import java.sql.*;
import javax.naming.*;

public class ConnectionPool {
	private static DataSource _ds = null;
	
	public static Connection get() throws SQLException, NamingException {
		if(_ds == null) {
			_ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/web_sns");
		}
		
		return _ds.getConnection();
	}

}
