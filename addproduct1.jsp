<%@page import="java.sql.*" %>
<%
String scode="";
int pcode=0;
String pstyle="";
String pdesc="";
double pcost=0;
String pspec="";
String concept="";
String location="";
String pname="";

Connection con=null;
Statement st=null;
Statement st1=null;
%>

<html>
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading.jsp">
<body>


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
scode=request.getParameter("suppliermaster");
pcode=Integer.parseInt(request.getParameter("pcode"));
pname=request.getParameter("pname");
pstyle=request.getParameter("pstyle");
pdesc=request.getParameter("pdesc");
pcost=Double.parseDouble(request.getParameter("pcost"));
pspec=request.getParameter("pspec");
}
catch(NumberFormatException ne)
{ %>
<script>
alert("Please enter Valid input! ")
</script> <%
}


session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
location=(session.getAttribute("locationsess")).toString();


try{
st=con.createStatement();
st1=con.createStatement();

ResultSet rs=st.executeQuery("select * from product where pcode="+pcode+" and location='"+location+"'");


if(rs.next())
{

%>
<script>
alert("Product Already Exists!")

</script>

<%
}
else
{
st1.executeUpdate("insert into product values("+pcode+",'"+pname+"', '"+scode+"','"+pstyle+"','"+pdesc+"',"+pcost+",'"+pspec+"','"+concept+"','"+location+"',0,0)");
%>

<script>
alert("One Product Added!")

</script>

<%
}
}catch(SQLException se1)
{}
%>
</body></html>