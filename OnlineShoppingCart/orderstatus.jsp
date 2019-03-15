<%@include file="DBconnection.jsp"%>


<%
	String orderid=request.getParameter("orderid");
	//out.println(orderid);
	String products="";
	
	try{
		Statement stmt=con.createStatement();
		
		String q11="select * from "+db_order+" where ORDER_ID='"+orderid.trim()+"'";
		ResultSet rs= stmt.executeQuery(q11);	
		while(rs.next())
		{
			products=rs.getString("PRODUCTS");
		
			String arr[]=products.split(" ");
			int l=arr.length;
			%><table><tr><td><h1>Products:</td><td><%
			for (int i=0; i<l; i++)
			{
				String q112="select * from "+db_product+" where ISBN13='"+arr[i].trim()+"'";
				ResultSet rs1=stmt.executeQuery(q112);
				while(rs1.next())
				{	
				%>
					<a href=fetchBook.jsp?ISBN13=<%out.println(arr[i].trim());%>>
						<img src="books_cover/<%out.println(rs1.getString("COVER"));%>"height=120 width=80/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</a>
			<%	}
			}%></td></tr></table><%
		}
		con.close();
	}catch(Exception e)
	{ out.println(e); }
	
%>