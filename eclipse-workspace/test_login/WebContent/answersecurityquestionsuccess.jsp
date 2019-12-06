<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer security question</title>
</head>
<body>
	<jsp:useBean id="forgotpassword" class="edu.ualr.mxmckee.forgotpassword.bean.ForgotPasswordBean" />
	
	<jsp:setProperty property="*" name="forgotpassword" />

            <%
  ForgotPasswordDao forgotPasswordDao = new ForgotPasswordDao();
   boolean status = forgotPasswordDao.checkAnswer(forgotpassword);
   if (status) {
	   request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
   }
   else {
	   request.getRequestDispatcher("outputMessages/verifySecurityQuestionFailureMessage.jsp").forward(request, response);
   }
 %>
</body>
</html>