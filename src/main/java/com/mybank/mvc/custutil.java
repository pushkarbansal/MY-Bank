package com.mybank.mvc;

import java.sql.ResultSet;

import com.mybank.dao.CustomerFunctions;


public class custutil {

	
	
	public Customer getdata(String email)
	{
		
		CustomerFunctions cf=new CustomerFunctions();
		Customer c=cf.getData(email);
		System.out.println("helloo custutil is working");
		return c;	
	}
	

	
	
	
	
}
