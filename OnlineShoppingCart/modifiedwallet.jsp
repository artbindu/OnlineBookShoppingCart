<%

	int originalcash=0;
	try{
		Statement stmtw1=con.createStatement();
		
		String q132="select * from "+db_user+" where mailid like '%"+uid+"%'";		
		ResultSet rs132=stmtw1.executeQuery(q132);
		if(rs132.next())
		{
			originalcash=Integer.parseInt(rs132.getString("WALLET"));
			out.println("originalcash wallet: "+originalcash);
		}
	}catch(Exception e132)
	{out.println(e132); }
	
		//int t1=0;
	modify_wcash=originalcash-modify_wcash;
	try{
		Statement stmtw=con.createStatement();
		
		String q1="update "+db_user+" set wallet='"+modify_wcash+"' where mailid like '%"+uid+"%'";		
		t1=stmtw.executeUpdate(q1);
		//if(t1>0) out.println("wallet update");
		//else out.println("wallet not update");
	}catch(Exception e)
	{out.println(e); }
%>