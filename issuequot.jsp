<%@page import="java.sql.*" %>

<%
String[] q_no1;
int q_no;
Connection con=null;
Statement st=null;
%>

<html>
<meta http-equiv="refresh" content=";URL=/nontrading/nontrading2.jsp">
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading2.jsp">
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

q_no1=request.getParameterValues("selec");



for(int i=0; i<q_no1.length; i++)
{
q_no=Integer.parseInt(q_no1[i]);
st.executeUpdate("update quot set inv_date='"+new java.util.Date()+"', var_expiry='"+new java.util.Date()+"', q_status='sold' where q_no="+q_no);
}

%>
<script>
alert("Sold Date Updated !!");
</script>

<%
}
catch(SQLException se1)
{}
%> 
</body></html>
