<%@include file="DBconnection.jsp"%>


<%
	String userid=request.getParameter("userid");
	String phno=request.getParameter("phno");
	String dob=request.getParameter("dob");
	String q="";   int flag=1;

	try{
		if(dob.equals(""))
		{	q="select * from "+db_user+" where MAILID like '"+userid+"' and PHONENO like '"+phno+"'";	}
		else if(phno.equals(""))
		{	q="select * from "+db_user+" where MAILID like '"+userid+"' and DOB like '"+dob+"'";	}
		
		//out.println(q);
		Statement stmt=con.createStatement();
		ResultSet rs= stmt.executeQuery(q);
		
		while(rs.next())
		{	flag=0;
%>	
		<%@include file="security.jsp"%>
<%
			String qq="update "+db_user+" set PASSWORD='"+auto_password.toString()+"' where MAILID like '"+userid+"'" ;
			//out.println(qq);
			int t=stmt.executeUpdate(qq);
			if(t>0){
				String new_pass="";
				//new_pass=auto_password.toString();
				
				String q1="select * from "+db_user+" where MAILID like '"+userid+"'";
				//out.println(q1);
				ResultSet rs1= stmt.executeQuery(q1);
				while(rs1.next())
				{	new_pass=rs1.getString("PASSWORD");		}
%>

			<center><br><br><br><br>		
				Your Password: <b><%out.println(new_pass);%></b><br><br><br>
				<b><a href="index.html">sign in</a></b></h2>
			</center>
<%			}
			else{ out.print("Problem to generate auto password");	}
		}	con.close();
		if(flag==1){	
%>	
		<center><br><br><br><br>		
			<h1>Invalid Data</h1>
			<b>NewUser?  <a href="signup.html">sign up</a></b></h2>
		</center>
<%		}		
	}catch(Exception e)
	{	out.println(e);	}
%>