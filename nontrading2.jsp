
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
<h3 align=center>Quotation Module </h3>  
<hr>
Welcome, <font color=red><%=user %></font> <br>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr align="center"> 
    
    <td width="70%"><b>Transactions/Requests 
      &amp; reports </b></td>
    <td width="30%" align="right"><b><a href="/nontrading/logout.jsp"> </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/nontrading/logout.jsp">Logout</a></b></td>
 </tr>
     <tr><td width="80%">
      <a href="/nontrading/createquote.jsp">Create New Quotation </a>| <a href="/nontrading/listquote.jsp">List Quotation </a> | &nbsp; &nbsp; <a href="/nontrading/docquote.jsp">Print Quotation</a> 
        &nbsp;|<a href="/nontrading/subsidy.jsp">Enter Subsidy Received</a></span> &nbsp; |  
   
   
     
            
    </td>
  </tr>
</table>
<hr>
</body>

</html>
