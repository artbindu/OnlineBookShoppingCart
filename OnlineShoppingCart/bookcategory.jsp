<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<h1><center><font color="RED">
<%
	String id= (String)session.getAttribute("userid");
	out.println("Under Maintenance");
	
	
	
%>
<br><br>
	<form action="searchingBookResult.jsp" method=post>
		<input type=hidden name=fbook placeholder="Search by .Book Name..."> 
		<input type=submit value="Search All Books" >	
	</form>
