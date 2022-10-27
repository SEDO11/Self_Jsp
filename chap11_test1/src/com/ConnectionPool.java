package com;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class ConnectionPool {
	private static DataSource ds = null;
	
	public static Connection get() throws NamingException, SQLException {
		if(ds == null) {
			ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/mysns");
		}
		return ds.getConnection();
	}
}
