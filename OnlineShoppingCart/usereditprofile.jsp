<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<%
	String id= (String)session.getAttribute("userid");
	//out.println(id);
	try{
		Statement stmt=con.createStatement();
		String q11="select * from "+db_user+" where MAILID like '"+id+"'";
		//out.println("query: "+q11);
		
		ResultSet rs= stmt.executeQuery(q11);		
		while(rs.next())
		{		
			String nm=rs.getString("NAME");
			String ph=rs.getString("pHONENO");
			String mail=rs.getString("MAILID");
			String addr=rs.getString("ADDRESS");
			String pin=rs.getString("PINCODE");
			String pass=rs.getString("PASSWORD");
			String dob=rs.getString("DOB");		
%>	
				<center><form action="userprofileupdatesms.jsp" method=post>
				<h1> Edit Your Profile Details</h1>
				<table border=0><h1>
<%
				out.println("<tr><td>Mail ID <font color=red>*</font>		:</td><td>	<input type=text name=uid value="+id+" readonly></td></tr><br><tr></tr><tr></tr>");
				out.println("<tr><td>Phone Num<font color=red>*</font>	:</td><td>	<input type=number name=phno value="+ph+" readonly></td></tr>");
				out.println("<tr><td>Name		:</td><td>	<input type=text name=nm value=\'"+nm+"\'></td></tr><br>");
				out.println("<tr><td>DOB<font color=red>*</font>		:</td><td>	<input type=date name=dob value=\'"+dob+"\' readonly></td></tr><br>");
				out.println("<tr><td>Address		:</td><td>	<textarea row=2 cols=20 name=addr>"+addr+"</textarea></td></tr><br>");
				out.println("<tr><td>ZIP Code	:</td><td>	<input type=number name=pincode value="+pin+"></td></tr><br>");
				out.println("<tr><td>Password	:</td><td>	<input type=password name=pass value="+pass+"></td></tr><br>");
%>			
							<tr></tr>
							<tr><td><td>	<input type=submit value=submit></td></tr>
				</h1></table></action><br><br></center>
				<h4><font color=red>* unchanged data</font></h4>
<%
		}	
		
		con.close();	
	}
	catch(Exception e)	
	{	out.println(e);	}
	
%>

