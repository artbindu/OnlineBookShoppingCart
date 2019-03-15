
<%@include file="DBconnection.jsp"%>

<%
    try{
	String sid=request.getParameter("sid");
	PreparedStatement pst=con.prepareStatement("select * from "+db_user+" where mailid=?");
	pst.setString(1,sid);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	out.println("<font color=red>Invalid already exists</font>");
	con.close();
	}
	catch(Exception e){}
%>