<%@page import="java.sql.*" %>
<%@ include file="/nontrading.jsp" %>

<HTML>
<head><title>Non Trading Inventory</title> 
</head><BODY><b> Non Trading Inventory Module - Return To WH </b>
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


  <form method = post action="/nontrading/retwh1.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="24%" height="33">Returned Date :</td>
      <td width="76%" height="33"><%=new java.util.Date() %></td>
    </tr>
    <tr>
      <td width="24%" height="37">Warehouse- Location :</td>
      <td width="76%" height="37"> 
        <select name='locationmaster'>
          <%

session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
tr_to=(session.getAttribute("locationsess")).toString();

ResultSet rs=st.executeQuery("select location from user where concept='"+concept+"' and status='wh'");
while(rs.next())
{
tr_from=rs.getString("location");

%> 
          <option value='<%= tr_from %>'><%=tr_from %></option>
          <%
}
%> 
        </select>
      </td>
    </tr>
    <tr>
      <td width="24%" height="31">Store - Location :</td>
      <td width="76%" height="31"><%=tr_to %></td>
    </tr>
    <tr>
      <td width="24%" height="29">Product Name :</td>
      <td width="76%" height="29"> 
        <select name='productmaster'>
          <%

ResultSet rs1=st1.executeQuery("select pcode, pdesc from productsr where location='"+tr_to+"'");
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
      <td width="24%">Qty Returned :</td>
      <td width="76%">
        <input type=text name="qty" size=5 maxlength=5 value="1">
      </td>
    </tr>
    <tr>
      <td width="24%">&nbsp;</td>
      <td width="76%">
        <input type = Submit value = "Return to WH" name="Submit">
      </td>
    </tr>
  </table>
  <br>
   <br>
  <br>
  <br>
</Form>


</BODY>
</HTML>

