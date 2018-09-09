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
<title>TRANSACTION DETAILS</title>

<link href="CSS/STYLES5.css" rel="stylesheet" type="text/css" /><style type="text/css"></style>

</head>
<%! String user,facno,bank;%>
<%try
{
    facno=session.getAttribute("accno").toString();
    user=session.getAttribute("user").toString();
    bank=session.getAttribute("bank").toString();
}
catch(Exception e)
{
    response.sendRedirect("LOGIN.html");
}
%>
<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;%>
<%! 
	String fname;
    String tbank;
    String tname;
	String tacno;
	String tamnt;
	String bamnt;
	String dot;
%>
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="DETAILS.jsp">Account Details</a></li>
      <li class="active"><a href="TRANSACTOIN.jsp">Transaction</a></li>
      <li><a href="DEPOSIT_DETAIL.jsp">Deposit Details</a>    <!-- end .sidebar1 --></li>
    </ul>
  </div>
    <h1>TRANSACTION DETAILS    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="submit" type="submit" formnovalidate="formnovalidate" class="DELETE" id="submit" form="form1" formaction="logout.jsp" value="SIGN OUT" />
    </h1>
    <hr />
    <form id="form1" name="form1" method="post" action="logout.jsp">
    </form>
    <p></p>
    <table width="100%" height="142" border="1" id="ALLRECORDS">
      <tbody>
        <tr class="HEAD">
          <td align="center" valign="middle"><h6>FROM USER</h6></td>
          <td align="center" valign="middle"><h6>FROM ACCOUNT</h6></td>
          <td align="center" valign="middle"><h6>TO BANK</h6></td>
          <td align="center" valign="middle"><h6>TO  USER</h6></td>
          <td align="center" valign="middle"><h6>TO  ACCOUNT</h6></td>
          <td align="center" valign="middle"><h6>AMOUNT TRANSACTED</h6></td>
          <td align="center" valign="middle"><h6>BALANCE AMOUNT</h6></td>
          <td align="center" valign="middle"><h6>DATE OF TRANSACTION</h6></td>
        </tr>
 
        <%  try
    		{   
            try
            {
                mongo = new MongoClient("localhost", 27017);
                db = mongo.getDB(bank);
                coll = db.getCollection("TRANSACTION");
            }
            catch(Exception e)
            {
            mongo.close();
            session.setAttribute("msg", "PLEASE SELECT THE BANK");
            response.sendRedirect("ClientMessage.jsp");
            } 
            
            BasicDBObject search = new BasicDBObject();
            search.put("From.Account",facno);
            
            DBCursor cursor = coll.find(search);
            if(cursor!=null)
            {
                while (cursor.hasNext()) 
                {
                	DBObject cur = cursor.next();
                    
                    dot=cur.get("DOT").toString();
                    
                    DBObject from = (BasicDBObject) cur.get("From");
                    fname=from.get("Name").toString();
                    facno=from.get("Account").toString();

                    
                    DBObject to = (BasicDBObject) cur.get("To");
                    tbank=to.get("Bank").toString();
                    tname=to.get("Name").toString();
                    tacno=to.get("Account").toString();
                    
                    DBObject amount = (BasicDBObject) cur.get("Amount");
                    tamnt=amount.get("Transacted").toString();
                    bamnt=amount.get("Balance").toString();
                    
 			%>
          <tr>    
          <td style="font-size: small"><%= fname %></td>
          <td style="font-size: small"><%= facno %></td>
          <td style="font-size: small"><%= tbank %></td>
          <td style="font-size: small"><%= tname %></td>
          <td style="font-size: small"><%= tacno %></td>
          <td style="font-size: small"><%= tamnt %></td>
          <td style="font-size: small"><%= bamnt %></td>
          <td style="font-size: small"><%= dot %></td>
          </tr>
		  <% }
            }
            else
            {
                mongo.close();
                session.setAttribute("msg", "INVALID USER NAME.TRY AGAIN");
                response.sendRedirect("ClientMessage.jsp");
            }
        }
    catch(Exception e)
    {
        mongo.close();
        session.setAttribute("msg", "THE USER NAME OR ACCOUNT NUMBER ALREADY EXIST.TRY AGAIN");
        response.sendRedirect("ClientMessage.jsp");
    }
    
    %>
      </tbody>
  </table>
    
      <!-- end .container -->
    </div>
    <div class="footer">
      <p>&nbsp;</p>
</div>
</body>
</html>
