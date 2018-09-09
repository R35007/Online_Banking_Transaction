<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MESSAGE</title>
<link href="CSS/STYLES1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
<!--Adobe Edge Runtime-->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <script type="text/javascript" charset="utf-8" src="edge_includes/edge.5.0.1.min.js"></script>
    <style>
        .edgeLoad-EDGE-25323261 { visibility:hidden; }
        img { display: block; }
    </style>
<!--Adobe Edge Runtime End-->

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
      <li><a href="LOGIN.html">User Login</a></li>
      <li><a href="REGISTRATION.html">Register Here</a></li>
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
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
    
</html>