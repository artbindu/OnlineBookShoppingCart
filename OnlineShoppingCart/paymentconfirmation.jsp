<%@include file="usermenu.html"%>


<center><br><br><br><br><br><br><br><br><br><b>
<table><tr><td>
<%
	String id= (String)session.getAttribute("userid");
	int pcash,wcash,cashback;
	wcash=Integer.parseInt(request.getParameter("wallet_cash"));
	pcash=Integer.parseInt(request.getParameter("tcash"));	
	cashback=Integer.parseInt(request.getParameter("wback"));
	pcash=pcash-cashback;
	String contact=request.getParameter("phno");
	String addr=request.getParameter("daddr").trim()+"<br>"+request.getParameter("landmark").trim();
	String pin=request.getParameter("pin");
	String orderid=request.getParameter("orderid");
	String products=request.getParameter("products");
	//out.println(products);
	//out.println("wallet cash: "+wcash);
	
	if(wcash>=pcash)
	{%>
		<form action="walletpayment.jsp" method=get><b> 
			Your Wallet Cash:</td><td> <input type=readonly value=<%out.println(wcash);%> name=wcash><br></td></tr><tr><td><b> 
			<input type=hidden value="<%out.println(products);%>" name=products>
			<input type=hidden value=<%out.println(orderid);%> name=orderid>
			You Have to Pay:</td><td> <input type=readonly value=<%out.println(pcash);%> name=pcash></td></tr></table><br><br><br>
			<input type=submit value="confirm order" >
		</form>
		<% 
	}
	else{%>
		<form action="cardpayment.jsp" method=get><b> 
			Use Wallet Cash: </td><td><input type=readonly value=<%out.println(wcash);%> name=wcash><br></td></tr><tr><td><b> 
			<input type=hidden value="<%out.println(products);%>" name=products>
			<input type=hidden value=<%out.println(orderid);%> name=orderid>
			Withrow Amt.: </td><td><input type=readonly value=<%out.println(pcash);%> name=pcash></td></tr></table><br><br><br><br>
			<input type=submit value="confirm order by card">
		</form>
		<% 
	}
%>	

</center>



	