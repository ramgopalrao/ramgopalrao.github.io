<%@page import="java.sql.*" %>

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

<meta http-equiv="refresh" content="1;URL=/nontrading/nontrading.jsp">

<body>

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


pcode=Integer.parseInt(request.getParameter("pcode1"));
scode=request.getParameter("scode1");
pstyle=request.getParameter("pstyle1");
pdesc=request.getParameter("pdesc1");
pspec=request.getParameter("pspec1");
pcost=Double.parseDouble(request.getParameter("pcost1"));


st.executeUpdate("update product set scode='"+scode+"', pstyle='"+pstyle+"', pdesc='"+pdesc+"', pspec='"+pspec+"', pcost="+pcost+" where pcode="+pcode);

%>
<script>
alert("Updated Successfully!")
</script>
Please Wait.....

<%
}
catch(SQLException se1)
{}
%>
</body>
</html>
