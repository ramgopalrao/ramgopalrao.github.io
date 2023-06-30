<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>

<%
int pcode=0;
String rdate="";
String tr_to="";
String pdesc="";
String tr_from="";
int qty=0;
int reqno=0;

Connection con=null;
Statement st=null;
%>

<html>
<body>
<h3>Enter Document No.</h3>
<form name=frm action="/nontrading/docprint1.jsp" method=post>
<table width="29%" border="1">
  <tr> 
    <td width="37%">Enter Document No.</td>
    <td colspan="2" width="63%"> 
      <input type="text" name="docno">
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <input type="submit" name="Submit" value="Submit">
    </td>
  </tr>
</table> </form>
<h3> 
  <h3><br>
  </h3>
</h3>
</body></html>
