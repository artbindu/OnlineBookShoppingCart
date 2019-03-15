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
			result=rs.getString("WISHLIST");	
		}
		String arr[]=result.split(" ");
		int l=arr.length;
%>
		<br><font color=green>::  Wish List  :: </font><br></center></h1>
		<center><table border=0>
<%
		for (int i=0; i<l; i++)
		{	
			String q="select * from "+db_product+" where ISBN13='"+arr[i]+"'";
			ResultSet rs1= stmt.executeQuery(q);
			while(rs1.next())
			{
				String isbn13=rs1.getString("ISBN13");
				//out.println(isbn13);
				String tit=rs1.getString("TITLE");
				String auth=rs1.getString("AUTHOR");
				%>
						<tr><td><input type="hidden" name="product_id" value="<%out.println(isbn13);%>" readonly></td>
				<%
				out.print("<td><b>"+(i+1)+".</b></td><td><a href=fetchBook.jsp?ISBN13="+arr[i]+">");
				%><img src="books_cover/<%out.println(rs1.getString("COVER"));%>"height=60 width=40/></td><td><%
				out.println("<b>"+tit+"</b><br>"+auth+"</a></td>");
				%>  <td></td><td></td>
					<td><form action="userwishlist_modify.jsp" method=get>
						<input type=hidden name="product_id" value="<%out.println(isbn13);%>" readonly>
						<center><input type=submit value=remove></center></form>
					</td><td></td><td></td>
				
					<td><form action="addtocart.jsp" method=get>
						<input type=hidden name="isbn" value="<%out.println(isbn13);%>" readonly>
						<center><input type=submit value="add to cart"></center></form>
					</td>
				</tr><br><%
			}
		}%></table></center><br><br><br><br><%
		con.close();
	}
	catch(java.lang.NullPointerException   e1)
	{	out.println("<h1><center><font color=\"RED\">Your wish list is empty</font></h1>");	}
	catch(Exception e)
	{	out.println(e);	}
	
%>
