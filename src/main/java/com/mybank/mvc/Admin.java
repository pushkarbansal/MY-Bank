package com.mybank.mvc;

public class Admin {
	private String email;
	private String password;
	final String salt= "mybank";
	
	Admin(String email,String password)
	{
		
		setEmail(email);
		setPassword(password+salt);
		
	}

	public String getEmail ()
	{
		return email;
	}
	public String getPassword()
	{
		 return password;
	}
	
	public void setEmail(String email)
	{
		this.email=email;
	}
	public void setPassword(String password)
	{
		this.password=password;
	}

}
