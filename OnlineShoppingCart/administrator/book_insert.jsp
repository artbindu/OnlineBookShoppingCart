<%@include file="admin_connection.jsp"%>


<%
	String len=request.getParameter("len");
	String wid=request.getParameter("wid");
	String hig=request.getParameter("hei");
	String dimn= len+" cm x "+wid+" cm x "+hig+" cm";
	String cover_img_path=request.getParameter("cover_path");
	/*out.println("cover image path: "+cover_img_path);*/
	try{
		PreparedStatement pst=con.prepareStatement("insert into "+db_product+"(ISBN10,ISBN13,TITLE,PUBLICATION,AUTHOR,EDITION,LANGUAGE,DIMENSION,PRICE,CATEGORIES,SUB_CATEGORIES,RATING,COVER) values(?,?,?,?, ?,?,?,?, ?,?,?,?,?)");
		pst.setString(1,request.getParameter("ISBN10").toUpperCase());
		pst.setString(2,request.getParameter("ISBN13").toUpperCase());
		pst.setString(3,request.getParameter("book_name").toUpperCase());
		pst.setString(4,request.getParameter("pub").toUpperCase());
		pst.setString(5,request.getParameter("author").toUpperCase());
		pst.setString(6,request.getParameter("edition").toUpperCase());
		pst.setString(7,request.getParameter("language").toUpperCase());
		pst.setString(8,dimn);
		pst.setString(9,request.getParameter("price"));
		pst.setString(10,request.getParameter("category").toUpperCase());
		pst.setString(11,request.getParameter("sub_category").toUpperCase());
		pst.setString(12,"0");
		pst.setString(13,cover_img_path);

		out.println("<center><h1>");
		int t=pst.executeUpdate();
		if(t>0)
		{
			PreparedStatement pst1=con.prepareStatement("update ARTBINDU_BOOK_ADMIN set TOTAL_BOOKS=TOTAL_BOOKS+"+1+" where ADMIN_ID like 'artbindu'");
			int t1=pst1.executeUpdate(); 
			out.println("One Book is add in your data base");
		}
		else if(t==0)
			out.println("Invalid User id or Phone Number");
		con.close();
	}
	catch (Exception e)
	{	out.println(e);	}		
%>
