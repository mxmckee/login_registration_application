<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset password</title>
</head>
<body>
	<jsp:useBean id="resetpassword" class="edu.ualr.mxmckee.forgotpassword.bean.ForgotPasswordBean" />

            <jsp:setProperty property="*" name="resetpassword" />

            <%
	ForgotPasswordDao forgotPasswordDao = new ForgotPasswordDao();
            boolean status = forgotPasswordDao.resetPassword(resetpassword);
     	   if (!status) {
     		  request.getRequestDispatcher("outputMessages/resetPasswordSuccessMessage.jsp").forward(request, response);
     	   }
     	   else {
     		  request.getRequestDispatcher("outputMessages/resetPasswordFailureMessage.jsp").forward(request, response);
     	   }
 %>
</body>
</html>