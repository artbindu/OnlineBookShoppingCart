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
			result11=rs11.getString("CART");	
		}
		String ss3=result11.trim();
		String arr11[]=ss3.split(" ");
		
		int flag=0;
		StringBuffer newcart=new StringBuffer("");
		for (int i=0; i<arr11.length; i++)
		{
			if(bid.equals(arr11[i]) && (flag==0))
			{	flag=1;		continue;	}
			else{
				newcart.append(arr11[i]);
				if(i<arr11.length-1) newcart.append(" ");
			}
		}
		//out.println(newcart);
		
		String qq2="update "+db_user+" set CART='"+newcart+"' where MAILID='"+uid+"'";		
		int t=stmt1.executeUpdate(qq2);
		if(t>0)
			out.println("<center><h1>Remove from Cart Successfully</h1></center><br><br><br>");	
		else	
			out.println("Not remove from Cart");
		
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}
	/* <a href="usershoppingcart.jsp?userid="out.println(uid);""/>GOTO CART</a> */
%>

<center><table border=0>
<tr>
	<td><form action="usershoppingcart.jsp" method=post>
		<center><input type=submit value="Go to Cart"></center>
	</form></td>
	<td></td><td></td><td></td>
	<td><form action="userhome.jsp" method=post>
		<center><input type=submit value="Continue Shopping"></center>
	</form></td>
</table></center>




