<%@ page import="java.sql.*" %>
<%@ include file="/nontrading.jsp" %>
<HTML>
<head><title>Non Trading Inventory</title> 
</head><BODY><b> Non Trading Inventory Module - Consumption of Item </b>
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






  <form method = post action="/nontrading/consumption1.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="20%">Date:</td>
      <td width="80%"><%= new java.util.Date() %></td>
    </tr>
    <tr>
      <td width="20%">Item Name :</td>
      <td width="80%">
        <select name='itemmaster'>
          <%

session=request.getSession();
location=(session.getAttribute("locationsess")).toString();

ResultSet rs=st.executeQuery("select * from productsr where location='"+location+"'");
while(rs.next())
{
pcode=rs.getInt("pcode");
pdesc=rs.getString("pdesc");



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
      <td width="20%">Consumed Qty:</td>
      <td width="80%">
        <input type=text name="qty" size=20 maxlength = 30 value="1">
      </td>
    </tr>
    <tr>
      <td width="20%">&nbsp;</td>
      <td width="80%">
        <input type = Submit value = "Consumed" name="Submit">
      </td>
    </tr>
  </table>
  <br>
</Form>


</BODY>
</HTML>

