<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>

<%
String scode="";
int pcode=0;
String pstyle="";
String pdesc="";
double pcost=0;
String pspec="";
String concept="";
String location1="";
int rcd=0;
int issue=0;
int qty=0;
String status="";
double tcost=0;

Connection con=null;
Statement st=null;
Statement st1=null;

%>

<html>
<body>

  </h3>
<form method="post" action="/nontrading/productstock.jsp">
 Select Location: 
    <select name="locationmaster">
      <%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();
st1=con.createStatement();



ResultSet rs1=st1.executeQuery("select location, status from user");

while(rs1.next())
{
location=rs1.getString("location");
%>
<option value=<%=location %>> <%=location %> </option>
<%
}
 %>



  </select><br>
   


<%

location1=request.getParameter("locationmaster");



%>
  Selected Location : <%= location1 %>
 
    <table border=2 width=100%>
      <tr> 
        <td>Product Code</td>
        <td>Sup. Code </td>
        <td>Style No.</td>
        <td>Item Description</td>
        <td>Specification</td>
        <td>Location</td>
        <td>Qty</td>
	<td>Total Cost Value</td>
      </tr>



<%
rs1=st1.executeQuery("select status from user where location='"+location1+"'");

while(rs1.next())
{
status=rs1.getString("status");
}

if(status.equals("wh"))
{


ResultSet rs=st.executeQuery("select * from product where location='"+location1+"' order by pcode asc");

if(rs.next())
{
do
{
pcode=rs.getInt("pcode");
scode=rs.getString("scode");
pstyle=rs.getString("pstyle");
pdesc=rs.getString("pdesc");
pcost=rs.getDouble("pcost");
pspec=rs.getString("pspec");
location=rs.getString("location");
rcd=rs.getInt("rcd");
issue=rs.getInt("issue");
qty=rcd-issue;
tcost=qty*pcost;
%> 
      <tr> 
        <td><%=pcode %></td>
        <td><%=scode %></td>
        <td><%=pstyle %></td>
        <td><%=pdesc %></td>
        <td><%=pspec %></td>
        <td><%=location %></td>
        <td><%=qty %></td>
        <td><%=tcost %></td>

      </tr>
      <%

}while(rs.next());
}
}

else
{
ResultSet rs=st.executeQuery("select * from productsr where location='"+location1+"' order by pcode asc");

if(rs.next())
{
do
{
pcode=rs.getInt("pcode");
scode=rs.getString("scode");
pstyle=rs.getString("pstyle");
pdesc=rs.getString("pdesc");
pcost=rs.getDouble("pcost");
pspec=rs.getString("pspec");
location=rs.getString("location");
rcd=rs.getInt("rcd");
issue=rs.getInt("issue");
qty=rcd-issue;
tcost=qty*pcost;
%> 
      <tr> 
        <td><%=pcode %></td>
        <td><%=scode %></td>
        <td><%=pstyle %></td>
        <td><%=pdesc %></td>
        <td><%=pspec %></td>
        <td><%=location %></td>
        <td><%=qty %></td>
        <td><%=tcost %></td>

      </tr>
      <%

}while(rs.next());
}




}
}
catch(SQLException se1)
{}
%> 
    </table>
  
  <input type="submit" name="Submit" value="View For Location">
</form>
</body></html>