<%@page import="java.sql.*" %>

<HTML>



<%
int pcode=0;
String tr_to="";
String pdesc="";
String tr_from="";
String concept="";
int qty=0;
int aqty=0;
int iqty=0;
int rcd=0;
int issue=0;

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

st=con.createStatement();

session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
tr_from=(session.getAttribute("locationsess")).toString();


tr_to=request.getParameter("locationmaster");
pcode=Integer.parseInt(request.getParameter("productmaster"));
qty=Integer.parseInt(request.getParameter("qty"));


ResultSet rs=st.executeQuery("select rcd, issue from productsr where pcode="+pcode+" and location='"+tr_from+"'");
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



st.executeUpdate("update product set issue=issue-"+iqty+" where pcode="+pcode+" and location='"+tr_to+"'");
st.executeUpdate("update productsr set rcd=rcd-"+iqty+" where pcode="+pcode+" and location='"+tr_from+"'");

%> 
<script>
var aq=<%=aqty %>
var iq=<%=iqty %>
var cq=<%=qty %>
var ccq=aq-iq
alert("Available Qty: "+aq+"\nReturned Qty: "+iq+"\nCurrent SR Stock: "+ccq)
</script>
<%

st=con.createStatement();
st1=con.createStatement();

}

catch(SQLException se)
{}

%> 
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading.jsp">
</HTML>

