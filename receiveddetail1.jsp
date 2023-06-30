<%@page import="java.sql.*" %>
<%@include file="/receiveddetail.jsp" %>

<%
int rcptno=0;
String rdate="";
String dohno="";
String invno="";
int pcode=0;
int rqty=0;
String concept="";
//String location="";


Connection con=null;
Statement st=null;
//Statement st1=null;

%>

<html>
<body>

  
    <%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();

pcode=Integer.parseInt(request.getParameter("pcode"));

%> 


<br>
Selected Item: <%=pcode %>   <br>
<table border=2 width=100%>
      <tr> 
         <td>Receipt No. </td>
        <td>Received Date.</td>
        <td>DOH No.</td>
        <td>Invoice No.</td>
        <td>Received Qty</td>
        <td>Location</td>
	
      </tr>



<%



ResultSet rs=st.executeQuery("select * from receipt where pcode="+pcode+" order by rcptno asc");

if(rs.next())
{
do
{
rcptno=rs.getInt("rcptno");
rdate=rs.getString("rdate");
dohno=rs.getString("dohno");
invno=rs.getString("invno");
rqty=rs.getInt("rqty");
location=rs.getString("location");
%> 
      <tr> 
        <td><%=rcptno %></td>
        <td><%=rdate %></td>
        <td><%=dohno %></td>
        <td><%=invno %></td>
        <td><%=rqty %></td>
        <td><%=location %></td>
        
      </tr>
      <%

}while(rs.next());
}
}
catch(SQLException se1)
{}
%> 
</body></html>