package com.mybank.mvc;

public class Customer {
	
	private String Cust_id;
	private String name;
	private String email;
	private String password;
	private String  Address;
	private String state;
	private String city;
	private int balance;
	
	private int pincode;
	private String gender;
	private String phone;
	private String dob;
	public final String salt="mybank";
	private String Account_number;   //we need to set this account number later on
	
	
	
	public Customer()
	{
		
	}
	
	
	Customer(String name,String email,String password,String address,int pincode,String gender,String phone,String dob,String city,String state)
	{
		setBalance();
		setName(name);
		setEmail(email);
		setPassword(password);
		setAddress(address);
		setPincode(pincode);
		setGender(gender);
		setPhone(phone);
		setDob(dob);
		setCity(city);
		setState(state);
		
		
	}
	
	

	public Customer(String name,String email,String address,int pincode,String gender,String phone,String dob,String AccountNumber,String city,String state,int balance,String id)
	{
		setCust_id(id);
		setAccountNumber(AccountNumber);
		setBalance(balance);
		setName(name);
		setEmail(email);
		setPassword(password);
		setAddress(address);
		setPincode(pincode);
		setGender(gender);
		setPhone(phone);
		setDob(dob);
		setCity(city);
		setState(state);
		
		
	}
	
	
	public void setAccountNumber(String acc)
	{
		this.Account_number=acc;
	}
	
	public void setName(String name)
	{
		this.name=name;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	public void setPassword(String password)
	{
		this.password=password+this.salt;
		
	}
	
	public void setBalance()
	{
		this.balance=5000;
	}
	public void setBalance(int balance)
	{
		this.balance=balance;
	}
	
	public void setCust_id(String id)
	{
		this.Cust_id=id;
	}
	
	public String getID()
	{
		return Cust_id;
	}
	
	public int getBalance()
	{
		return this.balance;
	}
	
	void setCity(String city)
	{
		this.city=city;
	}
	void setState(String state)
	{
		this.state=state;
	}
	
	void setAddress(String address)
	{
		this.Address=address;
	}
	void setPincode(int pincode)
	{
		this.pincode=pincode;
	}
	void setGender(String gender)
	{
		this.gender=gender;
	}
	void setPhone(String phone)
	{
		this.phone=phone;
		
	}
	void setDob(String dob)
	{
		this.dob=dob;
	}
	
	
	
	
	public String getAccountNumber()
	{
		return this.Account_number;
	}
	
	public String getCity()
	
	{
		return this.city;
	}
	public String getState()
	
	{
		return this.state;
	}
	
	public	String getName()
	{
		return this.name;
	}
	public String getEmail()
	{
		return this.email;
	}
	public	String getPassword()
	{
		return this.password;
	}
	public String getAddress()
	{
		return this.Address;
	}
	public	int getPincode()
	{
		return this.pincode;
	}
	public String getGender()
	{
		return this.gender;
	}
	public	String getPhone()
	{
		return this.phone;
	}
	public 	String getDob()
	{
		return this.dob;
	}
	
	
}

      