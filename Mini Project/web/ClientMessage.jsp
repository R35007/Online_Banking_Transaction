<%@page import="java.io.*" %>
<%@page import="java.util.Calendar" %>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DB" %>
<%@page import="com.mongodb.DBCollection" %>
<%@page import="com.mongodb.DBCursor" %>
<%@page import="com.mongodb.MongoClient" %>
<%@page import="com.mongodb.MongoException" %>
<%@page import="java.util.Date"%>
<%@page import="java.net.UnknownHostException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MESSAGE</title>

<link href="CSS/STYLES2.css" rel="stylesheet" type="text/css" /><style type="text/css">

</style>
<script type="text/javascript">
</script>
</head>
<%! String message;%>
<%try
{
    message=session.getAttribute("msg").toString();
}
catch(Exception e)
{
    out.println(e);
}
%>
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="DETAILS.jsp">Account Details</a></li>
      <li><a href="TRANSACTOIN.jsp">Transaction</a></li>
      <li><a href="DEPOSIT_DETAIL.jsp">Deposite Details</a></li>
    </ul>
    <p>&nbsp;</p>
    <!-- end .sidebar1 --></div>
  <div class="content">
    <h3>&nbsp;</h3>
    <h3>&nbsp;</h3>
    <h3>&nbsp;</h3>
    <h3 align="center"><%= message %></h3>
<!-- end .content --></div>
  <div class="footer">
    <p>&nbsp;</p>
    <!-- end .container --></div>
</div>
</body>
</html>
