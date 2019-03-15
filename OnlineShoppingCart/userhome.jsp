<%@include file="usermenu.html"%>

	<body style="background : url('img/background2.png')">
		<form action="searchingBookResult.jsp" method=get>
			<input type=text name=fbook placeholder="Search by Book Name..." required> 
			<input type=submit value="Search" > <br>
		</form>
		<hr><hr>
	</body>

<%
	
	out.println("<center><br><br><br><br><br><br><br><h1>welcome <br>to<br>");
	out.println(session.getAttribute("uname")+"</h1>");
%>
<hr><hr></center>

<%@include file="offer.jsp"%>
