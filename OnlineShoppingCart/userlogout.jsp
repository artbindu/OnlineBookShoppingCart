<%@include file="DBconnection.jsp"%>
<%
	String id= (String)session.getAttribute("userid");
	session.invalidate();
%>
<center><font size=100% color=red>Thank You Vigit Again</font></center></br></br> 
<%@include file="index.html"%>



