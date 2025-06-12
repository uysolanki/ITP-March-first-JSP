package db;


import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;

public class MySQLConnectionITP {
	static Connection con;
	
	private MySQLConnectionITP() {}
	public static Connection getConnection(ServletContext context) throws Exception
	{	
		String driverName=context.getInitParameter("driverName");
		String dbUrl=context.getInitParameter("dbUrl");
		String dbUserName=context.getInitParameter("dbUserName");
		String dbPassword=context.getInitParameter("dbPassword");
		
		Class.forName(driverName); 		
		con=DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
		return con;
	}
}