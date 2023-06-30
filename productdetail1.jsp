<%@page import="java.sql.*" %>
<%@include file="/productdetail.jsp" %>

<%
String scode="";
int pcode=0;
String pstyle="";
String pdesc="";
double pcost=0;
String pspec="";
String concept="";
//String location1="";
int rcd=0;
int issue=0;
int qty=0;
String status="";
double tcost=0;
String loctype="";

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
loctype=request.getParameter("locationmaster");

%> 


Selected Item / Loc. Type: <%=pcode %>  FOR: <%=loctype %> <br>
<table border=2 width=100%>
      <tr> 
         <td>Sup. Code </td>
        <td>Style No.</td>
        <td>Item Description</td>
        <td>Specification</td>
        <td>Location</td>
        <td>Qty</td>
	<td>Total Cost Value</td>
      </tr>



<%

if(loctype.equals("Warehouse"))
{


ResultSet rs=st.executeQuery("select * from product where pcode="+pcode+" order by pcode asc");

if(rs.next())
{
do
{
scode=rs.getString("scode");
pstyle=rs.getString("pstyle");
pdesc=rs.getString("pdesc");
pcost=rs.getDouble("pcost");
pspec=rs.getString("pspec");
location=rs.getString("location");
rcd=rs.getInt("rcd");
issue=rs.getInt("issue");
qty=rcd-issue;
tcost=qty*pcost;
%> 
      <tr> 
        <td><%=scode %></td>
        <td><%=pstyle %></td>
        <td><%=pdesc %></td>
        <td><%=pspec %></td>
        <td><%=location %></td>
        <td><%=qty %></td>
        <td><%=tcost %></td>

      </tr>
      <%

}while(rs.next());
}
}

else if(loctype.equals("Showroom"))
{
ResultSet rs=st.executeQuery("select * from productsr where pcode="+pcode+" order by pcode asc");

if(rs.next())
{
do
{
scode=rs.getString("scode");
pstyle=rs.getString("pstyle");
pdesc=rs.getString("pdesc");
pcost=rs.getDouble("pcost");
pspec=rs.getString("pspec");
location=rs.getString("location");
rcd=rs.getInt("rcd");
issue=rs.getInt("issue");
qty=rcd-issue;
tcost=qty*pcost;
%> 
      <tr> 
        <td><%=scode %></td>
        <td><%=pstyle %></td>
        <td><%=pdesc %></td>
        <td><%=pspec %></td>
        <td><%=location %></td>
        <td><%=qty %></td>
        <td><%=tcost %></td>

      </tr>
      <%

}while(rs.next());
}
}
}
catch(SQLException se1)
{}
%> 
</body></html>