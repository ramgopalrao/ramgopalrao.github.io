<%@page import="java.sql.*" %>
<%@ include file="/nontrading1.jsp" %>

<HTML>
<head><title>Non Trading Inventory</title> 
</head><BODY>
<b> Non Trading Inventory Module - New Request</b> 
<hr> 



<%
int pcode=0;

String tr_to="";
String pdesc="";
String tr_from="";
String concept="";

Connection con=null;
Statement st=null;
Statement st1=null;
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

st=con.createStatement();
st1=con.createStatement();


%>
<%
session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
tr_from=(session.getAttribute("locationsess")).toString();

 %>

  <form method = post action="request22.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="24%" height="33">Request Date :</td>
      <td width="76%" height="33"><%=new java.util.Date() %></td>
    </tr>
    <tr>
      <td width="24%" height="37">From Location: </td>
      <td width="76%" height="37"> <%=tr_from%>
      </td>
    </tr>
    <tr>
      <td width="24%" height="31">Store - Location :</td>
      <td width="76%" height="31"> <input type=text name=to_loc value='Enter to Address'></td>
    </tr>
    <tr>
      <td width="24%" height="29">Product Name :</td>
      <td width="76%" height="29"> 
        <select name='productmaster'>
          <%

ResultSet rs1=st1.executeQuery("select pcode, pname, pdesc from product where concept='"+concept+"'");
while(rs1.next())
{

pcode=rs1.getInt("pcode");
pdesc=rs1.getString("pdesc");


%> 
          <option value='<%=pcode %>'> <%=pcode %> <%=pdesc %></option>
          <%
}
%> 
        </select>
      </td>
    </tr>
    <tr>
      <td width="24%">Qty Requested :</td>
      <td width="76%">
        <input type=text name="qty" size=5 maxlength=5 value="1">
      </td>
    </tr>
    <tr>
      <td width="24%">&nbsp;</td>
      <td width="76%">
        <input type = Submit value = "Save a Request" name="Submit">
      </td>
    </tr>
  </table>
  <br>
   <br>
  <br>
  <br>
</Form>

<script>
alert (" Qty can not be empty! ")
</script>

</BODY>
</HTML>

