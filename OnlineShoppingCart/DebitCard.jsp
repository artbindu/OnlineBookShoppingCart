

<html>
	<body>
	<h1>Enter Debit Card Details</h1><br><br><br><br>
	
	Bank Name: <%@include file="bankoption.jsp"%> <br>  
		
	Card Number: <input type="number" id="cc_no" name="cc_no" value="<%out.println(124);%>" required  onkeyup="DebitCardTypeCheck()"><div id="DebitCardTypeShow()"></div><br>
	Expiry Date
		<table >
			<tr><td>Month</td> <td width="20">&nbsp;</td>     <td>Year</td></tr>
			<tr><td><select id="cc_exp_mm" name="cc_exp_mm">
					<option value="">Month</option>
					<option value="1" selected="selected">January</option>                                 
					<option value="2">February</option>                              
					<option value="3">March</option>                           
					<option value="4">April</option>                           
					<option value="5">May</option>                            
					<option value="6">June</option>                            
					<option value="7">July</option>                           
					<option value="8">August</option>                             
					<option value="9">September</option>                     
					<option value="10">October</option>                              
					<option value="11">November</option>                             
					<option value="12">December</option>                             
				</select></td>        <td width="20">&nbsp;</td>                         
			<td><select id="cc_exp_yyyy" name="cc_exp_yyyy">
					<option value="">Month</option>                             
					<option value="2018" selected="selected">2018</option>                           
					<option value="2019">2019</option>                           
					<option value="2020">2020</option>                            
					<option value="2021">2021</option>                            
					<option value="2022">2022</option>                           
					<option value="2023">2023</option>                             
					<option value="2024">2024</option>                     
					<option value="2025">2025</option>                              
					<option value="2026">2026</option>                             
					<option value="2027">2027</option>
					<option value="2028">2028</option>                             
					<option value="2029">2029</option>
					<option value="2030">2030</option>
			</select></td>                     
		</tr></table> 
		CVV No: 
		<table cellpadding="0" cellspacing="0">
			<tr><td><input type=number id="cc_cvv" name=cc_cvc required onkeyup="CVVChaking()"><div id="CVVVerification()"> </div></td></tr>
		</table>
		Name on Card Holder: 
		<br><input type=text name=cc_name required><br><br></font>