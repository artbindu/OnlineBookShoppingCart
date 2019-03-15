<%@page import="java.sql.*" %>

<%!	Connection con=null;	%>

<%
	String db_admin= "ARTBINDU_BOOK_ADMIN";
	String db_product="ARTBINDU_BOOK_PRODUCTINFO";
	String f2= "key_is_@ccept";
	try
	{
		Class.forName("oracle.jdbc.OracleDriver");  
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","123456");    
	}
	catch(Exception e)	
	{
		out.println("print Exception: "+e);
	}	
%>
		