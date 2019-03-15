<%@include file="DBconnection.jsp"%>

<pre><body  bgcolor="#CCFFFF"><h3>
<%
	String bookid=request.getParameter("ISBN13");
	try{
		PreparedStatement pst=con.prepareStatement("select * from "+db_product+" where ISBN13 like(?)");
		pst.setString(1,bookid);
		int flag=0;
		ResultSet book= pst.executeQuery();
		while(book.next())
		{
			out.println("<center><font color=RED><h1><u><b>"+book.getString(3)+"</font></u></b></h1>");
			String book_image=book.getString(14);
			/*out.println("book image name= "+book_image+"<br>");*/
			%><center><table><tr><td>  </td><td>
			<img src="books_cover/<%out.println(book_image);%>" height=360 width=240/><br></td><td></td><td><h2><%
			out.println("<center><u>Book Details</u></center><font color=\"green\">");
			out.println("<br><font color=red>ISBN10</font>		:	"+book.getString(1));
			out.println("<br><font color=red>ISBN13</font>		:	"+book.getString(2));
			out.println("<br><font color=red>Title</font>		:	"+book.getString(3));
			out.println("<br><font color=red>author</font>		:	"+book.getString(13));
			out.println("<br><font color=red>Publication</font>	:	"+book.getString(4));
			out.println("</font><br> Edition	:	"+book.getString(5));
			out.println("<br> Language	:	"+book.getString(6));
			out.println("<br> Dimension	:	"+book.getString(7));
			out.println("<br> Price		:	"+book.getString(8)+"/- INR");
			out.println("<br> Category	:	"+book.getString(9));
			out.println("<br> Sub Category	:	"+book.getString(10));
			out.println("<br> Rating		:	"+book.getString(11)+" (Out of 10)");
			out.println("<br> About		:	"+book.getString(12));%></h2></td></tr><%
						
			flag=1;
		}	
		if(flag==0)	{	out.println("Invalid Searching ISBN13 Number");		}
		con.close();
	}
	catch(Exception e)	{	out.println(e);	}

%>
<tr><td><br><br><br></td></tr>
<tr><td></td><td></td>
	<td><form action="addtowishlist.jsp" method=get>
			<input type=hidden name=isbn value="<% out.print(bookid);%>" >
			<input type=submit value="Add WishList">
		</form></td><td>
		<form action="addtocart.jsp" method=get>
			<input type=hidden name=isbn value="<% out.print(bookid); %>" >
			<input type=submit value="Add Cart">
		<form>
	</td>
</tr></table></center></body>











		