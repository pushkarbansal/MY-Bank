package com.mybank.mvc;
import com.mybank.dao.sqlcustomer;
import com.mybank.dao.CustomerFunctions;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Customerverify")
public class Customerverify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String aline1;
	private String aline2;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		sqlcustomer sql= new sqlcustomer();
		String req=request.getParameter("submit");
		
		
		

		if(req.equals("RegisterCustomer"))
		{
			HttpSession session =request.getSession();

			String email=request.getParameter("email");
			String fname=request.getParameter("fname");
			String lname=request.getParameter("lname");
			String aline1=request.getParameter("aline1");
			String aline2="";
			session.setAttribute("email", request.getParameter("email"));
			
			if(request.getParameter("aline2")!=null)
			{
				aline2=request.getParameter("aline2");
			}
			String pass=request.getParameter("pass");
			String city=request.getParameter("city");
			 if(request.getParameter("gender")==null)
				{
					session.setAttribute("feedback", "Gender cant be null");
					response.sendRedirect("Customersignup.jsp");
					return ;
				}
			
			String state=request.getParameter("state");
			String phone=request.getParameter("phone");
			int genderint=Integer.parseInt(request.getParameter("gender"));
			String dob=request.getParameter("dob");
			String gender="";

			if(genderint==1)
			{
				gender="male";
			}
			if(genderint==2)
			{
				gender="female";
			}
			if(genderint==3)
			{
				gender="others";
			}	

			String name=fname+" "+lname;
			String Address=aline1+" ,"+aline2;

			
			

			if(request.getParameter("pincode").length()!=6)
			{
				
				session.setAttribute("feedback", "pincode is invalid");
				response.sendRedirect("Customersignup.jsp");
				return;
			}
			
			int i=0;
			int pin=Integer.parseInt(request.getParameter("pincode"));
			Customer c=new Customer(name,email,pass,Address,pin,gender,phone,dob,city,state);
			System.out.println(request.getParameter("submit"));

			i=sql.customerRegister(c);	

			//HttpSession session =request.getSession();
			if(i!=0)
			{
				session.setAttribute("feedback","successfully registered" );
				response.sendRedirect("Customerlogin.jsp");
				return;
			}
			else
			{
				session.setAttribute("feedback","Seems like your Email is already Registered" ); 
				response.sendRedirect("Customersignup.jsp");
				return;
			}
			
		}
		
		if(req.equals("customerlogin"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("welcomecustomer.jsp");
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
			Customer c =new Customer();
			c.setPassword(pass);
			c.setEmail(email);
			CustomerFunctions cf=new CustomerFunctions();
			boolean check=sql.verifylogin(c);
			HttpSession session =request.getSession();
			if(check)
			{
				session.setAttribute("feedback", "Successfully login");
				session.setAttribute("valid", "true");
				Customer c1;
				c1=cf.getData(email);
				//request.setAttribute("data", c1);
				session.setAttribute("data", c1);
				session.setAttribute("email", c1.getEmail());
				//rd.forward(request, response);
				response.sendRedirect("welcomecustomer.jsp");
				
				
			}
			else
			{
				session.setAttribute("feedback", "Please check your credentials again!!!!!");
				response.sendRedirect("Customerlogin.jsp");
			}

		}
		//System.out.println(name+email+pass+Address+pincode+gender+phone+dob+city+state);
		//Customer c=new Customer(name,email,pass,Address,pincode,gender,phone,dob);



	}





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
