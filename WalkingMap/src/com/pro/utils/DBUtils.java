package com.pro.utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;


public class DBUtils {
	private static Connection conn;
	private static DataSource dataSource;
	static {
		Properties properties = new Properties();
		try {
			properties.load(DBUtils.class
					.getResourceAsStream("jdbc.properties"));
			DBUtils.dataSource = BasicDataSourceFactory
					.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static DataSource getDataSource() {
		return dataSource;
	}

	public static Connection getConnection() throws SQLException {
		if (conn == null || conn.isClosed()) {
			conn = dataSource.getConnection();
		}
		return conn;
	}

	public static void closeConnection() {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
