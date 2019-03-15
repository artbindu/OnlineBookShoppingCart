<%@include file="admin_connection.jsp"%>

<%
	String f1=request.getParameter("f1");
	if(f1.equals(f2))
	{
%>
	<center><font size=100% color="violate">WELCOME FOR BOOK IMPORT</font></h1></center>
	<form action="book_insert.jsp" method=post>
	
	<%@include file="BookImportDetails.html"%>
	<center>	<input type=submit value=submit>
	</form>
<%
	}
	else{
		out.println("<body bgcolor=RED><center><h1> Don't try to Hack it");
	}
%>
			
			