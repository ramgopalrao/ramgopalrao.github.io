<%@ page import="java.sql.*, java.util.Date;" %>
<HTML>
<meta http-equiv="refresh" content="0;URL=/nontrading/nontrading2.jsp">

<BODY>

<%
int item_basic1=0;
int item_basic2=0;
String c_name="";
String c_add1="";
String c_add2="";
String c_tel="";
String item_name1="";
String item_name2="";
double item_tax1=0;
double item_tax2=0;
double tax1_val=0;
double tax2_val=0;
double tot_value1=0;
double tot_value2=0;
int qty1=0;
int qty2=0;
int q_no=0;


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

c_name=request.getParameter("c_name");
c_add1=request.getParameter("c_add1");
c_add2=request.getParameter("c_add2");
c_tel=request.getParameter("c_tel");
item_name1=request.getParameter("productmaster1");
item_name2=request.getParameter("productmaster2");
item_tax1=Double.parseDouble(request.getParameter("item_tax1"));
item_tax2=Double.parseDouble(request.getParameter("item_tax2"));
item_basic1=Integer.parseInt(request.getParameter("item_basic1"));
item_basic2=Integer.parseInt(request.getParameter("item_basic2"));
qty1=Integer.parseInt(request.getParameter("qty1"));
qty2=Integer.parseInt(request.getParameter("qty2"));

tax1_val=(item_basic1*qty1*item_tax1)/100;
tax2_val=(item_basic2*qty2*item_tax2)/100;


tot_value1=(item_basic1*qty1)+tax1_val;

tot_value2=(item_basic2*qty2)+tax2_val;





ResultSet rs=st.executeQuery("select max(q_no) from quot");
if(rs.next())
{
q_no=rs.getInt(1)+1;
st1.executeUpdate("insert into quot values("+q_no+",'"+new java.util.Date() +"','"+c_name+"','"+c_add1+"','"+c_add2+"','"+c_tel+"','pending','xxx','"+item_name1+"',"+item_basic1+","+qty1+","+item_tax1+","+tax1_val+","+tot_value1+",'"+item_name2+"',"+item_basic2+","+qty2+","+item_tax2+","+tax2_val+","+tot_value2+",0,'xxx','xxx','xxx',0,'xxx')");

%>

<script>
var qno1=<%=q_no %>
alert("Please Note: Quotation No.:  "+qno1)
</script>


<%


}

else
{
q_no=1;
st1.executeUpdate("insert into quot values("+q_no+",'"+new java.util.Date() +"','"+c_name+"','"+c_add1+"','"+c_add2+"','"+c_tel+"','pending','xxx','"+item_name1+"',"+item_basic1+","+qty1+","+item_tax1+","+tax1_val+","+tot_value1+",'"+item_name2+"',"+item_basic2+","+qty2+","+item_tax2+","+tax2_val+","+tot_value2+",0,'xxx','xxx','xxx',0,'xxx')");
%>

<script>
var qno=<%=q_no %>
alert("Please Note: Quotation No.:  "+qno)
</script>


<%


}




}
catch(SQLException se1)
{}

%>



</BODY>
</HTML>

