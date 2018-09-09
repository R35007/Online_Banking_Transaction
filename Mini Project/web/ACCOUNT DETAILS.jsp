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

<link href="CSS/STYLES3.css" rel="stylesheet" type="text/css" /><style type="text/css">

</style>
<link href="jQueryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<script src="jQueryAssets/SpryValidationSelect.js" type="text/javascript"></script>
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
    String name;
    String btn=null;
    String bank="";
    String acno="";
    String acpin="";
    String blncamnt="";
    String uname="";
    String date;
    String month;
    String year;
    String age;
    String gender;
    String addrs="";
    String city="";
    String pncd="";
    String cntry="";
    String state="";
    String cntcno="";
    String emgcntcno="";
    String eid="";
    String dnum="";
    String route="";
    %>
    <% 
    try
    {   
        btn=request.getParameter("SEARCH");
        if(btn!=null)
        {
            bank=request.getParameter("Bname");
            acno=request.getParameter("ACCNONUMBR");
            
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
            
            BasicDBObject search = new BasicDBObject();
            search.put("Account.Number",acno);
            try
            {
            cursor = coll.find(search);
            }
            catch(Exception e)
                    {
                        mongo.close();
                session.setAttribute("msg", "INVALID USER NAME.TRY AGAIN");
                response.sendRedirect("AdminMessage.jsp"); 
                    }
            if(cursor==null)
            {
                mongo.close();
                session.setAttribute("msg", "INVALID USER NAME.TRY AGAIN");
                response.sendRedirect("AdminMessage.jsp");
            }
            else if(cursor!=null)
            {
                while (cursor.hasNext()) 
                {
                DBObject cur = cursor.next();
                    
                    uname=cur.get("Name").toString();
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
                    
                    mongo.close();
                }
            }
        }
    }
    catch(Exception e)
    {
        mongo.close();
        session.setAttribute("msg", "TTRY AGAIN");
        response.sendRedirect("AdminMessage.jsp");
    }
    
    %>
<body>
<div class="container">
  <div class="header">EASY ONLINE BANKING</div>
  <div class="sidebar1">
    <ul class="nav">
      <li class="active"><a href="ACCOUNT DETAILS.jsp" >Account Details</a></li>
      <li><a href="TRANSACTION_DETAIL_ADMIN.jsp">Transaction Details</a></li>
      <li><a href="DEPOSIT_DETAIL_ADMIN.jsp">Deposit Details</a></li>
    </ul>
    <p>&nbsp;</p>
    <!-- end .sidebar1 --></div>
  <div class="content">
    <h1>ACCOUNT DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="submit" type="submit" formnovalidate="formnovalidate" class="DELETE" id="submit" form="viewall2" formaction="logout.jsp" value="SIGN OUT" />
</h1><hr />
<div id="viewall">
        <form id="viewall2" name="viewall2" method="post" action="ALL_ACCOUNT_DETAILS.jsp">
        <input name="submit3" type="submit" class="SUBMIT" id="submit3" form="viewall2" formaction="ALL_ACCOUNT_DETAILS.jsp" value="VIEW ALL" />
      </form>
  </div></p>
    
    <form action="ACCOUNT DETAILS.jsp" method="post" name="ACCOUNT_DETAILS" target="_self" id="ACCOUNT_DETAILS">
      <table width="1320" height="1375" border="0">
        <tr>
          <td height="61"><h3>BANK NAME</h3></td>
          <td><h3>:</h3></td>
          <td><span id="spryselect1">
            <select name="Bname" required="required" id="Bname">
              <option value="" selected="selected">Select Bank</option>
              <option value="AXIS">Axis</option>
              <option value="SBI">Sbi</option>
              <option value="PUNJAB">Punjab</option>
              <option value="ICICI">ICICI</option>
            </select>
          <span class="selectInvalidMsg">Please select a valid item.</span><span class="selectRequiredMsg">Please select an item.</span></span></td>
        </tr>
        <tr>
          <td height="61" colspan="3"><div align="center" class="HEAD">ACCOUNT INFORMATION</div></td>
        </tr>
        <tr>
          <td height="61"><h3>ACCOUNT NUMBER</h3></td>
          <td><h3>:</h3></td>
          <td>
            <input name="ACCNONUMBR" type="number" required="required" class="CONTACT" value="<%=acno%>" id="ACCNONUMBR" />      
          </td>
        </tr>
        <tr>
          <td width="287" height="61"><h3>ACCOUNT PIN</h3></td>
          <td width="40"><h3>:</h3></td>
          <td width="921">
          <input name="ACCNOPIN" type="number" required="required" value="<%=acpin%>" class="CONTACT" id="ACCNOPIN" min="1000" /></td>
        </tr>
        <tr>
          <td height="61"><h3>BALANCE AMOUNT</h3></td>
          <td><h3>:</h3></td>
          <td><input name="BLNCAMNT" type="number" required="required" value="<%=blncamnt%>" class="CONTACT" id="BLNCAMNT"/></td>
        </tr>
        <tr>
          <td height="65" colspan="3"><div align="center" class="HEAD">PERSONAL INFORMATION</div></td>
        </tr>
        <tr>
          <td height="65"><h3>USER NAME</h3></td>
          <td><h3>:</h3></td>
          <td><input name="UNAME" type="text" required="required" class="FIELD" id="UNAME" autocomplete="off" value="<%= uname %>" /></td>
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
          <td height="59" colspan="3"><div align="center" class="HEAD">CONTACT INFORMATION</div></td>
        </tr>
        <tr>
          <td height="59"><h3> ADDRESS </h3></td>
          <td><h3>:</h3></td>
          <td><div id="locationField">
      <input name="HADDRESS" type="text" class="GEOADDRESS" id="autocomplete" placeholder="Enter your address"
             onFocus="geolocate()" value="<%=addrs%>"></input>
    </div></td>
        </tr>
        <tr>
          <td height="59"><h3>DOOR NUMBER </h3></td>
          <td><h3>:</h3></td>
          <td>
            <input name="DNUM" type="text" required="required" value="<%=dnum%>" class="CONTACT" id="street_number" />
          </td>
        </tr>
        <tr>
          <td height="59"><h3>STREET ROUTE </h3></td>
          <td><h3>:</h3></td>
          <td><textarea name="ROUTE" cols="45" rows="5" required="required"  class="TEXTAREA" id="route"><%=route%></textarea></td>
        </tr>
        <tr>
          <td height="59"><h3>CITY</h3></td>
          <td><h3>:</h3></td>
          <td><input name="CITY" type="text" required="required" class="CONTACT" id="locality" value="<%=city%>" readonly="readonly" />         
          </td>
        </tr>
        <tr>
          <td height="59"><h3>STATE</h3></td>
          <td><h3>:</h3></td>
          <td>
            <input name="STATE" type="text" required="required" class="CONTACT" id="administrative_area_level_1" value="<%=state%>" readonly="readonly" />
          </td>
        </tr>
        <tr>
          <td height="59"><h3>ZIP CODE</h3></td>
          <td><h3>:</h3></td>
          <td><input name="PCODE" type="number" required="required" value="<%=pncd%>" class="CONTACT" id="postal_code" /></td>
        </tr>
        <tr>
          <td height="59"><h3>COUNTRY</h3></td>
          <td><h3>:</h3></td>
          <td>
            <input name="COUNTRY" type="text" required="required" class="CONTACT" id="country" value="<%=cntry%>" readonly="readonly" />
         </td>
        </tr>
        <tr>
          <td height="59"><h3>CONTACT NUMBER</h3></td>
          <td><h3>:</h3></td>
          <td><input name="CNUMBER" type="number" required="required" class="CONTACT" id="CNUMBER" max="9999999999" min="1000000" value="<%=cntcno%>" /></td>
        </tr>
        <tr>
          <td height="59"><h3>EMERGENCY CONTACT</h3></td>
          <td><h3>:</h3></td>
          <td><input name="ENUMBER" type="number" class="CONTACT" value="<%=emgcntcno%>" id="ENUMBER" max="9999999999" min="1000000"/></td>
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
          <td height="74" colspan="3"><table width="1272" height="88" border="0">
            <tr>
              <td width="249"><div align="center">
                <input name="Button" type="submit" class="SUBMIT" id="Button" form="ACCOUNT_DETAILS" formaction="dbwrk.jsp" formmethod="post" value="INSERT" />
              </div></td>
              <td width="249"><div align="center">
                <input name="SEARCH" type="submit" formnovalidate="formnovalidate" class="VIEW" id="SEARCH" form="ACCOUNT_DETAILS" formaction="ACCOUNT DETAILS.jsp" formmethod="post" value="SEARCH" />
              </div></td>
              <td width="249"><div align="center">
                <input name="Button" type="submit" class="UPDATE" id="Button" form="ACCOUNT_DETAILS" formaction="dbwrk.jsp" formmethod="post" value="UPDATE" />
              </div></td>
              <td width="249"><div align="center">
                <input name="CALCEL" type="reset" class="CANCEL" id="CALCEL" form="ACCOUNT_DETAILS" value="CANCLE" />
              </div></td>
              <td width="254"><div align="center" id="END">
                <input name="Button" type="submit" formnovalidate="formnovalidate" class="DELETE" id="Button" form="ACCOUNT_DETAILS" formaction="dbwrk.jsp" formmethod="post" value="DELETE" />
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
<script type="text/javascript">
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {invalidValue:"-1"});
</script>
</body>
</html>
