package org.smartweb.day6;


import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JdbcTests {

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Test
	public void test() {
		try {
			String url = "jdbs:mysql://localhost:3306/smartweb";
			String user = "root";
			String password = "1111";
			DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
