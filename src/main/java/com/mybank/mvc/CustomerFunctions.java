package com.mybank.mvc;

import java.util.concurrent.TimeUnit;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerFunctions")
public class CustomerFunctions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session=request.getSession();
		if(session.getAttribute("data")==null)
		{
			response.sendRedirect("Customerlogin.jsp");
			return;
		}
		String req=request.getParameter("submit");

		if(req.equals("Update"))
		{
		Customer c=(Customer)session.getAttribute("data");
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		String Address=request.getParameter("address");	
		if(request.getParameter("pincode").length()!=6)
		{
			response.sendRedirect("editdetails.jsp");
			session.setAttribute("error", "Give a valid Pincode");
			return;
		}
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		String gender="";
		if(request.getParameter("gender")==null)
		{
			
			session.setAttribute("error", "Select gender");
			response.sendRedirect("editdetails.jsp");
			return;
			
		}
		int genderint=Integer.parseInt(request.getParameter("gender"));	
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
			gender="other";
		}

		String Phone=request.getParameter("phone");	
		String DOB=request.getParameter("dob");	
		String city=request.getParameter("city");	
		String state=request.getParameter("state");	
		
		c.setName(name);c.setEmail(email);c.setCity(city);c.setDob(DOB);c.setGender(gender);
		c.setPhone(Phone);c.setPassword(password);c.setPincode(pincode);c.setState(state);
		c.setAddress(Address);
		String id="";
		id=c.getID();
		
		
		com.mybank.dao.CustomerFunctions sql=new com.mybank.dao.CustomerFunctions();
		int result=sql.update(c,id );
		if(result!=0)
		{
			session.setAttribute("data", c);
			session.setAttribute("update", "successfully updated the data");
			response.sendRedirect("editdetails.jsp");
			return;
			
		}
		else
		{
			session.setAttribute("feeback","something is wrong");
			response.sendRedirect("editdetails.jsp");
			return ;
		}
		
		
		
		
		}

		
		System.out.println(req);
		
		
		if(req.equals("Deposit"))
		{
			
			
			
			int	balance=Integer.parseInt(request.getParameter("deposit"));
			
			com.mybank.dao.CustomerFunctions sql=new com.mybank.dao.CustomerFunctions();
			Customer c=(Customer)session.getAttribute("data");
		    
			int id=Integer.parseInt(c.getID());
			
			int i=sql.deposit(balance+ c.getBalance(),id);
			
			if(i!=0)
			{
				session.setAttribute("deposit","successfully deposited money in your account");
				Customer c1=sql.getData(c.getEmail());
				session.setAttribute("data",c1);
				
				response.sendRedirect("Deposit.jsp");
				return ;
			}
			else
				
			{
				session.setAttribute("error","something is wrong");
				response.sendRedirect("Deposit.jsp");
				return ;
			}
			}
		
		
		
		
		if(req.equals("withdraw"))
		{
			if(session.getAttribute("data")==null)
			{
				response.sendRedirect("Customerlogin.jsp");
				return;
			}
			com.mybank.dao.CustomerFunctions sql=new com.mybank.dao.CustomerFunctions();

			Customer c=(Customer)session.getAttribute("data");
			int available =c.getBalance(); 
			int withdraw=Integer.parseInt(request.getParameter("withdraw"));
			if((available-withdraw)<0)
			{
				session.setAttribute("error", "You don't have sufficient funds to Withdraw");
				response.sendRedirect("withdraw.jsp");
				return;
			}
			else
			{
				if((available-withdraw)<5000)
				{
					session.setAttribute("error", "You cant withdraw because you need to maintain a minimum of 5000 as balance");
					response.sendRedirect("withdraw.jsp");
					return;
				}
				else
				{
					int id=Integer.parseInt(c.getID());
					
					int i=sql.withdraw((available-withdraw),id);
					
					if(i!=0)
					{
						session.setAttribute("deposit","successfully Withdrawal from your in your account");
						Customer c1=sql.getData(c.getEmail());
						session.setAttribute("data",c1);
						response.sendRedirect("Deposit.jsp");
						return ;
					}
					else
						
					{
						session.setAttribute("error","something is wrong");
						response.sendRedirect("Deposit.jsp");
						return ;
					}
				}
			}
		}
		
		
		if(req.equals("close"))
		{
			if(session.getAttribute("data")==null)
			{
				response.sendRedirect("Customerlogin.jsp");
				return;
			}
			Customer c=(Customer)session.getAttribute("data");
			int userid=Integer.parseInt(c.getID());
			com.mybank.dao.CustomerFunctions sql=new com.mybank.dao.CustomerFunctions();
			int i=sql.delete(userid,c);
			if(i!=0)
			{
				session.invalidate();
				PrintWriter out=response.getWriter();
				out.println("<script>alert(\"Account Successfully Closed \")</script>");
				try {
					TimeUnit.SECONDS.sleep(4);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("Index.html");
				return;
			}
			else
			{
				session.setAttribute("error","something is wrong");
				response.sendRedirect("AccountClose.jsp");
				return ;
			
			}
			

			
			
		}
		
		if(req.equals("transfer"))
		{
			if(session.getAttribute("data")==null)
			{
				response.sendRedirect("Customerlogin.jsp");
				return;
			}
			com.mybank.dao.CustomerFunctions sql=new com.mybank.dao.CustomerFunctions();

			Customer send=(Customer)session.getAttribute("data");
			String  recname=request.getParameter("name");
			String recnumber=request.getParameter("number");
			int amount=Integer.parseInt(request.getParameter("amount"));
			if(amount>send.getBalance())
			{
				session.setAttribute("error","you do not have sufficient funds to transfer");
				response.sendRedirect("transfer.jsp");
				return ;
			}
			else
			{
			if((send.getBalance()-amount)<5000)
			{
				session.setAttribute("error", "You cant Transfer because you need to maintain a minimum of 5000 as balance");
				response.sendRedirect("transfer.jsp");
				return;
			}
			else
			{
				int i=0;
				i=sql.transfer(send,recname,recnumber,amount);
				if(i!=0)
				{
					Customer c1=sql.getData(send.getEmail());
					session.setAttribute("transfer", "Successfully transfered amount ");
					session.setAttribute("data", c1);
					response.sendRedirect("transfer.jsp");
					return;
				}
				else
				{
					session.setAttribute("error", "Either your the Given Name or Given Account Number is wrong ");
					response.sendRedirect("transfer.jsp");
					return;
				}
			}
			}
			
		
		}
		
		if(req.equals("check"))
		{
			if(session.getAttribute("data")==null)
			{
				response.sendRedirect("Customerlogin.jsp");
				return;
			}
			com.mybank.dao.CustomerFunctions sql=new com.mybank.dao.CustomerFunctions();

			String fdate=request.getParameter("fdate");
			Customer c=(Customer)session.getAttribute("data");
			String ldate=request.getParameter("ldate");
			System.out.println(fdate);
			ResultSet rs=sql.getRecords(Integer.parseInt(c.getID()), fdate, ldate);
			
			session.setAttribute("result", rs);
			
			//select  * from records  where senderID=6178 Or recieverID=6178  And date between '2021/05/30' and '2021/06/31 ' order by date;

			if(session.getAttribute("result")!=null)
			{
				//session.setAttribute("error", "something is wrong Contact Admin");
				response.sendRedirect("Statement.jsp");
				return;
			}
			else
			{
				session.setAttribute("error", "something is wrong Contact Admin");
				response.sendRedirect("Statement.jsp");
				return;
			}
			
		}
		
			

			
			
			
			
			
			
			
			
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
