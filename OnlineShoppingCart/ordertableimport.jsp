
<%
	/* use in any payment method */


		Statement artbindu=con.createStatement();
		int tt=0; 
		try{																							/*SBI,RUPAY,324564545,11/26,CVC,cholder_name*?
			                                            /*ORDER_ID	   pystatus	 USER_ID  PAYMENT_TYPE PAYMENT_AMT	PAYMENT_STATUS	PAYMENT_DETAILS products_using_spaces*/
													
			String q3="insert into "+db_order+" values('"+orderid+"','Processing','"+uid+"','"+ptype+"','"+amt+"','"+pystatus+"','"+pdetails+"','"+products+"')";
			tt=artbindu.executeUpdate(q3);
			if(tt>0) 
			{  sms="Order Confirmed";    
				color="green";
				%><%@include file="middlepagesms.jsp"%><%		
			}
			else {  
				sms="Order did ot Confirment<br>Pleae Chack your Balance";	
				color="red";
				%><%@include file="middlepagesms.jsp"%><%		
			}
			
		}catch( Exception e2)
	{ out.println(e2);	}
%>