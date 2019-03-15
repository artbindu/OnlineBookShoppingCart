<%@include file="usermenu.html"%>

<center><br><br><br><br>
<form action="userprofile.jsp" method=get>
<%
	String id= (String)session.getAttribute("userid");
%>
	<input type="hidden" name="id" value="<%out.println(id);%>" >
	Enter Profile Password: <input type="password" name="pass" placeholder="   Enter your password" required> <br><br><br>
<input type=submit value="check password">
<form>
</center>
