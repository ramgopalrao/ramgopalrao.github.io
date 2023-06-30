<%@page import="java.sql.*" %>
<%@include file="/nontrading1.jsp" %>

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
<h3>Select Request to Create Document <h3><br>
<form name=frm action="/nontrading/gendoc22.jsp" method=post">
    <table border=2 width=100%>
      <tr> 
        <td>Select </td>
        <td>Request No.</td>
        <td>Requested Date </td>
        <td>Issue To Location</td>
        <td>Item Code</td>
        <td>Requested Qty</td>
      </tr>
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


ResultSet rs=st.executeQuery("select * from request where tr_from='"+tr_from+"' and status='i' and qty>0");

while(rs.next())
{
reqno=rs.getInt("reqno");
rdate=rs.getString("reqdate");
tr_to=rs.getString("tr_to");
pcode=rs.getInt("pcode");
qty=rs.getInt("qty");

%>
      <tr> 
        <td> 
          <input type="checkbox" value="<%=reqno %>" name="selec">
        </td>
        <td><%=reqno %></td>
        <td><%=rdate %></td>
        <td><%=tr_to %></td>
        <td><%=pcode %></td>
        <td><%=qty %></td>
      </tr>
<%



}


}
catch(SQLException se1)
{}
%> 
      <tr> 
        <td colspan="6">
          <input type="submit" name="Submit" value="Create Doc ----&gt;">
        </td>
      </tr>


</form>


    </table>
</h3></h3></body></html>
