<%@page import="java.sql.*"%>


<%
String user="";
String pass="";
String concept="";
String location="";
String status="";
String logtime="";

Connection con=null;
Statement st=null;
Statement st1=null;

%>
<html><body>

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
user=request.getParameter("user");
pass=request.getParameter("pass");
}
catch(NullPointerException ne)
{}

try{
st=con.createStatement();
st1=con.createStatement();

ResultSet rs=st.executeQuery("select * from user where username='"+user+"' and password='"+pass+"'");

if(rs.next())
{

do
{
concept=rs.getString("concept");
location=rs.getString("location");
status=rs.getString("status");
logtime=rs.getString("logtime");
}while(rs.next());

session=request.getSession();
session.setAttribute("conceptsess", concept);
session.setAttribute("locationsess", location);
session.setAttribute("statussess", status);
session.setAttribute("logtimesess", logtime);
session.setAttribute("usersess", user);


st1.executeUpdate("update user set logtime='"+new java.util.Date()+"' where username='"+user+"'");
response.sendRedirect("/nontrading/login2.html");

}
else
{
response.sendRedirect("/nontrading/login.html");
}

}
catch(SQLException se1)
{}

%>
</body></html>