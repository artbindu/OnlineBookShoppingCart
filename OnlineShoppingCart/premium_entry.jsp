<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<%
	String id= (String)session.getAttribute("userid");
%>
	<p><font size=300% color="#00FF00" >
		<center>Join Primium Membership <br> & <br> Get Special offer form this Online Shopping System</center>
	</p></font>
	
	<form action="premium_verification.jsp" method=get>
	<h1>Enter Your details properly</h1><br>
		<input type=hidden name=sid value="<%out.println(id);%>"><br>
			<pre>
		mail id:        <input type=text name=userid><br>
		mobile no:      <input type=number name=phno><br>
		password:	<input type=password name=pass><br><br>
					<input type=submit value=varified>
	</form>
