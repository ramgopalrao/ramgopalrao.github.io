<%@ page import="java.sql.*" %>
<%@ include file="/nontrading1.jsp" %>
<HTML>
<head><title>Non Trading Inventory</title> 
</head><BODY><b> Non Trading Inventory Module - Receipt of Item </b>
<hr> 



<%
int pcode=0;
String pdesc="";
//String location="";

Connection con=null;
Statement st=null;
%>





<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");
}

catch(SQLException se)
{}
%>

<%

try{
st=con.createStatement();

%>






  <form method = post action="/nontrading/receipt22.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="19%">Received Date:</td>
      <td width="81%"><%= new java.util.Date() %></td>
    </tr>
    <tr>
      <td width="19%">Item Name :</td>
      <td width="81%">
        <select name='itemmaster'>
          <%

session=request.getSession();
location=(session.getAttribute("locationsess")).toString();

ResultSet rs=st.executeQuery("select * from product where location='"+location+"'");
while(rs.next())
{
pcode=rs.getInt("pcode");
pdesc=rs.getString("pname");



%> 
          <option value='<%=pcode %>'> <%=pcode %> / <%=pdesc %> </option>
          <%
}
}
catch(SQLException se1)
{}

%> 
        </select>
      </td>
    </tr>
    <tr>
      <td width="19%">Voucher No. :</td>
      <td width="81%">
        <input type=text name="dohno" size=35 maxlength=35>
      </td>
    </tr>
    <tr>
      <td width="19%">Invoice No. </td>
      <td width="81%">
        <input type=text name="invno" size=50 maxlength=50 value = "..">
      </td>
    </tr>
    <tr>
      <td width="19%">Qty: </td>
      <td width="81%">
        <input type=text name="qty" size=20 maxlength = 30 value="0">
      </td>
    </tr>
    <tr>
      <td width="19%">&nbsp;</td>
      <td width="81%">
        <input type = Submit value = "Save New Product" name="Submit">
      </td>
    </tr>
  </table>
  <br>
  <br>
  <br>
<br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

  <br>
</Form>


</BODY>
</HTML>

