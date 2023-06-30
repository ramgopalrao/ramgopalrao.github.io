<%@page import="java.sql.*" %>

<%
int docno=0;
String rdate="";
String tr_to="";
String pdesc="";
String tr_from="";
int qty=0;
int reqno=0;
String[] reqno1;

Connection con=null;
Statement st=null;
%>

<html>
<meta http-equiv="refresh" content=";URL=/nontrading/nontrading.jsp">
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

st=con.createStatement();

reqno1=request.getParameterValues("selec");

if(reqno1 != null)
{

ResultSet rs=st.executeQuery("select max(docno) from request");


if(rs.next())
{
docno=rs.getInt(1)+1;


for(int i=0; i<reqno1.length; i++)
{
reqno=Integer.parseInt(reqno1[i]);
st.executeUpdate("update request set docno="+docno+", status='prt' where reqno="+reqno);
}

%>
<script>

var doc=<%=docno %>

alert("Please Note: Document No. "+doc);
</script>


<%
}
}
else
{

%>
<script>
alert("None is selected!");
</script>


<%




}



}
catch(SQLException se1)
{}
%> 
</body></html>
