


<%
String location="";
String user="";
String logtime="";

%>

<%
session=request.getSession();
logtime=(session.getAttribute("logtimesess")).toString();
location=(session.getAttribute("locationsess")).toString();
user=(session.getAttribute("usersess")).toString();
%>






<head>
<title>Non Trading Inventory</title>
<h3 align=center>Gate-Pass Module </h3>  
<hr>
Welcome, <font color=red><%=user %></font> <br>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr align="center"> 
    
    <td width="70%"><b>Transactions/Requests 
      &amp; reports </b></td>
    <td width="30%" align="right"><b><a href="/nontrading/logout.jsp"> </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/nontrading/logout.jsp">Logout</a></b></td>
 </tr>
     <tr><td width="80%">
      <a href="/nontrading/addproduct2.jsp">New 
        Product </a>| <a href="/nontrading/listproduct2.jsp">List Product </a><a href="/nontrading/receipt2.jsp"> 
        Receive Stock</a> &nbsp;|&nbsp;<a href="/nontrading/request2.jsp"> 
        Request for Gatepass</a> &nbsp;| &nbsp; <a href="/nontrading/gendoc2.jsp">Create Gate-Pass</a> 
        &nbsp;|<a href="/nontrading/docprint2.jsp">View-Print Doc</a></span> &nbsp; |  
   
   
     
            <a href="/nontrading/productdetail2.jsp">Item Detail</a> &nbsp;|<a href="/nontrading/productstock.jsp">Product 
        Stock</a> 
    </td>
  </tr>
</table>
<hr>
</body>

</html>
