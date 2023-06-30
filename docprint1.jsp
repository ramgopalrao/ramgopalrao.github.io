<%@page import="java.sql.*" %>

<%
int pcode=0;
String rdate="";
String tr_to="";
String pdesc="";
String tr_from="";
int qty=0;
int reqno=0;
int docno=0;
String issuedate="";

Connection con=null;
Statement st=null;
%>

<html>
<body>
<div align="center">
  <table width="75%" border="1">
    <tr> 
      <td>
        <div align="center"><font size="+2">Issue Report</font></div>
      </td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>

  
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();

docno=Integer.parseInt(request.getParameter("docno"));
session=request.getSession();
//concept=(session.getAttribute("conceptsess")).toString();
tr_from=(session.getAttribute("locationsess")).toString();

%> 
<p> <font size="+2">Doc. 
  No. <%= docno %>&nbsp;<br>From: <%=tr_from %>
  </font></p>
<table border=2 width=100%>
  <tr> 
    <td> 
      <div align="center"><b>Request No.</b></div>
    </td>
    <td> 
      <div align="center"><b>Requested Date </b></div>
    </td>
    <td> 
      <div align="center"><b>Issued Date </b></div>
    </td>
    <td> 
      <div align="center"><b>Issue To Location</b></div>
    </td>
    <td> 
      <div align="center"><b>Item Code</b></div>
    </td>
    <td> 
      <div align="center"><b>Issued Qty</b></div>
    </td>
  </tr>




<%


ResultSet rs=st.executeQuery("select * from request where docno="+docno);

if(rs.next())
{
do
{
reqno=rs.getInt("reqno");
rdate=rs.getString("reqdate");
issuedate=rs.getString("issuedate");
tr_to=rs.getString("tr_to");
pcode=rs.getInt("pcode");
qty=rs.getInt("qty");

%> 
  <tr> 
    <td><%=reqno %></td>
    <td><%=rdate %></td>
    <td><%=issuedate %> </td>
    <td><%=tr_to %></td>
    <td><%=pcode %></td>
    <td><%=qty %></td>
  </tr>
  <%



}while(rs.next());
}
else
{
%>

<script>
var dn=<%=docno %>
alert("Sorry, Document No. "+dn+" Does Not Exists! \n\nPlease press 'Back Space Button'")
</script>
<%

}


}
catch(SQLException se1)
{}
%> 
</table>
<hr>
<p><b>Total Cartons: ____________________</b></p>
<hr>
<p><b>Issued By:&nbsp;&nbsp;&nbsp;_____________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Received 
  By: ________________________</b></p>
<p><b>Vehicle No.&nbsp;_____________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Received 
  Date &amp; Time: ________________</b></p>
<p>&nbsp;</p>
</body></html>
