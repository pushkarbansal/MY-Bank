package com.mybank.dao;

import com.mybank.mvc.Customer;
import java.sql.*;
import java.util.Random;


public class sqlcustomer {


	public String registercustomer="insert into customer value(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public String GetData="Select * from customer";
	public final String url="jdbc:mysql://localhost:3306/mybank?characterEncoding=latin1";
	public final String user="root";
	public final String pass="500076495";




	Connection getConnection()
	{
		Connection con=null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,user,pass);
			System.out.println(con);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}


		return con;
	}



	int getId()
	{
		int id=0;
		boolean checker=false;
		Random rand=new Random();
		Connection con=getConnection();
		try
		{
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select customer_id from customer");
			do	
			{
				id=rand.nextInt(10000 - 1000) + 1000;
				while(rs.next())
				{
					//System.out.println(rs.getInt(1));
					if(rs.getInt(1)==id)
					{
						checker=true;
					}
				}
			}
			while(checker==true);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return id;
	}

	
	
	String getAccount()
	{
		String account="";
		ResultSet rs=null;
		Statement stmt=null;
		Connection con=getConnection();
		try {
		stmt =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		rs=stmt.executeQuery("select account_number from customer");
		rs.last();
		account=rs.getString(1);
		}
		catch(Exception e)
		
		{
			System.out.println(e);
		}
		
		
		long account1=Long.parseLong(account);  
		account1+=1;
		account=account1+"";
		return account;
	}
	
	
	
	
	
	
	
	
	

	public int customerRegister(Customer c)
	{
		boolean check= emailchecker(c.getEmail());
		if(check)
		{
			int n=0;


			Connection con=getConnection();



			PreparedStatement st=null;
			try {
				st = con.prepareStatement(registercustomer);
				
				st.setInt(1, getId());
				st.setString(2, c.getName());
				st.setString(3, c.getEmail());
				st.setString(4,c.getPassword());
				st.setString(5,getAccount());
				st.setString(6,c.getAddress());
				st.setString(7,c.getCity());
				st.setInt(8, c.getPincode());
				st.setString(9,c.getState());
				st.setString(10,c.getGender());
				st.setString(11, c.getDob());
				st.setString(12,c.getPhone());
				st.setInt(13,c.getBalance());
				n=st.executeUpdate();	}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(st);


			return n;
		}
		
		else
		{
			return 0;
		}
	}




	boolean emailchecker(String email)
	{
		Connection con=getConnection();
		try
		{
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select email from customer");


			while(rs.next())
			{
				//System.out.println(rs.getString(1));
				if(rs.getString(1).equals(email))
				{
					return false;
				}

			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return true;
	}
	
	
	
	
	
	public boolean verifylogin(Customer c )
	{
		
		boolean allow=false;
		Statement stmt;
		ResultSet rs;
		Connection con=getConnection();
		try {
		 stmt=con.createStatement();
		 rs=stmt.executeQuery("select email, password from customer ");
		
		while (rs.next())
		{
			if(rs.getString(1).equals(c.getEmail()))
			{
				System.out.println("email checked");
				if(rs.getString(2).equals(c.getPassword()))
				{
					System.out.println("password checked");
					allow=true;
				}
			
					
			}
			
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}

return allow;

}
}
