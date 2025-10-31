 <%@ include file="mheader.jsp"%>

<%@ page import="java.sql.*,CT.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>
<% if(request.getParameter("update")!=null){
	  out.println("<script>alert(' Product Updated.....')</script>");
}%>
<% if(request.getParameter("msg2")!=null){
	  out.println("<script>alert(' Rejected.....')</script>");
}%>
<center><table style="border-collapse: separate; border-spacing: 50px;">
<tr><th>Product Bar-Code Number</th><th>Product Name</th><th>Product Description</th><th>Product Image</th><th>Price</th></tr>

<%
try{
Connection con = databasecon.getconnection();

%>
<%
Statement st1=con.createStatement();
Statement st2=con.createStatement();

ResultSet rs1=st1.executeQuery("select * from products where status='approved' ");

%>


<%
while(rs1.next())
	{%>


	<tr>
<td><%=rs1.getString(1)%></td>
<td><%=rs1.getString(3)%></td>
<td><%=rs1.getString(4)%></td>
<td><img src="images/<%=rs1.getString(6)%>" width="100px" height="100px"></td>

<td><%=rs1.getString(7)%></td>
<td><a href="updateproducts2.jsp?pnumber=<%=rs1.getString(1)%>">Update</td>

</tr><%}%>
</table></center>
<br><br>
<%
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>

