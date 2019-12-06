<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Answer security question</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="signin.css">
    
    <script>
    	function stringGenerate(securityQuestion){
    		document.getElementById('username').value(username);
    		document.getElementById('firstField').value(securityQuestion);
    	}
    </script>
    
</head>
<body>

<jsp:useBean id="question" class="edu.ualr.mxmckee.forgotpassword.bean.ForgotPasswordBean" />

            <jsp:setProperty property="*" name="question" />

            <%
	ForgotPasswordDao forgotPasswordDao = new ForgotPasswordDao();
            String username = question.getUsername();
            String securityQuestion = forgotPasswordDao.getSecurityQuestion(question);
 %>
 
<form class="form-signin" action="answersecurityquestionsuccess.jsp" method="post">
        <h1 class="h3 mb-3 font-weight-normal">Security question</h1>
        <label for="firstField" class="sr-only">Security Question</label>
        <input readonly id="firstField" name="question" class="form-control" value="<%=securityQuestion %>">
        <label for="username" class="sr-only">Username</label>
        <input type="hidden" id="username" name="username" class="form-control" value="<%=username %>">
        <label for="lastField" class="sr-only">Answer</label>
        <input type="text" id="lastField" name="answer" class="form-control" placeholder="Answer">

        <div id="break">
            <br>
        </div>
        <div id="break">
            <br>
        </div>
        <div id="break">
            <br>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Verify</button>
        <a href="login.jsp">Remember your password?</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2019 Michael McKee</p>
    </form>
</body>
</html>