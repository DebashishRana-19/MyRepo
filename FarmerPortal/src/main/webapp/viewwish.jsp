<%@ include file="uheader.jsp"%>

<%@ page import="java.sql.*,CT.*"%>

<head>


<script language="javascript" type="text/javascript">

function popitup(url) {
	newwindow=window.open(url,'name','height=250,width=500');
	if (window.focus) {newwindow.focus()}
	return false;
}</script>
</head>
<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>
<% String msg=request.getParameter("msg");

if(msg!=null){

out.println("<script>alert('Please select Atleast one Product')</script>");
}%>



<center><form method="post" action="addcart.jsp"><table style="border-collapse: separate; border-spacing: 50px;">
<tr><th>Product Bar-Code Number</th><th>Product Name</th><th>Product Description</th><th>Price</th><th>Product Image</th></tr>
<style>

</style>
<%


try{
Connection con = databasecon.getconnection();

%>
<%
Statement st1=con.createStatement();
Statement st2=con.createStatement();
ResultSet rs1=st2.executeQuery("SELECT pid FROM wishlist WHERE email='"+email+"' ");
String sql="SELECT pid FROM wishlist WHERE email='"+email+"'";
System.out.println(sql);
while(rs1.next()){
String pnumber =rs1.getString(1);

ResultSet rs= st2.executeQuery("SELECT * FROM products WHERE pnumber='"+pnumber+"' ");
String ss="SELECT * FROM products WHERE pnumber='"+pnumber+"' ";
System.out.println(ss);

	
%>


<%
while(rs.next())
	{%>


	<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(7)%></td>
<td><img src="images/<%=rs.getString(6)%>" width="100px" height="100px"></td>

<!-- <td><input type="checkbox" name="pid" value="<%=rs.getString(1)%>" ></td> -->
<td><a href="" onclick="return popitup('info.jsp?pnumber=<%=rs.getString(1)%>')">More Info</td>
<td><a href='addwish.jsp?pnumber=<%=rs.getString(1)%>'></a></td><%}%></tr>
<!-- <tr><td><button type="submit" class="btn btn-success btn-lg" id="add">Add to Cart </button></td></tr>
 --></table></form></center>
<br><br>
<%
}}
catch(Exception e)
{
e.printStackTrace();
	}
%>
<br><br><br><br><br>
<%@ include file="footer.jsp"%>

