package edu.ualr.mxmckee.jsp.jdbc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.ualr.mxmckee.forgotpassword.bean.ForgotPasswordBean;

public class ForgotPasswordDao {

	public String getSecurityQuestion(ForgotPasswordBean forgotPasswordBean) {
		String securityQuestion = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "Gizmo$i$14");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select question from login where username = ?")) {
            preparedStatement.setString(1, forgotPasswordBean.getUsername());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            System.out.println(rs.getString("question"));
            securityQuestion = rs.getString("question");
            forgotPasswordBean.setQuestion(securityQuestion);

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		
		return securityQuestion;
	}
	
	public boolean checkAnswer(ForgotPasswordBean forgotPasswordBean) throws ClassNotFoundException {
        boolean status = false;
        String securityAnswer = forgotPasswordBean.getAnswer();
        System.out.println(securityAnswer);

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "Gizmo$i$14");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select answer from login where username = ? and question = ?")) {
			preparedStatement.setString(1, forgotPasswordBean.getUsername());
            preparedStatement.setString(2, forgotPasswordBean.getQuestion());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            String answer = rs.getString("answer");
            System.out.println(answer);
            
            if (securityAnswer.matches(answer)) {
            	status = true;
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
	}
	
	public boolean resetPassword(ForgotPasswordBean forgotPasswordBean) {
		boolean rs = false;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "Gizmo$i$14");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("update login set password = ? where username = ?")) {
            preparedStatement.setString(1, forgotPasswordBean.getPassword());
            preparedStatement.setString(2, forgotPasswordBean.getUsername());

            System.out.println(preparedStatement);
            rs = preparedStatement.execute();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		
		return rs;
	}
	
	public boolean validate(ForgotPasswordBean forgotPasswordBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "Gizmo$i$14");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from login where username = ?")) {
            preparedStatement.setString(1, forgotPasswordBean.getUsername());

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
