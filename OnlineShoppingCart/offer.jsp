<%@include file="DBconnection.jsp"%>

<%
	String id= (String)session.getAttribute("userid");
	try{		
		Statement stmt=con.createStatement();
		String q110="select * from "+db_user+" where MAILID like '%"+id+"%'";
	
		ResultSet rs= stmt.executeQuery(q110);
		String result="";
		while(rs.next())
		{
			result=rs.getString("PREMIUM_USER");	
		}
		if(result.equals("No")){
%>
		<a href="premium_entry.jsp"><img src="img/special-offer.gif" height="100" width="115"></a> <font size=8% color='#3399FF'><b>Join Primium User</b></font>
		</form>
<%
		}
		else{
%>
		<img src="img/discount-10.gif" height="100" width="103">
		<font color="GREEN" size=5%><b>Buy Book and get special offer of 10% discount</b></font>
		
<%			
		}
	}
	catch(Exception e)
	{	out.println(e);	}
	
%>
