<%@include file="DBconnection.jsp"%>

<%

	String uid= (String)session.getAttribute("userid");
	int pcash=0,wcash=0;
	pcash=Integer.parseInt(request.getParameter("pcash"));
	wcash=Integer.parseInt(request.getParameter("wcash"));
	String orderid=request.getParameter("orderid");
	String products=request.getParameter("products");
	//out.println(wcash+"<br>"+pcash);
	int modify_wcash=(wcash-pcash);
	
	int t1=0,t2=0;
	String color="",sms="";
	%>
			<%@include file="modifiedwallet.jsp"%>
			<%@include file="clearcart.jsp"%>
	<%
	try{
		Statement stmt1=con.createStatement();
		
		String q1="update "+db_user+" set wallet='"+(wcash-pcash)+"' where mailid like '%"+uid+"%'";
		String q2="update "+db_user+" set cart='' where mailid like '%"+uid+"%'";
		
		t1=stmt1.executeUpdate(q1);
		//if(t1>0) out.println("wallet update");
		//else out.println("wallet not update");
		
		t2=stmt1.executeUpdate(q2);
		//if(t2>0) out.println("cart update");
		//else out.println("cart not update");
		
	}catch(Exception e)
	{out.println(e); }
	
	if(t1==1 && t2==1)
	{
		String ptype="Wallet";
		int amt=pcash;
		String pystatus="done";
		String pdetails="Wallet";
		%>
			<%@include file="ordertableimport.jsp"%>
		<%
	}
	else if(t1==0 && t2==0)
	{  
		sms="Order did not Confirm<br>Pleae Chack your Balance";	
		color="red";
		%><%@include file="middlepagesms.jsp"%><%		
	}
	else{out.println("see code problem in code"); }
			
%>