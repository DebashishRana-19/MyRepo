<%@ include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*,java.util.*"%>

<html>
<head>
<title></title>

</head>

<body>
<%!String uid=null;
float amt=0.0f;

%>
<%
String date="NO";
String fname= request.getParameter("fname");
String lname= request.getParameter("lname");
String uname= request.getParameter("uname");
String password= request.getParameter("pass");
String email= request.getParameter("email");
String phoneno=request.getParameter("phoneno");
String country= request.getParameter("country");
String zip= request.getParameter("zip");


try
{

Connection con=databasecon.getconnection();
	
		Statement st=con.createStatement();
		
PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
ps.setString(1,fname);
ps.setString(2,lname);

ps.setString(3,uname);
ps.setString(4,password);
ps.setString(5,email);
ps.setString(6,phoneno);
ps.setString(7,country);
ps.setString(8,zip);

ps.executeUpdate();

response.sendRedirect("user.jsp?m=success");
//out.print("USER REGISTERED SUCCESSFULLY");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>
</body>
</html>


<%@ include file="footer.jsp"%>