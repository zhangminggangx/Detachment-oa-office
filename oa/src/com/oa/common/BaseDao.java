package com.oa.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

public class BaseDao {
	private final String URL="jdbc:sqlserver://localhost:1433;databaseName=oa";
	private final String USER="sa";
	private final String PWD="123456";
	private final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private Connection conn = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet rs = null;
	Logger logger = Logger.getLogger(BaseDao.class);

	/**
	 * 1获取连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Connection getConn() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (ClassNotFoundException e) {
			logger.debug(e.getMessage(), e);
		} catch (SQLException e) {
			logger.debug(e.getMessage(), e);
		}

		return conn;

	}

	/**
	 * 1获取连接连接池
	 * 
	 * @return
	 * @throws SQLException
	 */
	/*
	 * private Connection conn = null; private PreparedStatement
	 * preparedStatement = null; private ResultSet rs = null; Logger logger =
	 * Logger.getLogger(BaseDao.class);
	 */
	/*
	 * public Connection getConn() {
	 * 
	 * try { Context context = new InitialContext(); DataSource dataSource =
	 * (DataSource) context .lookup("java:comp/env/jdbc/order"); conn =
	 * dataSource.getConnection(); } catch (NamingException e) {
	 * logger.debug(e.getMessage(), e); } catch (SQLException e) {
	 * logger.debug(e.getMessage(), e); } return conn;
	 * 
	 * }
	 */

	/**
	 * 2设置preparedStatement 占位符的值
	 * 
	 * @param preparedStatement
	 * @param params
	 */
	public void setState(PreparedStatement preparedStatement, List params) {
		try {
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					if (params.get(i) instanceof java.util.Date) {
						java.sql.Date sqlDate = new java.sql.Date(
								((java.util.Date) params.get(i)).getTime());
						preparedStatement.setObject(i + 1, sqlDate);

					} else {
						preparedStatement.setObject(i + 1, params.get(i));
					}
				}
			}
		} catch (SQLException e) {
			logger.debug(e.getMessage(), e);
		}

	}

	/**
	 *3 执行带 多个占位符的语句
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public int executeUpdate(String sql, List params) {
		int ret = 0;
		try {
			conn = this.getConn();
			preparedStatement = conn.prepareStatement(sql);
			this.setState(preparedStatement, params);
			ret = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			logger.debug(e.getMessage(), e);
		} finally {
			this.close();
		}
		return ret;
	}

	/**
	 * 4执行更新当 带占位符只有一个时
	 * 
	 * @param sql
	 * @param object
	 * @return
	 */
	public int executeUpdate(String sql, Object object) {
		List params = new ArrayList();
		params.add(object);
		return this.executeUpdate(sql, params);

	}

	/**
	 * 5当不带占位符时的更新
	 * 
	 * @param sql
	 * @return
	 */
	public int executeUpdate(String sql) {
		return this.executeUpdate(sql, null);
	}

	/**
	 * 6带多个占位符的 查询
	 */

	public ResultSet executeQuery(String sql, List params) {

		conn = this.getConn();
		try {
			preparedStatement = conn.prepareStatement(sql);
			this.setState(preparedStatement, params);
			rs = preparedStatement.executeQuery();
		} catch (SQLException e) {
			logger.debug(e.getMessage(), e);
		}
		return rs;
	}

	/**
	 * 7带一个占位符的 查询
	 */
	public ResultSet executeQuery(String sql, Object object) {
		List params = new ArrayList();
		params.add(object);
		return executeQuery(sql, params);

	}

	/**
	 * 8不带占位符的查询
	 */

	public ResultSet executeQuery(String sql) {
		return executeQuery(sql, null);

	}

	/**
	 * 9关闭连接
	 */
	public void close() {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();

			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			logger.debug(e.getMessage(), e);
		}
	}

}
