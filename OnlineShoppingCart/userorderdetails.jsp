<%@include file="DBconnection.jsp"%>
<%@include file="usermenu.html"%>

<h3><b>
<%
	String id= (String)session.getAttribute("userid");
	try{
		Statement stmt=con.createStatement();
		String q11="select * from "+db_order+" where USER_ID like '%"+id+"%'";
		//out.println(q11);
		
		ResultSet rs= stmt.executeQuery(q11);	
		int count=0;
		String ss="",orderid,day,time,status;
		while(rs.next())
		{
			orderid=rs.getString("order_id");
			status=rs.getString("ORDER_STATUS");
			day="20"+orderid.substring(0,2)+"/"+orderid.substring(2,4)+"/"+orderid.substring(4,6);
			time=orderid.substring(6,8)+":"+orderid.substring(8,10)+":"+orderid.substring(10,12);
			%><center><form action="orderstatus.jsp" method=get>
				<table><tr><b> <input type=hidden value="<%out.println(orderid);%>" name="orderid">
				<td><b><%count++; out.println(count+".    Order id: </td><td>"+orderid);%></td></tr>
				<tr><td><b>Date: 	<%out.println(day);%></br>Time: <%out.println(time);%> </td>
				<td><b>Status: <%out.println(status);%><br><input type=submit value="details"></td></tr></table>
			</form><br><br><%
			
		}	
		if(count==0) 
		{
			String sms="No Order in your Account";
			String color="red";
			%><%@include file="middlepagesms.jsp"%><%		
		}
		con.close();	
	}
	catch(Exception e)	
	{	out.println(e);	}
	
%>
<h1>
