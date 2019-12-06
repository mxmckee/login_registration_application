package edu.ualr.mxmckee.jsp.jdbc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.ualr.mxmckee.register.bean.RegisterBean;

public class RegisterDao {
	public void setCredentials(RegisterBean registerBean) throws ClassNotFoundException {
			Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "Gizmo$i$14");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("insert into login (username, password, name, question, answer) values (?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, registerBean.getUsername());
            preparedStatement.setString(2, registerBean.getPassword());
            preparedStatement.setString(3, registerBean.getName());
            preparedStatement.setString(4, registerBean.getQuestion());
            preparedStatement.setString(5, registerBean.getAnswer());

            System.out.println(preparedStatement);
            preparedStatement.execute();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
    }
	
	public boolean validate(RegisterBean registerBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "Gizmo$i$14");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from login where username = ?")) {
            preparedStatement.setString(1, registerBean.getUsername());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
	}

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
