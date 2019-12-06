<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<jsp:useBean id="register" class="edu.ualr.mxmckee.register.bean.RegisterBean" />

            <jsp:setProperty property="*" name="register" />

            <%
	RegisterDao registerDao = new RegisterDao();
            boolean status = registerDao.validate(register);
     	   if (!status) {
     		 registerDao.setCredentials(register);
     		 request.getRequestDispatcher("outputMessages/registrationSuccessMessage.jsp").forward(request, response);
     	   }
     	   else {
     		  request.getRequestDispatcher("outputMessages/registrationFailureMessage.jsp").forward(request, response);
     	   }
 %>
</body>
</html>