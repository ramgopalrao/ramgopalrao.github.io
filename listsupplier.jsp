<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>

<%
String scode="";
String sname="";
String saddress="";
String sphone="";

Connection con=null;
Statement st=null;
%>

<html>
<body>
<h3>Supplier List <h3><br>
<table border=2 width=100%>
<tr><td>Sup. Code </td><td>Sup. Name</td><td>Supp. Address</td><td>Phone No.</td></tr>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();

ResultSet rs=st.executeQuery("select * from supplier order by scode asc");

if(rs.next())
do
{
scode=rs.getString("scode");
sname=rs.getString("sname");
saddress=rs.getString("saddress");
sphone=rs.getString("sphone");
%>
<tr><td><a href="/nontrading/editsupplier.jsp?scode=<%=scode %>"><%=scode %></a></td><td><%=sname %></td><td><%=saddress %></td><td><%=sphone %></td></tr>

<%

}while(rs.next());


}
catch(SQLException se1)
{}
%></table>
</body></html>