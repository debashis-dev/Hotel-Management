package com.sathya.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	public static Connection createConnection()
	{
		Connection connection = null;
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "deb", "welcome");
			System.out.println("Connection Created Successfully....");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
