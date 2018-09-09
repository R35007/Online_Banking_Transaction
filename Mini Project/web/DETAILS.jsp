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

<link href="CSS/STYLES2.css" rel="stylesheet" type="text/css" /><style type="text/css">

</style>
<script type="text/javascript">

function Age(){ //v2.0
  var a=document.getElementById('YEAR').value;
  var nowdate=new Date();
  var nowyr=nowdate.getFullYear();
  var i=nowyr-a;
  document.ACCOUNT_DETAILS.AGE.value = i;
}
</script>
</head>
<%! String accno,bank;%>
<%try
{
    accno=session.getAttribute("accno").toString();
    bank=session.getAttribute("bank").toString();
}
catch(Exception e)
{
    response.sendRedirect("LOGIN.html");
}
%>
<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;%>
<%! 
    String user;
    String acno;
    String acpin;
    String blncamnt;
    String date;
    String month;
    String year;
    String age;
    String gender;
    String addrs;
    String dnum;
    String route;
    String city;
    String pncd;
    String cntry;
    String state;
    String cntcno;
    String emgcntcno;
    String eid;
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
            search.put("Account.Number",accno);
            
            DBCursor cursor = coll.find(search);
            while (cursor.hasNext()) 
            {
                DBObject cur = cursor.next();
                    
                    user=cur.get("Name").toString();
                    age=cur.get("Age").toString();
                    eid=cur.get("Email").toString();
                    
                    DBObject account = (BasicDBObject) cur.get("Account");
                    acno=account.get("Number").toString();
                    acpin=account.get("Pin").toString();
                    blncamnt=account.get("Balance").toString();
                    
                    DBObject address = (BasicDBObject) cur.get("Address");
                    addrs=address.get("Place").toString();
                    dnum=address.get("Door").toString();
                    route=address.get("Route").toString();
                    city=address.get("City").toString();
                    state=address.get("State").toString();
                    pncd=address.get("Pincode").toString();
                    cntry=address.get("Country").toString();
                    
                    DBObject contact = (BasicDBObject) cur.get("Contacts");
                    cntcno=contact.get("Contact").toString();
                    emgcntcno=contact.get("Emergency").toString();
            }
    }
    catch(Exception e)
    {
    }
    
    %>
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li class="active"><a href="DETAILS.jsp">Account Details</a></li>
      <li><a href="TRANSACTOIN.jsp">Transaction</a></li>
      <li><a href="DEPOSIT_DETAIL.jsp">Deposite Details</a></li>
    </ul>
    <p>&nbsp;</p>
    <!-- end .sidebar1 --></div>
  <div class="content">
      <h1>
      <h1>ACCOUNT DETAILS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="submit" type="submit" formnovalidate="formnovalidate" class="DELETE" id="submit" form="ACCOUNT_DETAILS" formaction="logout.jsp" value="SIGN OUT" />
        
      </h1>
      <hr />

    <form action="DETAILS.jsp" method="post" name="ACCOUNT_DETAILS" target="_self" id="ACCOUNT_DETAILS">
      <table width="1320" height="1375" border="0">
        <tr>
          <td height="61"><h3>BANK NAME</h3></td>
          <td><h3>:</h3></td>
          <td><input name="Bname" type="text" required="required" class="FIELD" id="Bname" autocomplete="off" value="<%= bank %>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="65" colspan="3"><div align="center" class="HEAD">PERSONAL INFORMATION</div></td>
        </tr>
        <tr>
          <td height="65"><h3>USER NAME</h3></td>
          <td><h3>:</h3></td>
          <td><input name="UNAME" type="text" required="required" class="FIELD" id="UNAME" autocomplete="off" value="<%= user %>" /></td>
        </tr>
        <tr>
          <td height="53"><h3>DATE OF BIRTH</h3></td>
          <td><h3>:</h3></td>
          <td><table width="559" height="52" border="0">
            <tr>
              <td width="153"><select name="DATE" required="required" class="D_O_B" id="DATE">
                <option selected="selected">DATE</option>
                <%
						for(int i=1;i<=31;i++)
						{
				  %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
              </select></td>
              <td width="182"><select name="MONTH" required="required" class="D_O_B" id="MONTH">
                <option selected="selected">MONTH</option>
                <option value="JANUARY">JANUARY</option>
                <option value="FEBRUARY">FEBRUARY</option>
                <option value="MARCH">MARCH</option>
                <option value="APRIL">APRIL</option>
                <option value="MAY">MAY</option>
                <option value="JUNE">JUNE</option>
                <option value="JULY">JULY</option>
                <option value="AUGUST">AUGUST</option>
                <option value="SEPTEMBER">SEPTEMBER</option>
                <option value="OCTOBER">OCTOBER</option>
                <option value="NOVEMBER">NOVEMBER</option>
                <option value="DECEMBER">DECEMBER</option>
              </select></td>
              <td width="210"><select name="YEAR" required="required" class="D_O_B" id="YEAR" onchange="Age()" >
                <option selected="selected">YEAR</option>
                <%
                      Calendar cal=Calendar.getInstance();
                      int y=cal.get(Calendar.YEAR);
                      for (int j=1990;j<=y;j++)
                      {
				  %>
                <option value="<%= j %>"><%= j %></option>
                <% } %>
              </select></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="59"><h3>AGE</h3></td>
          <td><h3>:</h3></td>
          <td><input name="AGE" type="number" required="required" value="<%= age %>" class="CONTACT" id="AGE" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="59"><h3>GENDER</h3></td>
          <td><h3>:</h3></td>
          <td><label> &nbsp;&nbsp;&nbsp;
            <input name="GENDER" type="radio" required="required" id="GENDER_2" value="MALE" />
            MALE</label>
            <label>&nbsp;&nbsp;&nbsp;
              <input type="radio" name="GENDER" value="FEMALE" id="GENDER_3" />
              FEMALE</label></td>
        </tr>
        <tr>
          <td height="61" colspan="3"><div align="center" class="HEAD">ACCOUNT INFORMATION</div></td>
        </tr>
        <tr>
          <td height="61"><h3>ACCOUNT NUMBER</h3></td>
          <td><h3>:</h3></td>
          <td>
            <input name="ACCNONUMBR" type="number" required="required" class="CONTACT" id="ACCNONUMBR" value="<%=acno%>" readonly="readonly" />      
          </td>
        </tr>
        <tr>
          <td width="278" height="61"><h3>ACCOUNT PIN</h3></td>
          <td width="39"><h3>:</h3></td>
          <td width="571">
          <input name="ACCNOPIN" type="number" required="required" class="CONTACT" id="ACCNOPIN" min="1000" value="<%=acpin%>" readonly="readonly" /></td>
        </tr>
          <td height="61"><h3>BALANCE AMOUNT</h3></td>
          <td><h3>:</h3></td>
          <td><input name="BLNCAMNT" type="number" required="required" class="CONTACT" id="BLNCAMNT" value="<%=blncamnt%>" readonly="readonly"/></td>
        </tr>
        <tr>
          <td height="59" colspan="3"><div align="center" class="HEAD">CONTACT INFORMATION</div></td>
        </tr>
        <tr>
          <td height="59"><h3> ADDRESS </h3></td>
          <td><h3>:</h3></td>
          <td><div id="locationField">
            <input name="HADDRESS" type="text" class="GEOADDRESS" id="autocomplete" placeholder="Enter your address"
             onfocus="geolocate()" value="<%=addrs%>" />
            </input>
          </div></td>
        </tr>
        <tr>
          <td height="59"><h3>DOOR NUMBER </h3></td>
          <td><h3>:</h3></td>
          <td><input name="DNUM" type="text" required="required" value="<%=dnum%>" class="CONTACT" id="street_number" /></td>
        </tr>
        <tr>
          <td height="59"><h3>STREET ROUTE </h3></td>
          <td><h3>:</h3></td>
          <td><textarea name="ROUTE" cols="45" rows="5" required="required"  class="TEXTAREA" id="route"><%= route %></textarea></td>
        </tr>
        <tr>
          <td height="59"><h3>CITY</h3></td>
          <td><h3>:</h3></td>
          <td><input name="CITY" type="text" required="required" class="CONTACT" id="locality" value="<%=city%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="59"><h3>STATE</h3></td>
          <td><h3>:</h3></td>
          <td><input name="STATE" type="text" required="required" class="CONTACT" id="administrative_area_level_1" value="<%=state%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="59"><h3>ZIP CODE</h3></td>
          <td><h3>:</h3></td>
          <td><input name="PCODE" type="number" required="required" class="CONTACT" id="postal_code" value="<%=pncd%>" /></td>
        </tr>
        <tr>
          <td height="59"><h3>COUNTRY</h3></td>
          <td><h3>:</h3></td>
          <td><input name="COUNTRY" type="text" required="required" class="CONTACT" id="country" value="<%=cntry%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td height="59"><h3>CONTACT NUMBER</h3></td>
          <td><h3>:</h3></td>
          <td><input name="CNUMBER" type="number" required="required" class="CONTACT" value="<%=cntcno%>" id="CNUMBER" /></td>
        </tr>
        <tr>
          <td height="59"><h3>EMERGENCY CONTACT</h3></td>
          <td><h3>:</h3></td>
          <td><input name="ENUMBER" type="number" class="CONTACT" value="<%=emgcntcno%>" id="ENUMBER" /></td>
        </tr>
        <tr>
          <td height="59"><h3>EMAIL ADDRESS</h3></td>
          <td><h3>:</h3></td>
          <td><input name="EADDRESS" type="email" required="required" value="<%= eid %>" class="EMAIL" id="EADDRESS" autocomplete="off" /></td>
        </tr>
        <script>
      var  autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'long_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
  (document.getElementById('autocomplete')),
            {types: ['geocode']});
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDuQMJQ_SkJv0Z-jQFRuqnvplx9UYzExbw&libraries=places&callback=initAutocomplete" 
        async defer></script>
        <tr>
          <td height="74" colspan="3"><table width="1270" height="88" border="0">
            <tr>
              <td><div align="center">
                <input name="Button" type="submit" class="UPDATE" id="Button" form="ACCOUNT_DETAILS" formaction="clntwrk.jsp" formmethod="post" value="UPDATE" />
              </div></td>
              <td><div align="center">
                <input name="CALCEL" type="reset" class="CANCEL" id="CALCEL" form="ACCOUNT_DETAILS" value="CANCLE" />
              </div></td>
            </tr>
          </table></td>
        </tr>
        
      </table>
   </form>
    <p>&nbsp; 		</p>
  <!-- end .content --></div>
  <div class="footer">
    <p>&nbsp;</p>
    <!-- end .container --></div>
</div>
</body>
</html>
