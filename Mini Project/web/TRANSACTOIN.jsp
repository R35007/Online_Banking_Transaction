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
<title>TRANSACTION</title>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link href="CSS/STYLES2.css" rel="stylesheet" type="text/css" /><style type="text/css">

</style>
<link href="jQueryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="jQueryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function blncamnt(){ //v2.0
  var tamnt=document.getElementById('TAMOUNT').value;
  var samnt=document.getElementById('SAMOUNT').value;
  var bamnt=samnt-tamnt;
  document.TRANSACTION.BAMOUNT.value = bamnt;
  }
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
</script>
</head>
    
    <%! String user,bank,facno;%>
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
    
    String samnt;
    String tamnt;
%>
    <% 
    try
    { 
            try
            {
                mongo = new MongoClient("localhost", 27017);
                db = mongo.getDB(bank);
                coll = db.getCollection("ACCOUNTS");
            }
            catch(Exception e)
            {
                out.print(e);
            } 
            
            BasicDBObject search = new BasicDBObject();
            search.put("Account.Number",facno);
            
            DBCursor cursor = coll.find(search);
            
            if(cursor!=null)
            {
            while (cursor.hasNext()) 
            {
                DBObject cur = cursor.next();
                    
                    user=cur.get("Name").toString();                 
                    DBObject account = (BasicDBObject) cur.get("Account");
                    facno=account.get("Number").toString();
                    samnt=account.get("Balance").toString();
                    mongo.close();
            }
            
            }
            else
            {
                  out.println("Invalid user or bank");      
            }
    }
    catch(Exception e)
    {
        mongo.close();
        out.println(e);
    }
    
    %>
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="DETAILS.jsp">Account Details</a></li>
      <li><a href="TRANSACTOIN.jsp">Transaction </a></li>
      <li><a href="DEPOSIT_DETAIL.jsp">Deposit Details</a></li>
    </ul>
    <p>&nbsp;</p>
    <!-- end .sidebar1 --></div>
  <div class="content">
    <h1>TRANSACTION 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="submit" type="submit" formnovalidate="formnovalidate" class="DELETE" id="submit" form="viewall2" formaction="logout.jsp" value="SIGN OUT" />
    </h1>
    <hr /><div id="viewall">
        <form id="viewall2" name="viewall2" method="post" action="TRANSACTION_DETAILS.jsp">
        &nbsp;&nbsp;<input name="submit3" type="submit" class="SUBMIT" id="submit3" form="viewall2" formaction="TRANSACTION_DETAILS.jsp" formmethod="POST" value="VIEW ALL" />
      </form>
  </div>
<form action="TRANSACTION.jsp" method="post" name="TRANSACTION" target="_self" id="TRANSACTION">
      <table width="1390" height="712" border="0">
        <tr>
          <td height="61" colspan="3"><div align="center" class="HEAD">FROM ACCOUNT</div></td>
        </tr>
        <tr>
          <td height="61"><h3>BANK NAME</h3></td>
          <td><h3>:</h3></td>
          <td><input name="FBname" type="text" class="CONTACT" id="FBname" value="<%=bank%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="61"><h3>ACCOUNT USER</h3></td>
          <td><h3>:</h3></td>
          <td><label for="UNAME"></label>
            <span id="SPRYID3">
              <input name="UNAME" type="text" value="<%=user%>" class="CONTACT" id="UNAME" readonly="readonly" />
          <span class="textfieldRequiredMsg">Required.</span><span class="textfieldInvalidFormatMsg">Only Integer is allowed.</span></span></td>
        </tr>
        <tr>
          <td height="61"><h3>ACCOUNT NUMBER</h3></td>
          <td><h3>:</h3></td>
          <td><label for="FACNUMBER"></label>
            <span id="SPRYID">
            <input name="FACNUMBER" type="text" value="<%=facno%>" class="CONTACT" id="FACNUMBER" readonly="readonly" />
          <span class="textfieldRequiredMsg">Required.</span><span class="textfieldInvalidFormatMsg">Only Integer is allowed.</span></span></td>
        </tr>
        <tr>
          <td width="278" height="61"><h3>ACCNOUNT PIN</h3></td>
          <td width="39"><h3>:</h3></td>
          <td width="571"><span id="SPRYCNAME">
          <label for="NAME2">
            <input name="ACPIN" type="password" class="CONTACT" id="ACPIN" />
          </label>
          <span class="textfieldRequiredMsg">PIN is Required.</span><span class="textfieldInvalidFormatMsg">Only Integer is allowed..</span><span class="textfieldMaxValueMsg">Only 4 number is allowed.</span></span></td>
        </tr>
        <tr>
          <td height="61"><h3>SAVINGS AMOUNT</h3></td>
          <td><h3>:</h3></td>
          <td><input name="SAMOUNT" type="number" value="<%=samnt%>" class="CONTACT" id="SAMOUNT" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="61"><h3>TRANSACT  AMOUNT</h3></td>
          <td><h3>:</h3></td>
          <td><span id="SPRYCNAME5">
            <label for="NAME4">
              <input name="TAMOUNT" type="text" class="CONTACT" id="TAMOUNT" onblur="blncamnt()"  />
            </label>
          <span class="textfieldRequiredMsg">Required.</span><span class="textfieldInvalidFormatMsg">Only Integer is allowed.</span></span></td>
        </tr>
        <tr>
          <td height="61"><h3>BALANCE AMOUNT</h3></td>
          <td><h3>:</h3></td>
          <td><input name="BAMOUNT" type="number" required="required" class="CONTACT" id="BAMOUNT" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="65" colspan="3"><div align="center" class="HEAD">TO ACCOUNT</div></td>
        </tr>
        <tr>
          <td height="61"><h3>BANK NAME</h3></td>
          <td><h3>:</h3></td>
          <td><span id="spryselect1">
            <select name="Bname" required="required" id="Bname">
              <option>Select Bank</option>
              <option value="AXIS">Axis</option>
              <option value="SBI">Sbi</option>
              <option value="PUNJAB">Punjab</option>
              <option value="ICICI">ICICI</option>
            </select>
          <span class="selectRequiredMsg">Please select the bank.</span></span></td>
        </tr>
        <tr>
          <td height="61"><h3>ACCOUNT NUMBER</h3></td>
          <td><h3>:</h3></td>
          <td><label for="TACNUMBER"></label>
            <span id="SPRYID2">
              <input name="TACNUMBER" type="text" class="CONTACT" id="TACNUMBER" />
          <span class="textfieldRequiredMsg">Required.</span><span class="textfieldInvalidFormatMsg">Only Integer is allowed.</span></span></td>
        </tr>
      </table>
    </form>
    
    <table width="901" height="88" border="0">
      <tr>
        <td><div align="center">
          <input name="Button" type="submit" class="SUBMIT" id="Button" form="TRANSACTION" formaction="clntwrk.jsp" formmethod="POST" value="TRANSACT" />
        </div></td>
        <td><div align="center">
          <input name="CALCEL" type="reset" class="CANCEL" id="CALCEL" form="ACCOUNT_DETAILS" value="CANCLE" />
        </div></td>
      </tr>
    </table>
    <p>&nbsp; 		</p>
  <!-- end .content --></div>
  <div class="footer">
    <p>&nbsp;</p>
    <!-- end .container --></div>
</div>
<script type="text/javascript">
var sprytextfield2 = new Spry.Widget.ValidationTextField("SPRYCNAME", "integer", {validateOn:["change"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("SPRYID", "integer", {isRequired:false});
var sprytextfield2 = new Spry.Widget.ValidationTextField("SPRYCNAME5", "integer", {validateOn:["change"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("SPRYID2", "integer", {validateOn:["change"]});
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {validateOn:["change"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("SPRYID3", "none", {isRequired:false});
</script>
</body>
</html>
