<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>

<%
int pcode=0;
String rdate="";
String tr_to="";
String pdesc="";
String tr_from="";
int qty=0;
int reqno=0;

Connection con=null;
Statement st=null;
%>

<html>
<body>
<h3>Pending Request List <h3><br>
<table border=2 width=100%>
<tr><td>Request No.</td><td>Requested Date </td><td>Issue To Location</td><td>Item Code</td><td>Requested Qty</td></tr>

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
//concept=(session.getAttribute("conceptsess")).toString();
tr_from=(session.getAttribute("locationsess")).toString();


ResultSet rs=st.executeQuery("select * from request where tr_from='"+tr_from+"' and status='r'");

while(rs.next())
{
reqno=rs.getInt("reqno");
rdate=rs.getString("reqdate");
tr_to=rs.getString("tr_to");
pcode=rs.getInt("pcode");
qty=rs.getInt("qty");


%>
<tr><td><a href="/nontrading/issue.jsp?reqno=<%=reqno %>"><%=reqno %></a></td><td><%=rdate %></td><td><%=tr_to %></td><td><%=pcode %></td><td><%=qty %></td></tr>

<%

}


}
catch(SQLException se1)
{}
%>

</table>
</body></html>
