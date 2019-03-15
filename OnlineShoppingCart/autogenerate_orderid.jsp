<%@page import="java.time.format.DateTimeFormatter"%>  
<%@page import="java.time.LocalDateTime"%>  

<%
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
	LocalDateTime now = LocalDateTime.now();  
	//out.println("Date & Time : "+now+"<br>");

	StringBuffer datetime=new StringBuffer(now.toString());
	datetime.delete(4,5);
	datetime.delete(6,7);
	datetime.delete(8,9);
	datetime.delete(10,11);
	datetime.delete(12,13);
	datetime.delete(14,15);
	datetime.delete(0,2); //take only last two digits of 'year'
			
	//out.println(datetime);
%>

