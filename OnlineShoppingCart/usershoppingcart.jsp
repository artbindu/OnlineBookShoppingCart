<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<h1><center>
<%
	String id= (String)session.getAttribute("userid");
	
	try{		
		Statement stmt=con.createStatement();
		String q110="select * from "+db_user+" where MAILID like '%"+id+"%'";
	
		ResultSet rs= stmt.executeQuery(q110);
		String result="";
		while(rs.next())
		{
			result=rs.getString("CART");	
		}
		String ssss= result.trim();
		String arr[]=ssss.split(" ");
		int l=arr.length;
		//out.println("length of cart: "+l+"<br>");
%>
			<br> Shopping Cart are: <br><br><br></center></h1>
			<center><table border=0>
				<tr>
					<td><center><b><font color="RED">Item</td><td></td><td><b><center><font color="RED">Product</td>
					<td><center><b><font color="RED">Price</td><td><center><b><font color="RED">Quentity</center></font></b></td>
				</tr><tr><tr>
<%
		int tprice=0,items=0;
		for (int i=0; i<l; i++)
		{	
			//out.println("<br>"+arr[i]+"<br>");
			String q="select * from "+db_product+" where ISBN13='"+arr[i].trim()+"'";
			ResultSet rs1= stmt.executeQuery(q);

			while(rs1.next())
			{
				String isbn13=rs1.getString("ISBN13");
				String item=rs1.getString("TITLE");
				String price=rs1.getString("PRICE");
				int pp=Integer.parseInt(price);
				tprice= tprice+pp;
				items=items+1;
%>
				<form action="usershoppingcart_modify.jsp" method=get>
				<tr>
					<td><center><b><%out.println(i+1);%></b></td>
					<td>
						<a href=fetchBook.jsp?ISBN13=<%out.println(isbn13);%>>
						<img src="books_cover/<%out.println(rs1.getString("COVER"));%>"height=60 width=40/></a></td>
					<td><input type="hidden" name="product_id" value="<%out.println(isbn13);%>" readonly>
						<input type="hidden" name="product_name" value="<%out.println(item);%>"><%out.println(item);%>
					</td>
					<td><input type=text name=price value="<%out.println(price);%>" readonly></td>
					<td><input type=number name=quentity value="1" readonly></td>
					<td><input type=submit value=remove></td></form>
				</tr><tr></tr>
<%
			}
		}
%>
					<tr></tr><tr></tr><tr></tr><tr></tr>
					<tr><td></td><td></td><td><b>Total Price :: </td><td><b><%out.println(tprice);%></b></td>
						<td><b>Total Items: <%out.println(items);%></b></td><td></td>
					</tr>
				</table><br><br><br>
				
	<form action="userproductbuy.jsp" form=post>
				<input type=hidden name=items value="<%out.println(items);%>">
				<input type=hidden name=tprice value="<%out.println(tprice);%>" >
				<input type=submit value=confirm>
	</form></center>
<%
		con.close();
	}
	catch(java.lang.NullPointerException   e1)
	{	out.println("<h1><center><font color=\"RED\">Your Cart is empty</font></h1>");	}
	catch(Exception e)
	{	out.println(e);	}
	
%>


