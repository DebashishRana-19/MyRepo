<%@include file="uheader.jsp"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%
    /*String userid = session.getAttribute("userid").toString();
 
    try{
      
      	Connection con=databasecon.getconnection();
        Statement st = con.createStatement();
        int rs = st.executeUpdate("update orderdetails set status_='"+userid+"' where status_='NO'");
        if(rs!=0)
        {
			System.out.println("Updated");
          }
		  else
		{
				System.out.println("Updation Failed");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}*/
		%>
<br><br><br><br>
<h1><font color="green">Thank You For Submitting Delivery Address..... And Your Payment Also Successfully Done.</font></h1>
<br><br><br><br>
<a href="userhome.jsp"><font color="blue">Click Here Go to Home</font></a>
<br><br><br><br><br><br>
<%@include file="footer.jsp"%>