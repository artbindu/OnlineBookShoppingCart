
<%
	String aid=request.getParameter("uid");
	String pass=request.getParameter("pass");
	if(aid.equals("artbindu") && pass.equals("k5w5tc17ux"))
	{
%>
		<center>
		<form action="admin_book_import.jsp" method=post>
		Are You Import Book?
		<input type=hidden name=f1 value="key_is_@ccept">
		<input type=submit value=Yes>
		</form>
<%
	}
	else if(aid.equals("administrator") && pass.equals("administrator"))
	{
%>
		<center>
		<form action="admin_book_import.jsp" method=post>
		Are You Import Book?
		<input type=hidden name=f1 value="key_is_@ccept">
		<input type=submit value=Yes>
		</form>
<%
	}
	else	
	{
		out.println("<center><h1><font color=RED> Invalid Administration id or password ");
	}
%>