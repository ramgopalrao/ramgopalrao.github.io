


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






<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<title>Non Trading Inventory</title>
</head>

<body>
<h3>Non-Trading Inventory System </h3>  
<hr>
Welcome, <font color=red><%=user %></font> <br>
<b>Last Login Time</b>: <%= logtime %>
  language:EN;mso-ansi-language:EN'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<p></p>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="" align="center"> 
    <td width="19%" align="center"><b>Supplier &nbsp;&nbsp;&nbsp;&nbsp;</b></td>
    <td width="22%"><b>Product</b></td>
    <td width="49%"><b><Transactions/Requests 
      &amp; reports </b></td>
    <td width="10%" rowspan="3"><b><a href="/nontrading/logout.jsp"> </a> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/nontrading/logout.jsp">Logout</a></b></td>
  </tr>
  <tr bgcolor=""> 
    <td width="19%" align="center"> 
      <div align="center"><a href="/nontrading/supplier.jsp">New Supplier 
        </a>| <a href="/nontrading/listsupplier.jsp">List Supplier</a>|</span></div>
    </td>
    <td width="22%"> 
      <div align="center"><a href="/nontrading/addproduct.jsp">New 
        Product </a>| <a href="/nontrading/listproduct.jsp">List Product </a></div>
    </td>
    <td width="49%"> 
      <div align="center"><a href="/nontrading/receipt.jsp"> 
        Receive Stock</a> &nbsp;|&nbsp; <a href="/nontrading/request.jsp">New 
        Request </a> &nbsp;|&nbsp; <a href="/nontrading/gendoc.jsp">CreateDoc</a> 
        &nbsp;|<a href="/nontrading/docprint.jsp">View-Print Doc</a> &nbsp;|<a href="/nontrading/receiveddetail.jsp">Received 
        Dtl</a> &nbsp; | <a href="/nontrading/retwh.jsp">Return to WH</a> &nbsp;|</div>
    </td>
  </tr>
  <tr bgcolor=""> 
    <td width="19%" align="center"> 
      <div align="center"><b></b></div>
    </td>
    <td width="22%"> 
      <div align="center"></div>
    </td>
    <td width="49%"> 
      <div align="center"><a href="/nontrading/getreq1.jsp">Get 
        Request / Issue to Store </a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; <a href="/nontrading/consumption.jsp">Consumption 
        at Store </a></span>&nbsp;&nbsp;| <a
  href="/nontrading/productdetail.jsp">Item Detail</a> &nbsp;|<a href="/nontrading/productstock.jsp">Product 
        Stock</a> <o:p>&nbsp;|</div>
    </td>
  </tr>
</table>
<hr>
</body>

</html>
