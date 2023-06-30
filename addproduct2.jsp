<%@ page import="java.sql.*" %>
<%@ include file="/nontrading1.jsp" %>
<HTML>
<head><title>Non Trading Inventory</title> 
</head><BODY><b> Non Trading Inventory Module - New Product Addition </b>
<hr> 



<%
String scode="";
String sname="";
String saddress="";
String sphone="";



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
scode=request.getParameter("scode");
sname=request.getParameter("sname");
}
catch(NullPointerException ne)
{}

try{
st=con.createStatement();

%>






  <form method = post action="/nontrading/addproduct22.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="22%">Supplier Name : </td>
      <td width="78%"> 
        <select name='suppliermaster'>
          <%
ResultSet rs=st.executeQuery("select * from supplier");
while(rs.next())
{
scode=rs.getString("scode");
sname=rs.getString("sname");



%> 
          <option value='<%=scode %>'> <%=scode %> / <%=sname %> </option>
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
      <td width="22%">Item Code/BarCode :</td>
      <td width="78%">
        <input type=text name="pcode" size=35 maxlength=35>
      </td></tr>
<tr><td>Item Name:</td>
<td>
        <input type=text name="pname" size=35 maxlength=35>
      </td>

    </tr>
    <tr>
      <td width="22%" height="35"><br>
        Style No/Item Detail :</td>
      <td width="78%" height="35"> 
        <input type=text name="pstyle" size=50 maxlength=50 value = "..">
      </td>
    </tr>
    <tr>
      <td width="22%">Description :</td>
      <td width="78%">
        <input type=text name="pdesc" size=20 maxlength = 30 value="...">
      </td>
    </tr>
    <tr>
      <td width="22%">Specification : </td>
      <td width="78%">
        <input type=text name="pspec" size=20 maxlength = 30 value="...">
      </td>
    </tr>
    <tr>
      <td width="22%">Product Type : </td>
      <td width="78%"> <select name=ptype>
	<option value='raw'>Raw Material</option>
	<option value='tool'>Tools </option>
	<option value='end'>End Product</option>
	</select>

	

      </td>
    </tr>




    <tr>
      <td width="22%">Cost : </td>
      <td width="78%">
        <input type=text name="pcost" size=8 maxlength=8 value = "1">
      </td>
    </tr>
    <tr>
      <td width="22%">&nbsp;</td>
      <td width="78%">
        <input type = Submit value = "Save New Product" name="Submit">
      </td>
    </tr>
  </table>
  <br />
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

