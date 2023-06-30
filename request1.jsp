<%@ page import="java.sql.*" %>
<HTML>
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading.jsp">

<BODY>

<%
int pcode=0;
String tr_to="";
String pdesc="";
String tr_from="";
String concept="";
int qty=0;
int reqno=0;


Connection con=null;
Statement st1=null;
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
st=con.createStatement();
st1=con.createStatement();

session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
tr_to=session.getAttribute("locationsess").toString();
tr_from=request.getParameter("locationmaster");
qty=Integer.parseInt(request.getParameter("qty"));

pcode=Integer.parseInt(request.getParameter("productmaster"));

if(!tr_from.equals(tr_to))
{
ResultSet rs=st.executeQuery("select max(reqno) from request");
if(rs.next())
{
reqno=rs.getInt(1)+1;
st1.executeUpdate("insert into request values("+reqno+",'"+new java.util.Date() +"','XXX','"+concept+"','"+tr_from+"','"+tr_to+"',"+pcode+","+qty+",'r',0)");
//response.sendRedirect("/nontrading/nontrading.jsp");


%>

<script>
var rqno=<%=reqno %>
alert("Please Note: REQUEST No.:  "+rqno)
</script>


<%


}

else
{
reqno=1;
st1.executeUpdate("insert into request values("+reqno+",'"+new java.util.Date() +"','XXX','"+concept+"','"+tr_from+"','"+tr_to+"',"+pcode+","+qty+",'r',0)");
//response.sendRedirect("/nontrading/nontrading.jsp");

%>

<script>
var rqno=<%=reqno %>
alert("Please Note: REQUEST No.:  "+rqno)
</script>


<%


}

}
else
{
%>

<script>
alert("Can not transfer items from WH to WH !");
</script>


<%
}

}
catch(SQLException se1)
{}

%>



</BODY>
</HTML>

