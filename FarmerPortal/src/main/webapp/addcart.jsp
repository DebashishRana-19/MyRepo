<%@ include file="uheader.jsp"%>

<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*,java.util.*"%>

<%try{

Connection con = databasecon.getconnection();
Statement st1=con.createStatement();
Statement st2=con.createStatement();

%>


<%! String[] pid; 
int total=0; 
ArrayList al=new ArrayList();
ArrayList al1=new ArrayList();
%>
<% 

   pid = request.getParameterValues("pid");
   if (pid != null) 
   {
	   al.clear();
      for (int i = 0; i < pid.length; i++) 
      {

al.add(pid[i]);
al1.clear();
ResultSet rs= st1.executeQuery("SELECT price FROM products where pnumber='"+pid[i]+"' ");
if(rs.next()){
	System.out.println(1);
total=rs.getInt(1);

}
  } 
//session.setAttribute("al",al);

   }
  
   else {
   response.sendRedirect("buyproducts.jsp?msg=not checked");
   }



for (int i=0;i<al.size();i++) 
      {
		al1.clear();  
ResultSet rs1=st2.executeQuery("select pname,image from products where pnumber='"+al.get(i).toString()+"' ");
if(rs1.next()){
	
al1.add(rs1.getString(1));



int q= st1.executeUpdate("insert into orderdetails values('"+rs1.getString(1)+"','"+total+"','"+rs1.getString(2)+"','"+email+"','wait')");
}
	  }
response.sendRedirect("userhome.jsp?m=added");
//out.print("USER REGISTERED SUCCESSFULLY");
}
catch(Exception e1)
{
	e1.printStackTrace();
out.println(e1.getMessage());
}


%>
<%@include file="footer.jsp"%>