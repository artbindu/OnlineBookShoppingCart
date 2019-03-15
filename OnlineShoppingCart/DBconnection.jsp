<%@page import="java.sql.*" %>

<%!	Connection con=null;	%>

<%
	String db_user= "ARTBINDU_BOOK_USERINFO";
	String db_product="ARTBINDU_BOOK_PRODUCTINFO";
	String userBanks="ARTBINDU_CARDDETAILS";
	String db_order="ARTBINDU_ORDERDETAILS";
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
		