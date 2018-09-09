<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ADMIN</title>
<link href="CSS/STYLES3.css" rel="stylesheet" type="text/css" /><style type="text/css">

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
      <li><a href="ACCOUNT DETAILS.jsp">Account Details</a></li>
      <li><a href="TRANSACTION_DETAIL_ADMIN.jsp">Transaction Details</a></li>
      <li><a href="DEPOSIT_DETAIL_ADMIN.jsp">Deposite Details</a></li>
    </ul>
    <p>&nbsp;</p>
    <!-- end .sidebar1 --></div>
  <div class="content">
    <h3>&nbsp;</h3>
    <h3>&nbsp;</h3>
    <h3>&nbsp;</h3>
    <h3 align="center"><%= message %></h3>
      
  </div>
  <div class="footer">
    <p>&nbsp;</p>
    <!-- end .container --></div>
</div>
</body>
</html>
