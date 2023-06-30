<%@page import="java.sql.*" %>

<%
int q_no;
String q_date="";

String c_name="";
String c_add1="";
String c_add2="";
String c_tel="";

String item_name1="";
String item_name2="";

int item_basic1;
int item_basic2;

double item_tax1;
double item_tax2;

double tax1_val;
double tax2_val;

double tot_value1;
double tot_value2;

int qty1;
int qty2;

double tot_val=0;



Connection con=null;
Statement st=null;
%>

<html>
<body>

  <table width="70%"  align=center>
    <tr> 
      <td align=center>
        <font size="+2"><b>QUOTATION</b></font>
      </td>
    </tr>
  </table>
<hr>
<p>&nbsp;</p>

  
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ce)
{}

try{
con=DriverManager.getConnection("jdbc:odbc:nontrading");

st=con.createStatement();

q_no=Integer.parseInt(request.getParameter("q_no"));

ResultSet rs=st.executeQuery("select * from quot where q_no="+q_no);

if(rs.next())
{
q_date=rs.getString("q_date");

c_name=rs.getString("c_name");
c_add1=rs.getString("c_add1");
c_add2=rs.getString("c_add2");
c_tel=rs.getString("c_tel");

item_name1=rs.getString("item_name1");
item_name2=rs.getString("item_name2");

item_basic1=rs.getInt("item_basic1");
item_basic2=rs.getInt("item_basic2");

item_tax1=rs.getDouble("item_tax1");
item_tax2=rs.getDouble("item_tax2");

tax1_val=rs.getDouble("tax1_val");
tax2_val=rs.getDouble("tax2_val");

tot_value1=rs.getDouble("tot_value1");
tot_value2=rs.getDouble("tot_value2");

qty1=rs.getInt("item_qty1");
qty2=rs.getInt("item_qty2");



tot_val=tot_value1+tot_value2;












%> 
<b>Quotation No. <%= q_no%> <br>Date:<%=q_date %></b><br><hr>

<br><br><b>To,</b><br><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=c_name %><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=c_add1 %><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=c_add2 %><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=c_tel %> <br>


  </font></p>
<table border=2 width=90%>
  <tr> 
    
    <td> 
      <div align="center"><b>Item Name </b></div>
    </td>
    <td> 
      <div align="center"><b>Basic Rate</b></div>
    </td>
    <td> 
      <div align="center"><b>VAT %</b></div>
    </td>
    <td> 
      <div align="center"><b>Qty</b></div>
    </td>
    <td> 
      <div align="center"><b>Total VAT</b></div>
    </td>
    <td> 
      <div align="center"><b>Total Amount</b></div>
    </td>

  </tr>




  <tr> 
    <td><%=item_name1 %></td>
    <td><%=item_basic1 %></td>
    <td><%=item_tax1 %></td>
    <td><%=qty1 %></td>
    <td><%=tax1_val %></td>
    <td><%=tot_value1 %></td>
 </tr>

  <%

if(item_basic2>=1)
{

%>

<tr> 
    <td><%=item_name2 %></td>
    <td><%=item_basic2 %></td>
    <td><%=item_tax2 %></td>
    <td><%=qty2 %></td>
    <td><%=tax2_val %></td>
    <td><%=tot_value2 %></td>
 </tr>


<%
}

}
else
{
%>

<script>
var dn=<%=q_no %>
alert("Sorry, Quotation No. "+dn+" Does Not Exists! \n\nPlease press 'Back Space Button'")
</script>
<%

}


}
catch(SQLException se1)
{}
%> 
</table>
<b>    Total Value :</b> <%=tot_val %>

<hr><br><br><br>

<u><b>
Terms and Conditions:</u></b><br>
1. Delivery within 15 days from the date of order.<br>
2. Plumbing charges at Actual. <br>
3. Offering 1 year warranty for Solar Tank and 7 years warranty for Solar Collectors except glass.<br>
4, The above price includes transportation and installation charges.<br>
<hr><br><br><br>

<B>For Vijaya Industries,</b><br><br><br><br><br>


(Authorized Signatory)

</body></html>
