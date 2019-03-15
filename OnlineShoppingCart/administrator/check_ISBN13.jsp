
<%@include file="admin_connection.jsp"%>

<%
    try{
	String sid=request.getParameter("sid");
	PreparedStatement pst=con.prepareStatement("select * from "+db_product+" where ISBN13=?");
	pst.setString(1,sid);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	out.println("<font color=red>ISBN13 already exists</font>");
	else
	out.println("<font color=green>Valid ISBN13</font>");
	con.close();
	}
	catch(Exception e){}
%>