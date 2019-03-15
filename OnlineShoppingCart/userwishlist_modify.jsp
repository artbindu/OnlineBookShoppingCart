<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>


<%
	String uid=(String)session.getAttribute("userid");
	String bid=request.getParameter("product_id").trim();
	
	try{		
		Statement stmt1=con.createStatement();
		String q111="select * from "+db_user+" where MAILID like '%"+uid+"%'";
	
		ResultSet rs11= stmt1.executeQuery(q111);
		String result11="";
		while(rs11.next())
		{
			result11=rs11.getString("WISHLIST");	
		}
		String arr11[]=result11.split(" ");
		
		int flag=0;
		StringBuffer newwishlist=new StringBuffer("");
		for (int i=0; i<arr11.length; i++)
		{
			if(bid.equals(arr11[i]) && (flag==0))
			{	flag=1;		continue;	}
			else{
				newwishlist.append(arr11[i]);
				newwishlist.append(" ");
			}
		}
		//out.println(newwishlist);
		
		String qq2="update "+db_user+" set WISHLIST='"+newwishlist+"' where MAILID='"+uid+"'";		
		int t=stmt1.executeUpdate(qq2);
		if(t>0)
			out.println("<center><h1>Remove from Wish-List Successfully</h1></center><br><br><br>");	
		else	
			out.println("Not remove from Wish-List");
		
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}
%>

<center><table border=0>
<tr>
	<td><form action="userwishlist.jsp" method=post>
		<center><input type=submit value="Go to WishList"></center>
	</form></td>
	<td></td><td></td><td></td>
	<td><form action="userhome.jsp" method=post>
		<center><input type=submit value="Continue Shopping"></center>
	</form></td>
</table></center>




