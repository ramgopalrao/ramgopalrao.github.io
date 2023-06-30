<%@page import="java.sql.*" %>
<%@include file="/nontrading2.jsp" %>

<%
int q_no;
String q_date="";
String c_name="";
String c_tel="";
String item_name1="";
String item_name2="";
double tot_value1;
double tot_value2;
double tot_val;

Connection con=null;
Statement st=null;
%>

<html>
<body>
<h3>Pending Qoutation List: 
  <h3><br>
<table border=2 width=100%>
<tr><td>Quotation No.</td><td>Quot. Date </td><td>Customer Name</td><td>Cust. Tel No.</td><td>Item1</td><td>Item2</td><td>Total Value</td></tr>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();


ResultSet rs=st.executeQuery("select * from quot where q_status='pending' order by q_no asc");

if(rs.next())
do
{
q_no=rs.getInt("q_no");
q_date=rs.getString("q_date");
c_name=rs.getString("c_name");
c_tel=rs.getString("c_tel");
item_name1=rs.getString("item_name1");
item_name2=rs.getString("item_name2");
tot_value1=rs.getDouble("tot_value1");
tot_value2=rs.getDouble("tot_value2");
tot_val=tot_value1+tot_value2;
%>
<tr><td><%=q_no %></td><td><%=q_date %></td><td><%=c_name %></td><td><%=c_tel %></td><td><%=item_name1 %></td><td><%=item_name2 %></td><td><%=tot_val %></td></tr>

<%

}while(rs.next());


}
catch(SQLException se1)
{}
%></table>
</h3></h3></body></html>