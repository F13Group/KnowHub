package ua.f13group.KnowHub.repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "propertyRepository")
public class PropertyRepositoryJDBC implements PropertyRepository {

	// private static Connection connection;
	@Autowired
	DataSource ds;

	@Override
	public String getProperty(String key) {
//		String url, user, password, driver;
//
//		try (FileInputStream fileInput = new FileInputStream(new File(
//				"spring/jdbc.properties"))) {
//			Properties prop = new Properties();
//			prop.load(fileInput);
//			url = prop.getProperty("url");
//			password = prop.getProperty("password");
//			driver = prop.getProperty("driver");
//			user = prop.getProperty("user");
//			Class.forName(driver);

			try (Connection connection = ds.getConnection();) {

				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery("");
				rs.next();
				return rs.getString(1);
			} catch (SQLException e) {
				return null;
			}

//		} catch (IOException | ClassNotFoundException e) {
//			e.printStackTrace();
//			return null;
//		}

	}

}
