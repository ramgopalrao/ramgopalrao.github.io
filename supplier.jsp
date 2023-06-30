<%@ include file="/nontrading.jsp" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF">
<p>&nbsp;</p>
<p><b>Enter New Supplier:</b></p>
<form method="post" action="/nontrading/supplier1.jsp">
  <table width="75%" border="0">
    <tr>
      <td width="16%">Supplier Code:</td>
      <td width="84%">
        <input type="text" name="scode">
      </td>
    </tr>
    <tr>
      <td width="16%">Supplier Name:</td>
      <td width="84%">
        <input type="text" name="sname">
      </td>
    </tr>
    <tr>
      <td width="16%">Address:</td>
      <td width="84%">
        <input type="text" name="saddress">
      </td>
    </tr>
    <tr>
      <td width="16%">Phone: </td>
      <td width="84%">
        <input type="text" name="sphone">
      </td>
    </tr>
    <tr>
      <td width="16%">&nbsp;</td>
      <td width="84%">
        <input type="submit" name="Submit" value="Save Supplier">
      </td>
    </tr>
  </table>
  <p>&nbsp; </p>
  <p>&nbsp; </p>
  <p>&nbsp; </p>
  <p>&nbsp; </p>
  <p>&nbsp; </p>
</form>
<p>&nbsp; </p>
</body>
</html>
