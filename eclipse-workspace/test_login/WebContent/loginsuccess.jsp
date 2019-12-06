<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log in</title>
</head>
<body>
	<jsp:useBean id="login" class="edu.ualr.mxmckee.login.bean.LoginBean" />

            <jsp:setProperty property="*" name="login" />

            <%
  LoginDao loginDao = new LoginDao();
   boolean status = loginDao.validate(login);
   if (status) {
	   request.getRequestDispatcher("outputMessages/loginSuccessMessage.jsp").forward(request, response);
   }
   else {
	   request.getRequestDispatcher("outputMessages/loginFailureMessage.jsp").forward(request, response);
   }
 %>
</body>
</html>