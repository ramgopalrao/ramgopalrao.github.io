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


scode=request.getParameter("scode1");
sname=request.getParameter("sname1");
saddress=request.getParameter("saddress1");
sphone=request.getParameter("sphone1");

st.executeUpdate("update supplier set sname='"+sname+"', saddress='"+saddress+"', sphone='"+sphone+"' where scode='"+scode+"'");

%>

<script>
alert("Updated Successfully!")
</script>



<%

}
catch(SQLException se1)
{}
%>
Please Wait.....
</body>
</html>
