<html><body>

<%
session=request.getSession();
session.setAttribute("conceptsess", null);
session.setAttribute("locationsess", null);
session.setAttribute("statussess", null);
session.setAttribute("logtimesess", null);
session.setAttribute("usersess", null);


response.sendRedirect("/nontrading/logout1.html");
%>


</body></html>