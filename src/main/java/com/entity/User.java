package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "register_user")
public class User {
	  	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	  	@Column(name = "name" , length = 255)
	private String nameString;
	  	@Column(name = "Email" ,length=255)
	 private String emailString;
	  	@Column(name = "passwords" , length = 20)
	 private String passwordString;
	  	@Column(name = "Remember",length = 20)
	 private String checkerString;
	 


	public String getNameString() {
		return nameString;
	}

	public void setNameString(String nameString) {
		this.nameString = nameString;
	}

	public String getEmailString() {
		return emailString;
	}

	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}

	public String getPasswordString() {
		return passwordString;
	}

	public void setPasswordString(String passwordString) {
		this.passwordString = passwordString;
	}

	public String getCheckerString() {
		return checkerString;
	}

	public void setCheckerString(String checkerString) {
		this.checkerString = checkerString;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", nameString=" + nameString + ", emailString=" + emailString + ", passwordString="
				+ passwordString + ", checkerString=" + checkerString + "]";
	}
	
}
