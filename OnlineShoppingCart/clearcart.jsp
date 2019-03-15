<%
	//int t2=0;
	try{
		Statement stmtcart=con.createStatement();
		
		String q2="update "+db_user+" set cart='' where mailid like '%"+uid+"%'";
		
		t2=stmtcart.executeUpdate(q2);
		//if(t2>0) out.println("cart update");
		//else out.println("cart not update");
		
	}catch(Exception e)
	{out.println(e); }
%>