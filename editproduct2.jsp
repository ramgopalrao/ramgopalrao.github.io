<%@page import="java.sql.*" %>
<%@include file="/nontrading1.jsp" %>

<%
int pcode=0;
String scode="";
String pstyle="";
String pdesc="";
String pspec="";
double pcost=0;
int qty=0;
int rcd=0;
int issue=0;

Connection con=null;
Statement st=null;
%>

<html>
<body>
<h3>Product List <h3>
<form name=frm action="/nontrading/editproduct22.jsp" method=post>
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


ResultSet rs=st.executeQuery("select * from product where pcode="+pcode);

while(rs.next())
{
//scode=rs.getString("scode");
scode=rs.getString("scode");
pstyle=rs.getString("pstyle");
pdesc=rs.getString("pdesc");
pspec=rs.getString("pspec");
pcost=rs.getDouble("pcost");
%>
<table width="100%" border="2">
  <tr> 
    <td width="9%">&nbsp;</td>
    <td width="31%">Existing Details</td>
    <td width="60%">Change To.....</td>
  </tr>
  <tr> 
    <td width="9%">Product Code:</td>
    <td width="31%">&nbsp;<%=pcode %><input type="hidden" name="pcode1" size="30" maxlength="30" value=<%=pcode %>></td>
    <td width="60%">&nbsp; </td>
  </tr>
  <tr> 
    <td width="9%" height="31"> 
      Supplier Code:
    </td>
    <td width="31%" height="31">&nbsp;<%=scode %></td>
    <td width="60%" height="31">
      <input type="text" name="scode1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
    <td width="9%">Style No.</td>
    <td width="31%">&nbsp;<%=pstyle %></td>
    <td width="60%">
      <input type="text" name="pstyle1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
    <td width="9%">Desciption.</td>
    <td width="31%">&nbsp;<%=pdesc %></td>
    <td width="60%">
      <input type="text" name="pdesc1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
<tr> 
    <td width="9%">Specification</td>
    <td width="31%">&nbsp;<%=pspec %></td>
    <td width="60%">
      <input type="text" name="pspec1" size="30" maxlength="30" value="xxx">
    </td>
  </tr>
  <tr> 
  

<tr> 
    <td width="9%">Cost</td>
    <td width="31%">&nbsp;<%=pcost %></td>
    <td width="60%">
      <input type="text" name="pcost1" size="30" maxlength="30" value="0">
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
