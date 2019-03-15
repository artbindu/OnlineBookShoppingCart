<%@include file="DBconnection.jsp"%>
<%@include file="autogenerate_orderid.jsp"%>
<%@include file="usermenu.html"%>

<h1><center>
<%
	String id= (String)session.getAttribute("userid");
	//out.println(datetime);
	try{		
		Statement stmt=con.createStatement();
		String q1="select * from "+db_user+" where MAILID like '"+id+"'";
	
		int wallet=0;	int cashback=0;
		String ph_no="", addr="", pin="",prime="",products="";
		ResultSet rs= stmt.executeQuery(q1);
		while(rs.next())
		{
			ph_no=rs.getString("PHONENO");
			addr=rs.getString("ADDRESS");
			pin=rs.getString("PINCODE");
			prime=rs.getString("PREMIUM_USER");
			wallet=Integer.parseInt(rs.getString("WALLET"));
			products=rs.getString("CART").trim();
			break;
		}
		datetime.append(ph_no);
		
		String orderid=datetime.toString();
		String items=request.getParameter("items");
		String totalprice=request.getParameter("tprice").trim();
		int flag=0;
		if(prime.equals("Yes"))		{ cashback=Integer.parseInt(totalprice)/10;	flag=1;}
		else	{	cashback=0;		}
		//out.println(orderid);
		//out.println(addr);
		//out.println(pin);
		//out.println(cashback);
		
		/*show here all books font images*/
		String arr[]=products.split(" ");
		for (int i436=0; i436<arr.length; i436++)
		{ //out.println(arr[i436]); 
			int h=150,w=100;
			%><%@include file="showproductimage.jsp"%><%
		}		
%>
	<center><h2>Order Confermation Page</h2>
	<form action="paymentconfirmation.jsp" method=get>
		<input type=hidden value="<%out.println(products);%>" name="products">
	<table border=0>
		<tr>
			<td>Contact Details:</td><td><input type=text name="phno" value="<%out.println(ph_no);%>"></td>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td>Your Order id:</td><td><input type=text name=orderid value='<%out.println(orderid);%>'></td>
		</tr>
		<tr>
			<td>Delivery Address:</td><td><textarea row=50 cols=20 name="daddr"><%out.println(addr);%></textarea></td>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td>Total Items:</td><td><input type=text name=items value='<%out.println(items);%>' readonly></td>
		</tr>
		<tr>
			<td>Pincode:</td><td><input type=text name="pin" value='<%out.println(pin);%>'></td>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td>Total Cash: </td><td><input type=text name=tcash value='<%out.println(totalprice);%>' readonly></td>
		</tr>
		<tr>
			<td>LandMark:</td><td><textarea row=50 cols=20 name="landmark"> </textarea></td>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td> <%  if(flag==1){%>
					Membership Cashback(10% off):<font color="RED">***</font></td><td><input type=text name=wback value='<%out.println(cashback);%>' readonly>
				<%}	else if(flag==0) {%>
					</td><td><input type="hidden" name=wback value="0" readonly><% } %>
			</td>
		</tr>
	</table><br>
	<table><tr><td><b>Use Wallet Balance <%out.println(wallet);%> :: </b></td>		
		<td><select name=wallet_cash>
				<option value=<%out.println(wallet);%> selected="selected">Use</option>
				<option value=<%out.println(0);%> >Not Use</option>
			</select>
		</td></tr>
	</table><br>
			<input type=submit value="Payment"></form>
	</center><%  if(flag==1){%>
	<table><tr><td><font color="RED">***Membership Cashback Offer. 10% Cahback.</font></td></tr></table><%}%>	
<%	
		con.close();
	}
	catch(Exception e)
	{	out.println(e);	}
%>


