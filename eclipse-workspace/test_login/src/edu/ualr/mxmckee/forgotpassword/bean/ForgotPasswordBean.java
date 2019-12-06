package edu.ualr.mxmckee.forgotpassword.bean;

import java.io.Serializable;

public class ForgotPasswordBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
    private String username;
    private String question;
    private String answer;
    private String password;
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
    
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password ) {
		this.password = password;
	}
}
