<%@page import="java.sql.*, javax.swing.JFrame"  %>
<%@ include file="/getreq1.jsp" %>
<%
//int pcode=0;
//String rdate="";
//String tr_to="";
//String pdesc="";
//String tr_from="";
int rqty=0;
int aqty=0;
int iqty=0;
int rcd=0;
int issue=0;
String scode="";
String pstyle="";
//String pdesc="";
String pspec="";
double pcost=0;
String concept="";

//int reqno=0;

//Connection con=null;
//Statement st=null;
Statement st1=null;
Statement st2=null;

%>

<html>
<meta http-equiv="refresh" content="0;URL=/nontrading/getreq1.jsp">
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
st1=con.createStatement();


reqno=Integer.parseInt(request.getParameter("reqno"));

session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
tr_from=(session.getAttribute("locationsess")).toString();


ResultSet rs=st.executeQuery("select * from request where reqno="+reqno);

while(rs.next())
{
reqno=rs.getInt("reqno");
rdate=rs.getString("reqdate");
tr_to=rs.getString("tr_to");
pcode=rs.getInt("pcode");
rqty=rs.getInt("qty");


ResultSet rs1=st1.executeQuery("select * from product where pcode="+pcode+" and location='"+tr_from+"'");

while(rs1.next())
{
scode=rs1.getString("scode");
pstyle=rs1.getString("pstyle");
pdesc=rs1.getString("pdesc");
pspec=rs1.getString("pspec");
pcost=rs1.getDouble("pcost");
rcd=rs1.getInt("rcd");
issue=rs1.getInt("issue");
aqty=rcd-issue;

}
	if(rqty > aqty)
	{
	iqty=aqty;
	}

	else
	{
	iqty=rqty;
	}


st1.executeUpdate("update request set qty="+iqty+", status='i', issuedate='"+new java.util.Date()+"' where reqno="+reqno);
st1.executeUpdate("update product set issue=issue+"+iqty+" where pcode="+pcode+" and location='"+tr_from+"'");
st2=con.createStatement();

ResultSet rs2=st2.executeQuery("select * from productsr where pcode="+pcode+" and location='"+tr_to+"'");

if(rs2.next())
{
st2.executeUpdate("update productsr set rcd=rcd+"+iqty+" where pcode="+pcode+" and location='"+tr_to+"'");
}
else
{
st2.executeUpdate("insert into productsr values("+pcode+",'"+scode+"','"+pstyle+"','"+pdesc+"',"+pcost+",'"+pspec+"','"+concept+"','"+tr_to+"',"+iqty+",0)");
}

}
}catch(SQLException se1)
{}

%>

<script>
var iq=<%=iqty %>
var rq=<%=rqty %>
var aq=<%=aqty %>
alert("Available Qty: "+aq+"\nRequested Qty: "+rq+"\nIssued Qty: "+iq);

</script>



</body></html>
