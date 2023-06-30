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
<form name=frm action="/nontrading/editsupplier1.jsp" method=post>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();

scode=request.getParameter("scode");


ResultSet rs=st.executeQuery("select * from supplier where scode='"+scode+"'");

while(rs.next())
{
//scode=rs.getString("scode");
sname=rs.getString("sname");
saddress=rs.getString("saddress");
sphone=rs.getString("sphone");
%>
<table width="100%" border="2">
  <tr> 
    <td width="9%">&nbsp;</td>
    <td width="31%">Existing Details</td>
    <td width="60%">Change To.....</td>
  </tr>
  <tr> 
    <td width="9%">Supplier Code:</td>
    <td width="31%">&nbsp;<%=scode %><input type="hidden" name="scode1" size="30" maxlength="30" value=<%=scode %>></td>
    <td width="60%">&nbsp; </td>
  </tr>
  <tr> 
    <td width="9%" height="31"> 
      Supplier Name:
    </td>
    <td width="31%" height="31">&nbsp;<%=sname %></td>
    <td width="60%" height="31">
      <input type="text" name="sname1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
    <td width="9%">Address</td>
    <td width="31%">&nbsp;<%=saddress %></td>
    <td width="60%">
      <input type="text" name="saddress1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
    <td width="9%">Phone No.</td>
    <td width="31%">&nbsp;<%=sphone %></td>
    <td width="60%">
      <input type="text" name="sphone1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
    <td width="100%" colspan="3">
      <input type="submit" name="Submit" value="Change-----&gt;">
    </td>
  </tr>
</table>
<%
}

}
catch(SQLException se1)
{}
%>
</form>
</body>
</html>
