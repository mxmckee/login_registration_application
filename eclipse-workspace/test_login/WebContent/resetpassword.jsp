<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.ualr.mxmckee.jsp.jdbc.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Reset password</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="signin.css">
    
    <script>
    	function stringGenerate(securityQuestion){
    		document.getElementById('username').value(username);
    	}
    	
    	function checkPasswords(theForm) {
    	    if (theForm.password.value != theForm.passwordRetype.value)
    	    {
    	        alert('The passwords don\'t match!');
    	        return false;
    	    } else {
    	        return true;
    	    }
    	}
    </script>
    
</head>
<body> 

<jsp:useBean id="question" class="edu.ualr.mxmckee.forgotpassword.bean.ForgotPasswordBean" />

            <jsp:setProperty property="*" name="question" />

            <%
	ForgotPasswordDao forgotPasswordDao = new ForgotPasswordDao();
            String username = question.getUsername();
 %>

<form class="form-signin" action="resetpasswordsuccess.jsp" method="post" onsubmit="return checkPasswords(this);">
        <h1 class="h3 mb-3 font-weight-normal">New password</h1>
        <label for="username" class="sr-only">Username</label>
        <input type="hidden" id="username" name="username" class="form-control" value="<%=username %>">
        <label for="firstField" class="sr-only">Password</label>
        <input type="password" id="firstField" name="password" class="form-control" placeholder="New password">
        <label for="lastField" class="sr-only">Password Re-type</label>
        <input type="password" id="lastField" name="passwordRetype" class="form-control" placeholder="Re-type new password">

        <div id="break">
            <br>
        </div>
        <div id="break">
            <br>
        </div>
        <div id="break">
            <br>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Save</button>
        <a href="login.jsp">Remember your password?</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2019 Michael McKee</p>
    </form>
</body>
</html>