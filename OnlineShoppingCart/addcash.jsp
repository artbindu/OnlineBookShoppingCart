<%@include file="DBconnection.jsp"%>
<%@include file="autogenerate_orderid.jsp"%>
<%@include file="usermenu.html"%>

<h1><center>
<%
	String uid=request.getParameter("id");
	//out.println(datetime);
	String userid=uid.trim();
	try{		
		Statement stmt=con.createStatement();
		String q1="select * from "+db_user+" where MAILID like '%"+userid+"%'" ;
		//out.println(q1);
	
		int cashback=0;
		String ph_no="", addr="", pin="",prime="";
		ResultSet rs= stmt.executeQuery(q1);
		if(rs.next())
		{
			ph_no=rs.getString("PHONENO");
			addr=rs.getString("ADDRESS");
			pin=rs.getString("PINCODE");
			prime=rs.getString("PREMIUM_USER");	
		}
		datetime.append(ph_no);
		String orderid=datetime.toString();	
%>		

	<form action="addcash1.jsp" method=get>
	
		<input type=readonly name="phno" value='<%out.println(ph_no);%>'><br>
		<input type=readonly name="orderid" value='<%out.println(orderid);%>'><br>
		<input type=readonly name="daddr" value='<%out.println(addr);%>'><br>
		<input type=readonly name=items value='0'><br>
		<input type=readonly name="pin" value='<%out.println(pin);%>'><br>
		<input type=readonly name="landmark" value=''><br>
		<input type="hidden" name=wback value='<%out.println(cashback);%>'>
		<input type="hidden" name="wallet_cash" value="0"><br>
		
		Amount: <input type=number name=tcash><br><br><br>
			<input type=submit value="Payment">
	</form>
<%
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}
%>



