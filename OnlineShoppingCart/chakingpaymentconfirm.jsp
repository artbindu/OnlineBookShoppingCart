<%@include file="DBconnection.jsp"%>

<%

		String uid= (String)session.getAttribute("userid");
		//out.println(uid);
		
		int wcash,modify_pcash;
		wcash=Integer.parseInt(request.getParameter("wcash"));
		modify_pcash=Integer.parseInt(request.getParameter("modify_pcash"));
		String orderid=request.getParameter("orderid");
		String products=request.getParameter("products");
		
		
	String owner=request.getParameter("owner");
	String cvv=request.getParameter("cvv");
	String cardNumber=request.getParameter("cardNumber");
	String expdate=request.getParameter("emonth")+"/"+request.getParameter("eyear");
	
%>

<%@include file="chaking_card_details.jsp"%>


<%
	int t1=0,t2=0;
	if(paymentyes==1)
	{
		//out.println(wcash);
		int modify_wcash=wcash;
		%>
			<%@include file="modifiedwallet.jsp"%>
			<%@include file="clearcart.jsp"%>
		<%
		out.println("  t1= "+t1+" and t2= "+t2+"          ");
		
		if(t1==1 && t2==1)
		{
			String ptype="Card";
			int amt=wcash+modify_pcash;
			String pystatus="done";
			String pdetails=owner+" "+cardNumber+" "+expdate+" "+cvv;
			%>
				<%@include file="ordertableimport.jsp"%>
			<%
		}
		else if(t1==0 && t2==0)
		{  
			sms="Order did not Confirm<br>Pleae Chack your Balance/Contact with Coustomar Care";	
			color="red";
			%><%@include file="middlepagesms.jsp"%><%		
		}
		else{out.println("see code problem in code"); }
	}
%>