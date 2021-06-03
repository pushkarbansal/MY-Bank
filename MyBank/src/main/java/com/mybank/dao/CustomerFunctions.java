package com.mybank.dao;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   
import com.mybank.mvc.Customer;

import java.sql.*;

public class CustomerFunctions {

	private static final String update = "update customer set name = ?,email= ?,password=?,address=?,city=?,pincode=?,state=?,gender=?,dob=?,phone=? where customer_id = ?;";
	private static final String deposit = "UPDATE customer set balance=? where customer_id=?;";
	private static final String delete= "delete from customer  where customer_id=?;";
	private static final String deleterecord= "INSERT INTO  deleterecords (customer_name, customer_email, date, customer_id, account_number) VALUES (?,?,?,?,?);";
	private static final String record= "INSERT INTO records (date,type, senderID, senderAnumber, RecAnumber, recieverID, Bamount, Aamount) VALUES (?,?,?,?,?,?,?,?)";


	public String registercustomer="insert into customer value(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public String GetData="Select * from customer where email=?";
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
			//System.out.println(con);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}


		return con;
	}

	
	public Customer getData(String email)
	{
		 Customer c ;
		 String name="";		
		
		 String  Address="";
		 String state="";
		 String city="";
		 int balance=5000;
		 int pincode=0;
		 String gender="";
		 String phone="";
		 String dob="";
		 String Account_number="";
		 String id="";
		
		Connection con=getConnection();
		try {
		PreparedStatement stmt=con.prepareStatement(GetData);
		stmt.setString(1, email);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			id=rs.getString(1);
			
			name=rs.getString(2);
			Account_number=rs.getString(5);
			Address=rs.getString(6);
			city=rs.getString(7);
			pincode=rs.getInt(8);
			state=rs.getString(9);
			gender=rs.getString(10);
			dob=rs.getString(11);
			phone=rs.getString(12);
			balance=rs.getInt(13);	
			//System.out.println(name+Account_number+city+pincode);
		}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		c=new Customer(name,email,Address,pincode,gender,phone,dob,Account_number,city,state,balance,id);
		
		return c;
	}
	
	
	
	
	
	
	
	
	
	
     public int update(Customer c,String id)
     {
    	 int result=0;
    	 Connection con=getConnection();
    	 try {
    		 System.out.println("update is called");
    	 PreparedStatement stmt=con.prepareStatement(update);
    	stmt.setString(1, c.getName());
    	stmt.setString(2, c.getEmail());
    	stmt.setString(3, c.getPassword());
    	stmt.setString(4, c.getAddress());
    	stmt.setString(5, c.getCity());
    	stmt.setInt(6, c.getPincode());
    	stmt.setString(7, c.getState());
    	stmt.setString(8, c.getGender());
    	stmt.setString(9, c.getDob());
    	stmt.setString(10, c.getPhone());    	
     	stmt.setString(11, id);
     	result=stmt.executeUpdate();
    	 }catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }
    	 System.out.println("update is finished");
    	 return result;
     }
     
     
     
     public int deposit(int amount,int id)
     {
    	 int result=0;
    	 Connection con=getConnection();
    	 try {
    	 PreparedStatement stmt=con.prepareStatement(deposit);
    	 stmt.setInt(1, amount);
    	 stmt.setInt(2, id);
    	 result=stmt.executeUpdate();
    	 System.out.println(stmt);
    	 }
    	 catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }
    	 	
    	 
    	return result;
    	 
     }
     
     
     
     
     public int withdraw(int amount,int id)
     {
    	 int result=0;
    	 Connection con=getConnection();
    	 try {
    	 PreparedStatement stmt=con.prepareStatement(deposit);
    	 stmt.setInt(1, amount);
    	 stmt.setInt(2, id);
    	 result=stmt.executeUpdate();
    	 System.out.println(stmt);
    	 }
    	 catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }
    	 	
    	 
    	return result;
    	 
     }
     
     public int deposit1(int amount,int id)
     {
    	 int result=0;
    	 Connection con=getConnection();
    	 try {
    	 PreparedStatement stmt=con.prepareStatement(deposit);
    	 stmt.setInt(1, amount);
    	 stmt.setInt(2, id);
    	 result=stmt.executeUpdate();
    	 System.out.println(stmt);
    	 }
    	 catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }
    	 	
    	 
    	return result;
    	 
     }
     
     
     public int delete(int id,Customer  c)
     {
    	 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"); 
    	   LocalDateTime now = LocalDateTime.now();  
    	 int result=0;
    	 Connection con=getConnection();
    	 try {
    	 PreparedStatement stmt=con.prepareStatement(delete);
    	 stmt.setInt(1, id);    
    	 System.out.println(stmt);

    	 result=stmt.executeUpdate();
    	 System.out.println(stmt);
    	 PreparedStatement pr=con.prepareStatement(deleterecord);
    	 pr.setString(1, c.getName());
    	 pr.setString(2, c.getEmail());
    	 pr.setString(3, dtf.format(now));
    	 pr.setString(4, c.getID());
    	 pr.setString(5, c.getAccountNumber());
    	 System.out.println(pr);

    	 int random=pr.executeUpdate();
    	
    	 }
    	 catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }
    	 	
    	 
    	return result;
     }
  
     
     
     
     ResultSet getinfo(String number)
     {

    	ResultSet rs=null;
    	 Connection con=getConnection();
    	 try {
			PreparedStatement stmt=con.prepareStatement(("select * from customer where account_number=?"));
			stmt.setString(1, number);
			rs=stmt.executeQuery();
			 
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return rs;
	 
     }
     
     public int transfer(Customer send,String name,String number,int amount)
     {
    	 int recid=0;
    	 int result=0;
    	 int sendbal=send.getBalance();
    	 int recbal=0;
    	 ResultSet rec=getinfo(number);
    	 try {
			while(rec.next())
			 {
				
				recid=rec.getInt(1);
				 recbal=rec.getInt(13);
				 if(rec.getString(2).equals(name))
				 {
					 result=1;
				 }
				 else
				 {
					 return 0;
				 }
				 
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 
    	 
    	 int sendid=Integer.parseInt(send.getID());
    	
    	 
    	 int result1=deposit1(recbal+amount,recid);
    	 int result2=deposit1(sendbal-amount,sendid);
    	 
    	 Connection con=getConnection();
    	 
    	 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"); 
  	   LocalDateTime now = LocalDateTime.now();
    	 
    	
    	
		try {
			PreparedStatement stmt=con.prepareStatement(record);
			 stmt.setString(1, dtf.format(now));
			 stmt.setString(2, "sent");
			 stmt.setString(3, sendid+"");
			 stmt.setString(4, send.getAccountNumber());
			 stmt.setString(5, number);
			 stmt.setString(6, recid+"");
			 stmt.setString(7, sendbal+"");
			 stmt.setString(8, (sendbal-amount)+"");
			 
			 
			int  result3 = stmt.executeUpdate();
			 
			 PreparedStatement pr=con.prepareStatement(record);
			 pr.setString(1, dtf.format(now));
			 pr.setString(2, "recieved");
			 pr.setString(3, recid+"");
			 pr.setString(4, number);
			 pr.setString(5, send.getAccountNumber());
			 pr.setString(6, sendid+"");
			 pr.setString(7, recbal+"");
			 pr.setString(8, (recbal+amount)+"");
			 int result4=pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
    	 
    	 return result;
    	 
   	 
     }
     
     
     
     public ResultSet getRecords(int id,String fdate ,String ldate)
     {
    	 ResultSet rs=null;
    	 Connection  con=getConnection();
    	 
    	 
    	 
    	 try {
			PreparedStatement stmt=con.prepareStatement("select  * from records  where senderID=? Or recieverID=?  And date between ? and ?");
			 stmt.setInt(1, id);
			 stmt.setInt(2, id);
			 stmt.setString(3, fdate);
			 stmt.setString(4, ldate);
			 rs=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 return rs;

     }
	
	
}
