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
<title>DEPOSIT DETAILS</title>

<link href="CSS/STYLES4.css" rel="stylesheet" type="text/css" /><style type="text/css"></style>
<script type="text/javascript" src="http://127.0.0.1:8080/jasperserver-pro/client/visualize.js"></script>
<script type="text/javascript">
visualize({
    auth: {
        name: "jasperadmin",
        password: "jasperadmin",
        organization: "organization_1"
    }
}, function (v) {
    //render report from provided resource
    v("#container").dashboard({
        resource: "/public/Mydata/Dashboards/AXIS_Bank_Deposit",
        error: handleError
    });
    //show error
    function handleError(err) {
        alert(err.message);
    }
});
</script>


</head>
<%! String getpage;%>
<%try
{
    getpage=session.getAttribute("page").toString();
}
catch(Exception e)
{
    response.sendRedirect("LOGIN.html");
}
%>
<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document; DBCursor cursor;%>
<%! 
    String bank;
    String fname;
    String facno;
    String fbank;
    String tname;
    String tacno;
    String damnt;
    String bamnt;
    String dod;
    %>
    
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="ACCOUNT DETAILS.jsp">Account Details</a></li>
      <li><a href="TRANSACTION_DETAIL_ADMIN.jsp">Transaction Details</a></li>
      <li class="active"><a href="DEPOSIT_DETAIL_ADMIN.jsp">Deposit Details</a>    <!-- end .sidebar1 --></li>
    </ul>
  </div>

  <h1>DEPOSIT DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <input name="submit" type="submit" formnovalidate="formnovalidate" class="DELETE" id="submit" form="DEPOSIT" formaction="logout.jsp" value="SIGN OUT" />
</h1>
      <hr /><div id="viewall">
        <form id="viewall2" name="viewall2" method="post" action="">
        </form>
  </div></p>
    
    <form action="DEPOSIT_DETAIL_ADMIN.jsp" method="post" name="DEPOSIT" target="_self" id="DEPOSIT">
      <table width="902" height="132" border="0" align="center">
        <tr>
          <td height="61"><h3>BANK NAME</h3></td>
          <td><h3>:</h3></td>
          <td><select name="Bname" required="required" id="Bname">
            <option value="" selected="selected">Select Bank</option>
            <option value="AXIS">Axis</option>
            <option value="SBI">Sbi</option>
            <option value="PUNJAB">Punjab</option>
            <option value="ICICI">ICICI</option>
          </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Button" type="submit" class="SUBMIT" id="Button" formaction="DEPOSIT_DETAIL_ADMIN.jsp"  onclick="MM_showHideLayers('Dbtransact','','show')" value="SEARCH" /></td>
        </tr>
        
      </table>
   </form>
  <div id="container"></div>
    <table width="100%" height="155" border="1" id="Dbtransact" >
      <tbody>
        <tr class="HEAD">
          <td align="center" valign="middle"><h6>FROM BANK</h6></td>
          <td align="center" valign="middle"><h6>FROM USER</h6></td>
          <td align="center" valign="middle"><h6>FROM ACCOUNT</h6></td>
          <td align="center" valign="middle"><h6>TO  USER</h6></td>
          <td align="center" valign="middle"><h6>TO  ACCOUNT</h6></td>
          <td align="center" valign="middle"><h6>AMOUNT DEPOSITED</h6></td>
          <td align="center" valign="middle"><h6>BALANCE AMOUNT</h6></td>
          <td align="center" valign="middle"><h6>DATE OF DEPOSITION</h6></td>
        </tr>
 
        <%  try
    		{   
			
			if(request.getParameter("Button")!=null)
			{
				bank=request.getParameter("Bname");
				
            try
            {
                mongo = new MongoClient("localhost", 27017);
                db = mongo.getDB(bank);
                coll = db.getCollection("DEPOSIT");
            }
            catch(Exception e)
            {
            mongo.close();
            session.setAttribute("msg", "PLEASE SELECT THE BANK");
            response.sendRedirect("AdminMessage.jsp");
            }

            cursor = coll.find();
            if(cursor!=null)
            {
                while (cursor.hasNext()) 
                {
                    DBObject cur = cursor.next();
                    
                    dod=cur.get("DOD").toString();
                    
                    DBObject from = (BasicDBObject) cur.get("From");
                    fbank=from.get("Bank").toString();
                    fname=from.get("Name").toString();
                    facno=from.get("Account").toString();

                    
                    DBObject to = (BasicDBObject) cur.get("To");
                    tname=to.get("Name").toString();
                    tacno=to.get("Account").toString();
                    
                    DBObject amount = (BasicDBObject) cur.get("Amount");
                    damnt=amount.get("Deposited").toString();
                    bamnt=amount.get("Balance").toString();
                    
 			%>
          <tr>    
          <td style="font-size: small"><%= fbank %></td>
          <td style="font-size: small"><%= fname %></td>
          <td style="font-size: small"><%= facno %></td>
          <td style="font-size: small"><%= tname %></td>
          <td style="font-size: small"><%= tacno %></td>
          <td style="font-size: small"><%= damnt %></td>
          <td style="font-size: small"><%= bamnt %></td>
          <td style="font-size: small"><%= dod %></td>
          </tr>
		  <% }
            }
            else
            {
                mongo.close();
                session.setAttribute("msg", "INVALID USER NAME.TRY AGAIN");
                response.sendRedirect("AdminMessage.jsp");
            }
			}
        }
    catch(Exception e)
    {
        mongo.close();
        out.println(e);
        //session.setAttribute("msg", "THE USER NAME OR ACCOUNT NUMBER ALREADY EXIST.TRY AGAIN");
        //response.sendRedirect("AdminMessage.jsp");
    }
    
    %>
      </tbody>
    </table>
  
    <!-- end .container --></div>
</body>
</html>
