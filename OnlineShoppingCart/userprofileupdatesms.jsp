<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<%
	String userid=request.getParameter("uid");
	String nm=request.getParameter("nm");
	String addr=request.getParameter("addr");
	String pin=request.getParameter("pincode");
	String phno=request.getParameter("phno");
	String pass=request.getParameter("pass");
	String dob=request.getParameter("dob");
	
	try{
		String qq="update "+db_user+" set NAME='"+nm+"', ADDRESS='"+addr+"', PINCODE='"+pin+"', PHONENO='"+phno+"', PASSWORD='"+pass+"', DOB='"+dob+"' where MAILID='"+userid+"'";
		Statement stmt=con.createStatement();
		
		int t= stmt.executeUpdate(qq);		
		if(t>0)
			%>	<center><h1>Profile Update Successfully<h1></center><br><br><br>	<%
		
		con.close();	
	}
	catch(Exception e)	
	{	out.println(e);	}
%>

