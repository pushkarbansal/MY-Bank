package com.mybank.mvc;
import com.mybank.dao.sql;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Adminverify")
public class Adminverify extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int i=0;
		String name=request.getParameter("email");
		String pass=request.getParameter("pass");
		sql s=new sql();

		String req=request.getParameter("submit");
		System.out.println(request.getParameter("submit"));
		
		
		if(req.equals("RegisterAdmin"))
		{
			Admin a=new Admin(name,pass);
			System.out.println(request.getParameter("submit"));
			try {
			i=	s.registerAdmin(a);	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			HttpSession session =request.getSession();
			if(i==1)
			{
				session.setAttribute("feedback","successfully registered,login to you account" );
				response.sendRedirect("adminlogin.jsp");
				return;
			}
			else
			{
				session.setAttribute("feedback","Seems like your Email is already Registered" ); 
			}
			response.sendRedirect("adminregister.jsp");
			return;
		}
		if(req.equals("AdminLogin"))
		{
			Admin a=new Admin(name,pass);
			boolean check=s.loginverify(a);
			HttpSession session =request.getSession();
			if(check)
			{
				session.setAttribute("admin", "Successfully login");
				response.sendRedirect("welcome.jsp");
				return;
				
			}
			else
			{
				session.setAttribute("feedback", "Please check your credentials again!!!!!");
				response.sendRedirect("adminlogin.jsp");
				return;
			}
		}
		
		
		
		
		
		
		
		
		
		if(req.equals("check"))
		{
			String fdate=request.getParameter("fdate").replace('-', '/');
			String ldate=request.getParameter("ldate").replace('-', '/');
			ResultSet rs=s.getrecord(fdate, ldate);
			
			HttpSession result =request.getSession();
			result.setAttribute("result1",rs);
			ResultSet res=(ResultSet)result.getAttribute("result1");
			
			
			
			
			


			if(result.getAttribute("result1")!=null)
			{
				System.out.println("inside block");
				response.sendRedirect("deleterecords.jsp");
				return;
			}
			else
			{
				result.setAttribute("error", "something is wrong Contact Admin");
				response.sendRedirect("welcome.jsp");
				return;
			}
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
