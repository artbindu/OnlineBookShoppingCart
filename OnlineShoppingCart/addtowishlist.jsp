<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<%	
	String userid= (String)session.getAttribute("userid");
	try{
		String bookid=request.getParameter("isbn").concat(" ");
		//out.println("Book id= 	"+bookid+"	User id= "+userid+"<br><br><br>");
		String qq1="select * from "+db_user+" where MAILID like '"+userid+"'";
		//out.println("query1: "+qq1+"<br><br><br>");
		Statement stmt=con.createStatement();
		
		ResultSet rs=stmt.executeQuery(qq1);
		String show_result= " ";
		while(rs.next())
		{
			show_result=rs.getString("WISHLIST");	
			break;
		}
		//out.println("Show wish List: "+show_result+"<br><br><br>");
		
		String ss=bookid.concat(show_result);
		String qq2="update "+db_user+" set WISHLIST='"+ss+"' where MAILID='"+userid+"'";		
		int t=stmt.executeUpdate(qq2);
		if(t>0)
			out.println("<center><h1>Add to Wish List Successfully</h1></center><br><br><br>");	
		else	
			out.println("Not add to wish list");
		con.close();
	}
	catch(java.lang.NullPointerException	e1)
	{
		String bookid1=request.getParameter("isbn");
		Statement stmt=con.createStatement();
		String qq22="update "+db_user+" set WISHLIST='"+bookid1+"' where MAILID='"+userid+"'";
		int t=stmt.executeUpdate(qq22);
		if(t>0)
			out.println("<center><h1>Add to Wish List Successfully</h1></center><br><br><br>");	
	}
	catch(Exception e)
	{	out.println(e); 	}	
	
	
	
%>	

<center><table border=0>
<tr>
	<td><form action="userhome.jsp" method=post>
		<center><input type=submit value="Continue Shopping"></center>
	</form></td>
	<td></td><td></td><td></td>
	<td><form action="userwishlist.jsp" method=post>
		<center><input type=submit value="Go to WishList"></center>
	</form></td>
</table></center>