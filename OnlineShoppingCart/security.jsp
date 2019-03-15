<%@page import="java.util.*" %>

<%
	String capital_lett="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
    String small_lett= "abcdefghijklmnopqrstuvwxyz"; 
    String numbers="0123456789"; 
    String symbols="!@#$%^&*_=+-/.?<>)";
	String values = capital_lett+numbers+small_lett+symbols; 
	//out.println(values+" <br>"+values.length()+"<br>");

	Random rend_obj=new Random();
	
	int len=0;
	while(len<7)	{	len=rend_obj.nextInt(189)%13;	}
	//out.println(len+"<br>");
	
	// Use of charAt() method : to get character value 
	// Use of nextInt() as it is scanning the value as int 
	
	char[] auto_password=new char[len];
	for (int i = 0; i <len; i++) 
	{ 	
		auto_password[i] = values.charAt(rend_obj.nextInt(values.length())); 	
	} 
	//out.println("<br><br>"+auto_password+"<br>");
	
	char[] auto_otp=new char[6];
	for (int ii = 0; ii <6; ii++) 
	{ 	auto_otp[ii] = numbers.charAt(rend_obj.nextInt(numbers.length())); 	} 
	//out.println(auto_otp);

%>