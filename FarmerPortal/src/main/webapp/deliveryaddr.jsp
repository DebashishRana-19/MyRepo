<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>

<link href="font_style.css" rel="stylesheet" type="text/css" media="all">
	<center><h1><font color="#ff8000" size="6">Delivery Address Details </font></h1></center>
	<form name="myform" method="post" action="payment.jsp"> 
	<table align="center">
	   <tr>
	   <td><font size="4" color="black">Full Name <font color="red">*</font>:</td>
		<td><input type="text" name="fname" required></td>
		</tr>
	   <tr>
	   <td><font size="4" color="black">Address Line1<font color="red">*</font>:</td>
	   <td><input type="text" name="address1" required></td>
	   </tr>
	   <tr>
	   <td><font size="4" color="black">Address Line2:</td>
	   <td><input type="text" name="address2"></td>
	   </tr>
	   <tr>
		<td><font color="black" size="4">City<font color="red"required>*</font>:</td>
		<td style="color:#000000;font-weight:bold">
		<input type="text" name="city" rows="3" cols="40"required>
		</td>
		</tr>
		<tr>
		<td><font color="black" size="4">State<font color="red">*</font>:</td>
		<td>	<input type="text" name="state" rows="3" cols="40"required></td>
		</tr>
		<tr>
		<td><font color="black" size="4">Zip<font color="red">*</font>:</td>
		<td style="color:#000000;font-weight:bold">
		<input type="text" name="zip" rows="3" cols="40"required>
		</td>
		</tr>
		<tr>
		<td><font color="black" size="4">Country<font color="red">*</font>:</td>
		<td><input type="text" name="country" rows="3" cols="40"required></td>
		</tr>
		<tr>
		<td><font size="4" color="black">Mobile No:</font></td>
		<td><input type="text" name="mno"required></td>
		</tr>
			
		<tr><td><font size="4" color="#000033"><strong>Shipping Address:</strong></font></td></tr>

		<tr>
	   <td><font size="4" color="black">Full Name <font color="red">*</font>:</td>
		<td><input type="text" name="fname1" required></td>
		</tr>
	   <tr>
	   <td><font size="4" color="black">Shopping Address <font color="red">*</font>:</td>
	   <td><textarea rows="3" cols="22" name="saddr" required></textarea></td>
	   </tr>
	   <!-- <tr>
	   <td><font size="4" color="black">Address Line2:</td>
	   <td><textarea rows="1" cols="22" name="address2"></textarea></td>
	   </tr> -->
	   <tr>
		<td><font color="black" size="4">City<font color="red"required>*</font>:</td>
		<td style="color:#000000;font-weight:bold">
		<input type="text" name="city1" rows="3" cols="40"required>
		</td>
		</tr>
		<tr>
		<td><font color="black" size="4">State<font color="red">*</font>:</td>
		<td>	<input type="text" name="state1" rows="3" cols="40"required></td>
		</tr>
		<tr>
		<td><font color="black" size="4">Zip<font color="red">*</font>:</td>
		<td style="color:#000000;font-weight:bold">
		<input type="text" name="zip1" rows="3" cols="40"required>
		</td>
		</tr>
		<tr>
		<td><font color="black" size="4">Country<font color="red">*</font>:</td>
		<td><input type="text" name="country1" rows="3" cols="40"required></td>
		</tr>
		<tr>
		<td><font size="4" color="black">Phone No:</font></td>
		<td><input type="text" name="mno1"required></td>
		</tr>
  	

  		<tr>
		<td></td>
	   <td><input type="submit" value="Save&Continue" style="font-size:18px">
	   	</td>
		</tr>
	   </table>
	
