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
<title>ACCOUNT DETAILS</title>

<link href="CSS/STYLES4.css" rel="stylesheet" type="text/css" /><style type="text/css">

</style>
<script type="text/javascript">

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
<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;%>
<%! 
    String bank;
    String name;
    String acno;
    String acpin;
    String blncamnt;
    String date;
    String month;
    String year;
    String age;
    String gender;
    String addrs;
    String city;
    String pncd;
    String cntry;
    String state;
    String cntcno;
    String emgcntcno;
    String eid;
	String dnum="";
    String route="";
	
	String addr;
	String Dateofbirth;
    %>
    
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="ACCOUNT DETAILS.jsp">Account Details</a></li>
      <li><a href="TRANSACTION_DETAIL_ADMIN.jsp">Transaction Details</a></li>
      <li><a href="DEPOSIT_DETAIL_ADMIN.jsp">Deposit Details</a><!-- end .sidebar1 --></li>
    </ul>
  </div>

  <h1>ALL ACCOUNT DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <input name="submit" type="submit" formnovalidate="formnovalidate" class="DELETE" id="submit" form="ACCOUNT" formaction="logout.jsp" value="SIGN OUT" />
  </h1>
  <hr />
  <p>&nbsp; </p>
  <form action="ALL_ACCOUNT_DETAILS.jsp" method="post" name="ACCOUNT" target="_self" id="ACCOUNT">
    <table width="953" height="133" border="0" align="center">
        <tr>
          <td width="278" height="61"><h3>BANK NAME</h3></td>
          <td width="39"><h3>:</h3></td>
          <td width="571"><select name="Bname" required="required" id="Bname">
            <option value="" selected="selected">Select Bank</option>
            <option value="AXIS">Axis</option>
            <option value="SBI">Sbi</option>
            <option value="PUNJAB">Punjab</option>
            <option value="ICICI">ICICI</option>
          </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="Button" type="submit" class="SUBMIT" id="Button" formaction="ALL_ACCOUNT_DETAILS.jsp" value="SEARCH" /></td>
        </tr>
        
    </table>
  </form>
  <p>&nbsp;</p>
  <!-- end .content --></div>
<table width="100%" height="167" border="1" id="DBACCOUNTS">
    <tbody>
        <tr class="HEAD">
          <td width="7%" align="center" valign="middle"><h6>NAME</h6></td>
          <td width="8%" align="center" valign="middle"><h6>ACCOUNT NUMBER</h6></td>
          <td width="8%" align="center" valign="middle"><h6>ACCOUNT PIN</h6></td>
          <td width="8%" align="center" valign="middle"><h6>BALANCE AMOUNT</h6></td>
          <td width="7%" align="center" valign="middle"><h6>DOB</h6></td>
          <td width="5%" align="center" valign="middle"><h6>AGE</h6></td>
          <td width="7%" align="center" valign="middle"><h6>GENDER</h6></td>
          <td width="22%" align="center" valign="middle"><h6>ADDRESS</h6>
          <td width="9%" align="center" valign="middle"><h6>EMAIL</h6>
          <td width="10%" align="center" valign="middle"><h6>CONTACT</h6>
          <td width="9%" align="center" valign="middle"><h6>EMERGENCY CONTACT</h6>
          </td>
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
                coll = db.getCollection("ACCOUNTS");
            }
            catch(Exception e)
            {
            mongo.close();
            session.setAttribute("msg", "PLEASE SELECT THE BANK");
            response.sendRedirect("AdminMessage.jsp");
            } 
            
            DBCursor cursor = coll.find();
            if(cursor!=null)
            {
                while (cursor.hasNext()) 
                {
                	DBObject cur = cursor.next();
                    
                    name=cur.get("Name").toString();
                    age=cur.get("Age").toString();
                    eid=cur.get("Email").toString();
					gender=cur.get("Gender").toString();
                    
                    DBObject account = (BasicDBObject) cur.get("Account");
                    acno=account.get("Number").toString();
                    acpin=account.get("Pin").toString();
                    blncamnt=account.get("Balance").toString();
					
					  
                    DBObject dob= (BasicDBObject) cur.get("DOB");
                    date=dob.get("Date").toString();
                    month=dob.get("Month").toString();
                    year=dob.get("Year").toString();
					
					Dateofbirth=date+"-"+month+"-"+year;
                    
                    DBObject address = (BasicDBObject) cur.get("Address");
                    addrs=address.get("Place").toString();
					dnum=address.get("Door").toString();
                    route=address.get("Route").toString();
                    city=address.get("City").toString();
                    state=address.get("State").toString();
                    pncd=address.get("Pincode").toString();
                    cntry=address.get("Country").toString();
                    
					addr=addrs+"-"+dnum+"-"+route+"-"+city+"-"+state+"-"+pncd+"-"+cntry;
					
                    DBObject contact = (BasicDBObject) cur.get("Contacts");
                    cntcno=contact.get("Contact").toString();
                    emgcntcno=contact.get("Emergency").toString();
 			%>
          <tr>    
          <td style="font-size: small"><%= name %></td>
          <td style="font-size: small"><%= acno %></td>
          <td style="font-size: small"><%= acpin %></td>
          <td style="font-size: small"><%= blncamnt %></td>
          <td style="font-size: small"><%= Dateofbirth %></td>
          <td style="font-size: small"><%= age %></td>
          <td style="font-size: small"><%= gender %></td>
          <td style="font-size: small"><%= addr %></td>
          <td style="font-size: small"><%= eid %></td>
          <td style="font-size: small"><%= cntcno %></td>
          <td style="font-size: small"><%= emgcntcno %></td>
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
</body>
</html>
