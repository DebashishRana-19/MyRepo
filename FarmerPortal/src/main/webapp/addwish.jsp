<%@ include file="uheader.jsp"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*,java.util.*"%>

<%try{

Connection con = databasecon.getconnection();
Statement st1=con.createStatement();
Statement st2=con.createStatement();

%>


<%! String pid; 
int total=0; 
ArrayList al=new ArrayList();
ArrayList al1=new ArrayList();
%>
<% 

   pid = request.getParameter("pnumber");

	  


int q= st1.executeUpdate("insert into wishlist values('"+pid+"','"+email+"')");

	  
response.sendRedirect("buyproducts.jsp?m3=added to wish list");
//out.print("USER REGISTERED SUCCESSFULLY");
}
catch(Exception e1)
{
	e1.printStackTrace();
out.println(e1.getMessage());
}


%>
<%@include file="footer.jsp"%>s