<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify username</title>
</head>
<body>
	<jsp:useBean id="verifyusername" class="edu.ualr.mxmckee.forgotpassword.bean.ForgotPasswordBean" />

            <jsp:setProperty property="*" name="verifyusername" />

            <%
	ForgotPasswordDao forgotPasswordDao = new ForgotPasswordDao();
            boolean status = forgotPasswordDao.validate(verifyusername);
     	   if (status) {
     		   request.getRequestDispatcher("answersecurityquestion.jsp").forward(request, response);
     	   }
     	   else {
     		  request.getRequestDispatcher("outputMessages/verifyUsernameFailureMessage.jsp").forward(request, response);
     	   }
 %>
</body>
</html>