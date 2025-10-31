<%@include file="uheader.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*,java.util.*,java.lang.Number.*"%>
<link href="font_style.css" rel="stylesheet" type="text/css" media="all">
<br><br>
<%!float bal=0.0f;
		float fbal=0.0f;
%>
<%
try
{
	String uid=session.getAttribute("userid").toString();
	String tamt=session.getAttribute("tamt").toString();
	float tamt1=Float.parseFloat(tamt);
	String type=request.getParameter("type");
	session.setAttribute("type",type);

	if(type.equals("wallet"))
	{
		Connection con=databasecon.getconnection();
		Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("SELECT sum(total) FROM products WHERE uname='"+uid+"'");
		if(rs1.next())
		{
		bal=rs1.getFloat(1);
		}
		if(bal>=tamt1)
		{
			fbal=bal-tamt1;
			session.setAttribute("fbal",fbal);
			response.sendRedirect("deliveryaddr.jsp");
		}
		else
		{
		response.sendRedirect("selectpaytype.jsp?m=fail");
		}
	}
	else
	{
		response.sendRedirect("deliveryaddr.jsp");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>