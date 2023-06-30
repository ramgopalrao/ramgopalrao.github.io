<%@ page import="java.sql.*" %>
<HTML>
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading.jsp">
<BODY>
<%
int pcode=0;
String pdesc="";
String location="";
int qty=0;
int rcd=0;
int issue=0;
int aqty=0;
int iqty=0;

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

try{
st=con.createStatement();

qty=Integer.parseInt(request.getParameter("qty"));
pcode=Integer.parseInt(request.getParameter("itemmaster"));
session=request.getSession();
location=(session.getAttribute("locationsess")).toString();

ResultSet rs=st.executeQuery("select rcd, issue from productsr where pcode="+pcode+" and location='"+location+"'");
while(rs.next())
{
rcd=rs.getInt("rcd");
issue=rs.getInt("issue");
aqty=rcd-issue;
}

if(qty>aqty)
{
iqty=aqty;
}
else
{
iqty=qty;
}


st.executeUpdate("Update productsr set issue=issue+"+iqty+" where location='"+location+"'");

%>
<script>
var aq=<%=aqty %>
var iq=<%=iqty %>
var cq=<%=qty %>
var ccq=aq-iq
alert("Available Qty: "+aq+"\nConsumed Qty: "+iq+"\nCurrent SR Stock: "+ccq)
</script>
<%
}
catch(SQLException se1)
{}

%>




</BODY>
</HTML>

