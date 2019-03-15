<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<h1><center><font color="RED">
<%
	String id= (String)session.getAttribute("userid");
	out.println("Under Maintenance");
	
%>
<h2><pre>
	Old Password: <input type=password name=oldpass placeholder="Input Old Password">
	New Passowrd: <input type=password name=newpass1 placeholder="Input New Password">
	Confirm New Password: <input type=password name=newpass2 placeholder="Confirm Password">
	<input type=submit value=submit>
</pre></h2>
