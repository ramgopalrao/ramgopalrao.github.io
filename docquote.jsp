<%@page import="java.sql.*" %>
<%@include file="/nontrading2.jsp" %>

<html>
<body>
<h3>Enter Quotation No.</h3>
<form name=frm action="/nontrading/docquote1.jsp" method=post>
<table width="29%" border="1">
  <tr> 
    <td width="37%">Enter Quotation No.</td>
    <td colspan="2" width="63%"> 
      <input type="text" name="q_no">
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
