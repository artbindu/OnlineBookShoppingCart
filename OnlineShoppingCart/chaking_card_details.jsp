
<%
	//out.println(owner+"<br>"+cvv+"<br>"+cardNumber+"<br>"+expdate+"<br>");
	
	Statement stmtcvalid=con.createStatement();
	int t,cardbal=0, paymentyes=-1;  String sms="",color="";
	try{
		String qq="select * from "+userBanks+" where CARDNO='"+cardNumber+"' AND expdate='"+expdate+"' AND cvv='"+cvv+"'";
		//out.println(qq);
		ResultSet rsbal=stmtcvalid.executeQuery(qq);
		if(rsbal.next())
		{
			if(rsbal.getString("OWNER").equals(owner))
			{
				cardbal=Integer.parseInt(rsbal.getString("BALANCE"));
				//out.println(cardbal);
				//out.println(modify_pcash);
				if(cardbal<modify_pcash)
				{	paymentyes=0;  }
				else{ paymentyes=1; }
			}
			else{ sms="Invalid Card"; }
		}
		//out.println("paymentts= "+paymentyes);
		
	}catch(Exception e1)
	{out.println(e1); }
		
	if(paymentyes==-1)
	{  
		sms="Invalid Card";	
		color="red";
		%><%@include file="middlepagesms.jsp"%><%		
	}
	else if(paymentyes==0)
	{  
		sms="This Card Has Not Sufficent Balance";	
		color="gray";
		%><%@include file="middlepagesms.jsp"%><%		
	}	
	else{
		Statement stmtcvalid2=con.createStatement();
		int paymentdone=0;
		try{
			String qq2="update "+userBanks+" set BALANCE="+(cardbal-modify_pcash)+" where CARDNO='"+cardNumber+"'";
			paymentdone=stmtcvalid2.executeUpdate(qq2);
			if(paymentdone>0) { sms="payment done"; color="green";  }
			else { sms="payment not done due to techinical problem"; color="sky";	}
			%><%@include file="middlepagesms.jsp"%><%	
		}catch(Exception e11)
		{out.println(e11); }
	}
	
%>