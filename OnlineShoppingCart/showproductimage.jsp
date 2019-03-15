
<%
	String q436="select * from "+db_product+" where ISBN13='"+arr[i436].trim()+"'";
	ResultSet rs436=stmt.executeQuery(q436);
	if(rs436.next())
	{	
	%>
		<a href=fetchBook.jsp?ISBN13=<%out.println(arr[i436].trim());%>>
			<img src="books_cover/<%out.println(rs436.getString("COVER"));%>"height="<%out.println(h);%>" width="<%out.println(w);%>"/>
		</a>
	<%}
%>