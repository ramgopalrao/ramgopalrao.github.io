<%@page import="java.sql.*" %>
<%
String scode="";
String sname="";
String saddress="";
String sphone="";

Connection con=null;
Statement st=null;
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
scode=request.getParameter("scode");
sname=request.getParameter("sname");
saddress=request.getParameter("saddress");
sphone=request.getParameter("sphone");
}
catch(NullPointerException ne)
{}

try{
st=con.createStatement();
st.executeUpdate("insert into supplier values('"+scode+"','"+sname+"','"+saddress+"','"+sphone+"')");
%>

<script>
alert("One Supplier Updated!")

</script>

<%
}
catch(SQLException se1)
{
%>
<script>
alert("Supplier Exists! OR Invalid input!")

</script>


<%
}
%>
</body></html>