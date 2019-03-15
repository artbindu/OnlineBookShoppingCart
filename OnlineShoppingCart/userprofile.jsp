<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<h1>
<%
	String id= request.getParameter("id").trim();
	String pass=request.getParameter("pass").trim();
	//out.println(id);
	//out.println(pass);
	try{
		Statement stmt=con.createStatement();
		String q12="select * from "+db_user+" where MAILID like '"+id+"' and PASSWORD like '"+pass+"'";
		//out.println(q12);

		ResultSet rs= stmt.executeQuery(q12);
		int flag=0; 
		while(rs.next())
		{
			out.println("<br> Name	:	"+rs.getString("NAME"));
			out.println("<br> Phone No	:	"+rs.getString("pHONENO"));
			out.println("<br> Mail id	:	"+rs.getString("MAILID"));
			out.println("<br>DOB		:	"+rs.getString("DOB"));
			out.println("<br> Address	:	"+rs.getString(5));
			out.println("<br> Delivery Pincode	:	"+rs.getString(6));
		}
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}
%>
</h1><hr><hr><center>
<h3><b><a href="usereditprofile.jsp">Edit Profile Details</a></h3></b></center>

