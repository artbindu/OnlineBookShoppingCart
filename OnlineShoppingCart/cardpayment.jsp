
<%
	int pcash=0,wcash=0;
	pcash=Integer.parseInt(request.getParameter("pcash"));
	wcash=Integer.parseInt(request.getParameter("wcash"));
	String orderid=request.getParameter("orderid");
	String products=request.getParameter("products");
	//out.println(wcash+"<br>"+pcash);
	int modify_pcash=(pcash-wcash);
%>
<%@include file="cardvalidation.jsp"%>


