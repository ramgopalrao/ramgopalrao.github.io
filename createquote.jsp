<%@page import="java.sql.*" %>
<%@ include file="/nontrading2.jsp" %>

<HTML>
<head><title>Non Trading Inventory</title> 
</head><BODY>
<b> Quotation Module - New Quotation</b> 
<hr> 



<%

String pname="";
int pcode;


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


  <form method = post action="createquote1.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="24%" height="33">Qoutation Date :</td>
      <td width="76%" height="33"><%=new java.util.Date() %></td>
    </tr>
    <tr>
      <td width="24%" height="37">Customer Name :</td> <td><input type=text name=c_name> </td></tr>

    <tr><td width="24%" height="37">Customer Address Line1:</td> <td><input type=text name=c_add1> </td></tr>

    <tr><td width="24%" height="37">Customer Address Line2:</td> <td><input type=text name=c_add2> </td></tr>


    <tr><td width="24%" height="37">Customer Telephone No. :</td> <td><input type=text name=c_tel> </td></tr>
<tr><td><hr></td>   <td><hr></td> </tr>


    <tr><td width="24%" height="37">Item Name1:</td>




 <td><select name='productmaster1'> <%
ResultSet rs=st.executeQuery("select pname from product where ptype='end'");
while(rs.next())
{
pname=rs.getString("pname");
%>
<option value='<%=pname%>'><%=pname%></option><%

}
%>
</select>
</td></tr>
<tr><td width="24%" height="37">Basic Value :</td> <td><input type=text name=item_basic1> </td></tr>

<tr><td width="24%" height="37">VAT :</td> <td><input type=text name=item_tax1> </td></tr>
<tr><td width="24%" height="37">Qty1 :</td> <td><input type=text name=qty1> </td></tr>

<tr><td><hr></td>   <td><hr></td> </tr>
    <tr><td width="24%" height="37">Item Name2:</td>




 <td><select name='productmaster2'> <%
ResultSet rs1=st1.executeQuery("select pname from product where ptype='end'");
while(rs1.next())
{
pname=rs1.getString("pname");
%>
<option value='<%=pname%>'><%=pname%></option><%

}
%>
</select>
</td></tr>

<tr><td width="24%" height="37">Basic Value :</td> <td><input type=text name=item_basic2 value=0> </td></tr>

<tr><td width="24%" height="37">VAT :</td> <td><input type=text name=item_tax2 value=0> </td></tr>

<tr><td width="24%" height="37">Qty2 :</td> <td><input type=text name=qty2 value=0> </td></tr>

<tr><td><hr></td>   <td><hr></td> </tr>

  <td width="76%">
        <input type = Submit value = "Save a Request" name="Submit">
      </td>

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

