<%@ page import="java.sql.*" %>
<HTML>
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading.jsp">

<BODY>

<%
int pcode=0;
String dohno="";
String invno="";
int rqty=0;
int rcptno=0;
String concept="";
String location="";


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
location=session.getAttribute("locationsess").toString();

pcode=Integer.parseInt(request.getParameter("itemmaster"));
dohno=request.getParameter("dohno");
invno=request.getParameter("invno");
rqty=Integer.parseInt(request.getParameter("qty"));


ResultSet rs=st.executeQuery("select max(rcptno) from receipt");
if(rs.next())
{
rcptno=rs.getInt(1)+1;
st1.executeUpdate("insert into receipt values("+rcptno+","+pcode+",'"+new java.util.Date() +"','"+dohno+"','"+invno+"',"+rqty+",'"+concept+"','"+location+"')");
st1.executeUpdate("update product set rcd=rcd+"+rqty+" where pcode="+pcode+" and location='"+location+"'");
//response.sendRedirect("/nontrading/nontrading.jsp");
%>
<script>
var rcno=<%=rcptno %>

alert("Please Note: RECEIPT No. :"+rcno)

</script>

<%

}

else
{
rcptno=1;
st1.executeUpdate("insert into receipt values("+rcptno+","+pcode+",'"+new java.util.Date() +"','"+dohno+"','"+invno+"',"+rqty+",'"+concept+"','"+location+"')");
st1.executeUpdate("update product set rcd=rcd+"+rqty+" where pcode="+pcode+" and location='"+location+"'");
//response.sendRedirect("/nontrading/nontrading.jsp");
%>
<script>
var rcno=<%=rcptno %>

alert("Please Note: RECEIPT No. :"+rcno)

</script>



<%

}

}
catch(SQLException se1)
{}

%>



</BODY>
</HTML>

