<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>

<%
String scode="";
int pcode=0;
String pstyle="";
String pdesc="";
double pcost=0;
String pspec="";
String concept="";
//String location="";
int rcd=0;
int issue=0;
int qty=0;

Connection con=null;
Statement st=null;
%>

<html>
<body>
<h3>Product List 
  <h3><br>
<table border=2 width=100%>
<tr><td>Product Code</td><td>Sup. Code </td><td>Style No.</td><td>Item Description</td><td>Specification</td><td>Location</td><td>Qty</td></tr>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();

session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();

ResultSet rs=st.executeQuery("select * from product where concept='"+concept+"' order by pcode asc");

if(rs.next())
do
{
pcode=rs.getInt("pcode");
scode=rs.getString("scode");
pstyle=rs.getString("pstyle");
pdesc=rs.getString("pdesc");
pcost=rs.getDouble("pcost");
pspec=rs.getString("pspec");
location=rs.getString("location");
rcd=rs.getInt("rcd");
issue=rs.getInt("issue");
qty=rcd-issue;
%>
<tr><td><a href="/nontrading/editproduct.jsp?pcode=<%=pcode %>"><%=pcode %></a></td><td><%=scode %></td><td><%=pstyle %></td><td><%=pdesc %></td><td><%=pspec %></td><td><%=location %></td><td><%=qty %></td></tr>

<%

}while(rs.next());


}
catch(SQLException se1)
{}
%></table>
</h3></h3></body></html>