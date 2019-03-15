<%@page import="javax.servlet.http.*" %>
<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<%
	try{
		String sbook=request.getParameter("fbook").toUpperCase();	
		
		Statement stmt=con.createStatement();
		String q11="select * from "+db_product+" where TITLE like '%"+sbook+"%'";
	
		ResultSet rs= stmt.executeQuery(q11);
		int flag=0,count=0,images=4;
		%><center><table><tr><%
		while(rs.next())
		{
			if(flag==0)	{	flag=1;}
			if(count%images==0)	{	%></tr><tr><td><br><br></td></tr><tr><%	}
			count++;
			String ISBN10= rs.getString(1);
			String ISBN13= rs.getString(2);
			String title= rs.getString(3);
			String author= rs.getString(13);
			String arr_author[]=author.split(",");
			out.print("<td><center><a href=fetchBook.jsp?ISBN13="+ISBN13+">");
			%><img src="books_cover/<%out.println(rs.getString(14));%>"height=240 width=160/><br><br><%
			for (int ii=0; ii<arr_author.length; ii++)
				out.println(arr_author[ii]+"<br>");
			if(count%images!=0)	{%></center></a></td><td><font color=#99FFCC>. . . . . .  . . . . . . . . .</font></td><td></td><%}
			else {	%></center></a></td><%  }
		}
		%></tr><table></center><%
		if(flag==0) 
		{	
%>
			<body bgcolor="red">
			<center>
				<img src="img/noResult.png"><br>
				<font color=RED size=10%><b>we couldn't find any matches for '<%out.println(sbook);%>'</b><br>
				(search with book name)</font><br><br><br><h1>
				
				<form action="searchingBookResult.jsp" method=post>
					<input type=text name=fbook placeholder="Search by .Book Name..." required> 
					<input type=submit value="Search Again" > <br>			
				</form>
				
			</center></h1></body>
<%			
		}
		con.close();
	}
		catch(Exception e)
		{	out.println(e);	}

%>


