<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>


<%
	String s1=request.getParameter("sid").trim();
	String s2=request.getParameter("userid").trim();

	if(s1.equals(s2))
	{
		String phno=request.getParameter("phno");
		String pass=request.getParameter("pass");
		try{
			Statement stmt=con.createStatement();
			String q2="select * from "+db_user+" where PHONENO='"+phno+"'";
			
			ResultSet rs=stmt.executeQuery(q2);
			int count=0;
			while(rs.next())
			{	count= count+1; 	}
		
			if(count==1)
			{
				String q3="update "+db_user+" set PREMIUM_USER='Yes' where MAILID='"+s2+"' and PASSWORD='"+pass+"' and PHONENO='"+phno+"'";
				int t= stmt.executeUpdate(q3);  
				if(t>0)	{					
%>
					<center><font size=200% color="GREEN">Welcome to Premium World for Special Offer </font><br>
<%	  			
					int offer_price=50;
					String q4="update "+db_user+" set WALLET=WALLET+'"+offer_price+"' where MAILID='"+s2+"' and PASSWORD='"+pass+"' and PHONENO='"+phno+"'";
					int t1= stmt.executeUpdate(q4); 
					if(t1>0)
					{ %><font size=5% color="#FF0066">you got <%out.println(offer_price);%>/- INR to add primium user<br></center>			
				<%	}
				}
				
			}
			else if(count>1) { %>	<font size=500%>As Your have two or more accout so you do not get offer</font><br>	<%		}
			else {%>	<font size=500%>Invalid Details</font><br>	<%	}
			
			con.close();
		}
		catch(Exception e)
		{	out.println(e);		}
	}
	else{
%>
		<body bgcolor="RED"><br>
			<h1><center>Fake User</center></h1>	
<%  } %>