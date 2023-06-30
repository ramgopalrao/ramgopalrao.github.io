<%@ page import="java.sql.*" %>
<HTML>
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading1.jsp">

<BODY>

<%
int pcode=0;
String pname="";
String tr_to="";
String pdesc="";
String tr_from="";
String concept="";
int qty=0;
int reqno=0;
int rcd=0;
int issue=0;
int aqty=0;
int rqty=0;
int iqty=0;


Connection con=null;
Statement st1=null;
Statement st=null;
Statement st2=null;
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
st2=con.createStatement();


session=request.getSession();
concept=(session.getAttribute("conceptsess")).toString();
tr_from=session.getAttribute("locationsess").toString();
tr_to=request.getParameter("to_loc");

rqty=Integer.parseInt(request.getParameter("qty"));

pcode=Integer.parseInt(request.getParameter("productmaster"));



if(!tr_from.equals(tr_to))
{
ResultSet rs2=st2.executeQuery("select pname, rcd, issue from product where pcode="+pcode);
if(rs2.next())
{
pname=rs2.getString("pname");
rcd=rs2.getInt("rcd");
issue=rs2.getInt("issue");
aqty=rcd-issue;
}



//response.sendRedirect("/nontrading/nontrading.jsp");

	if(rqty > aqty)
	{
%>

<script>
alert("Can not transfer items from WH to WH !");
</script>

	
<%
	}

	else
	{
		iqty=rqty;
		ResultSet rs=st.executeQuery("select max(reqno) from request");
		if(rs.next())
		{
		reqno=rs.getInt(1)+1;
		st1.executeUpdate("insert into request values("+reqno+",'"+new java.util.Date() +"','XXX','"+concept+"','"+tr_from+"','"+tr_to+"','"+pname+"',"+pcode+","+iqty+",'r',0)");
		st1.executeUpdate("update request set qty="+iqty+", status='i', issuedate='"+new java.util.Date()+"' where reqno="+reqno);
		st1.executeUpdate("update product set issue=issue+"+iqty+" where pcode="+pcode+" and location='"+tr_from+"'");
		}

		else
		{
		reqno=1;
		st1.executeUpdate("insert into request values("+reqno+",'"+new java.util.Date() +"','XXX','"+concept+"','"+tr_from+"','"+tr_to+"',"+pcode+","+qty+",'r',0)");
		st1.executeUpdate("update request set qty="+iqty+", status='i', issuedate='"+new java.util.Date()+"' where reqno="+reqno);
		st1.executeUpdate("update product set issue=issue+"+iqty+" where pcode="+pcode+" and location='"+tr_from+"'");


		}	
	}



%>

<script>
var rqno=<%=reqno %>
alert("Please Note: REQUEST No.:  "+rqno)
</script>


<%



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

