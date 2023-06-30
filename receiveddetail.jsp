<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>


<html>
<body>

  
<form name=frm action="/nontrading/receiveddetail1.jsp" method=post>
  <p>Item-Code: 
    <input type="text" name="pcode">
  </p>
  <p>
    <br>
  
  <input type="submit" name="Submit" value="Received For Item Code">
</form>
</body></html>