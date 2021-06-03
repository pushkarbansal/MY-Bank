package com.mybank.dao;

import com.mybank.mvc.Admin;
import java.sql.*;
import java.util.Random;

public class sql {
	
	public String registeradmin="insert into admin value(?,?,?)";
	public String GetData="Select * from admin";
	public final String url="jdbc:mysql://localhost:3306/mybank?characterEncoding=latin1";
	public final String user="root";
	public final String pass="500076495";
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,user,pass); 
			System.out.println(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

//	
//	 public boolean updateUser(Admin user) throws SQLException {
//			boolean rowUpdated;
//			try (Connection connection = getConnection();
//					PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
//				System.out.println("updated USer:"+statement);
//				statement.setString(1, user.getName());
//				statement.setString(2, user.getEmail());
//				statement.setString(3, user.getCountry());
//			
//				rowUpdated = statement.executeUpdate() > 0;
//			}
//			return rowUpdated;
//		}
//


//public static void main(String[] args) throws SQLException
//{
//	sql sq=new sql();
//	Connection con=sq.getConnection();
//	PreparedStatement stmt=con.prepareStatement(sq.registeradmin);
//	stmt.setInt(1,6);
//	stmt.setString(2,"test@gmail.com");
//	stmt.setString(3, "passssword");
//	 int  i =stmt.executeUpdate();
// System.out.println(stmt);
//	
//	System.out.println(con);
//}
//}
//

//
	
public boolean loginverify(Admin a)
{
	boolean allow=false;
	Statement stmt;
	ResultSet rs;
	Connection con=getConnection();
	
	try {
		stmt=con.createStatement();
		rs=stmt.executeQuery(GetData);
		while(rs.next())
		{
			//System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
			if(rs.getString(2).equals(a.getEmail()))
			{
				//System.out.println("email checked");
				if(rs.getString(3).equals(a.getPassword()))
				{
					//System.out.println("password checked");
					allow=true;
				}
			
					
			}
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return allow;
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
	ResultSet rs=stmt.executeQuery("select admin_id from admin");
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
	
	
	
public int registerAdmin(Admin a)  throws SQLException //Admin a
{
	int i=0;
	boolean check= emailchecker(a.getEmail());
	if(check)
	{
	Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement(registeradmin);
	
		
		 System.out.println("updated USer:"+stmt);
		stmt.setInt(1,getId());
		stmt.setString(2,a.getEmail());// 
		stmt.setString(3,a.getPassword());//
		  i =stmt.executeUpdate();
		 System.out.println(stmt);
	
	return i;
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
	ResultSet rs=stmt.executeQuery("select email from admin");
	
	
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



public ResultSet getrecord(String fdate,String ldate)
{
	Connection con=getConnection();
	ResultSet rs=null;
	
	
	try {
		PreparedStatement stmt=con.prepareStatement("select * from deleterecords where date between ? and ?");
		stmt.setString(1,fdate );
		stmt.setString(2,ldate );
		rs=stmt.executeQuery();
		return rs;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		while(rs.next())
			
		{
			System.out.println("inside sql"+rs.getString(1));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
	
	return rs;
	
}




}

