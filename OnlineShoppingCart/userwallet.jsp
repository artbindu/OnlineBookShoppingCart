<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<h1>
<%
	String id= (String)session.getAttribute("userid");
	//out.println(id);
	try{
		Statement stmt=con.createStatement();
		String q11="select WALLET from "+db_user+" where MAILID like '"+id+"'";
		//out.println("query: "+q11);
		
		ResultSet rs= stmt.executeQuery(q11);		
		while(rs.next())
		{
%>
			<center><br><br>
			<img src="img/wallet1.gif" height="100" width="100"   >
			<font size=100% color="GREEN"> Balance: <%out.println("    "+rs.getString(1));%></font>
			<img src="img/INR.gif" height="70" width="70"   >
<%
		}		
		con.close();	
	}
	catch(Exception e)	
	{	out.println(e);	}
	
%>
<center><br><br>
	<form action="addcash.jsp" method=get>
		<input type="hidden" name=id value='<%out.println(id);%>'>
		<input type=submit value="add cash">
	</form>
</center>

