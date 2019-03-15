<%@include file="DBconnection.jsp"%>

<%
	String uid=request.getParameter("uid");
	String pass=request.getParameter("pass");
	try{
		Statement stmt=con.createStatement();
		String q2="select * from "+db_user+" where mailid='"+uid+"' and password='"+pass+"'";
		
		ResultSet rs=stmt.executeQuery(q2);
		if(rs.next())
		{
			session.setAttribute("userid",uid);
			session.setAttribute("uname",rs.getString("name"));
			
			response.sendRedirect("userhome.jsp");
			response.sendRedirect("usereditprofile.jsp");
			response.sendRedirect("userlogout.jsp");
			
			response.sendRedirect("addtowishlist.jsp");
			response.sendRedirect("userwishlist.jsp");
			response.sendRedirect("userwishlist_modify.jsp");

			response.sendRedirect("userwallet.jsp");
			response.sendRedirect("addmoneyinwallate.jsp");
			
			
			response.sendRedirect("addtocart.jsp");
			response.sendRedirect("usershoppingcart.jsp");
			response.sendRedirect("usershoppingcart_modify.jsp");
			//---------------------------------
			response.sendRedirect("paymentconfirmation.jsp");
			response.sendRedirect("walletpayment.jsp");
			response.sendRedirect("chakingpaymentconfirmation.jsp");
			
			response.sendRedirect("userproductbuy.jsp");
			
			
			response.sendRedirect("userorderdetails.jsp");
			response.sendRedirect("paymentorder.jsp");
			response.sendRedirect("paymentdone.jsp");
			
			response.sendRedirect("offer.jsp");
			response.sendRedirect("premium_entry.jsp");
			
		}
		else{	
%>
			<center><font color=red size=300%>Invalid userid or password</font>
			<%@include file="index.html"%>
			<center><b> <a href="forgetPassword.html">Forget Password</a></b></h2></center>
<%
		}
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}
%>
			
			