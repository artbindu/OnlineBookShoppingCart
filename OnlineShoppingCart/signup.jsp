<%@include file="DBconnection.jsp"%>

<%
	try{
		PreparedStatement pst=con.prepareStatement("insert into "+db_user+"(mailid,password,name,address,pincode,phoneno,wallet,PREMIUM_USER,COUNT_ORDER,DOB) values(?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1,request.getParameter("uid").trim());
		pst.setString(2,request.getParameter("pass").trim());
		pst.setString(3,request.getParameter("nm").trim());
		pst.setString(4,request.getParameter("addr".trim()));
		pst.setString(5,request.getParameter("pincode").trim());
		pst.setString(6,request.getParameter("phno").trim());
		pst.setString(7,"0");
		pst.setString(8,"No");
		pst.setString(9,"0");
		pst.setString(10,request.getParameter("dob"));
		
		out.println("<center><h1>");
		int t=pst.executeUpdate();
		if(t>0)
			out.println("Successfully Register");
		else if(t==0)
			out.println("Invalid User id or Phone Number");
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}		
%>
<br>
<a href="index.html">Login</a>
