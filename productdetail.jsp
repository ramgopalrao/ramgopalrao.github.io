<%@page import="java.sql.*" %>
<%@include file="/nontrading.jsp" %>


<html>
<body>
<h3>Non-Trading Inventory System</h3>
  
<form name=frm action="/nontrading/productdetail1.jsp" method=post>
  <table width="75%" border="0">
    <tr>
      <td width="25%" height="36">Item-Code:</td>
      <td width="75%" height="36"> 
        <input type="text" name="pcode">
      </td>
    </tr>
    <tr>
      <td width="25%" height="38">Select Location:</td>
      <td width="75%" height="38"> 
        <select name="locationmaster">
          <option value="Warehouse">Warehouse</option>
          <option value="Showroom">Showroom</option>
        </select>
      </td>
    </tr>
    <tr>
      <td width="25%">&nbsp;</td>
      <td width="75%">
        <input type="submit" name="Submit" value="View For Item Code">
      </td>
    </tr>
  </table>
  </form>
</body></html>