package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.Calendar;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import java.util.Date;
import java.net.UnknownHostException;

public final class TRANSACTOIN_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String user,bank,facno;
 DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;
 
    
    String samnt;
    String tamnt;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n");
      out.write("<title>TRANSACTION</title>\r\n");
      out.write("<link href=\"SpryAssets/SpryValidationTextField.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link href=\"CSS/STYLES2.css\" rel=\"stylesheet\" type=\"text/css\" /><style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<link href=\"jQueryAssets/SpryValidationSelect.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script src=\"SpryAssets/SpryValidationTextField.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"jQueryAssets/SpryValidationSelect.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function MM_preloadImages() { //v3.0\r\n");
      out.write("  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();\r\n");
      out.write("    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)\r\n");
      out.write("    if (a[i].indexOf(\"#\")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function blncamnt(){ //v2.0\r\n");
      out.write("  var tamnt=document.getElementById('TAMOUNT').value;\r\n");
      out.write("  var samnt=document.getElementById('SAMOUNT').value;\r\n");
      out.write("  var bamnt=samnt-tamnt;\r\n");
      out.write("  document.TRANSACTION.BAMOUNT.value = bamnt;\r\n");
      out.write("  }\r\n");
      out.write("function MM_popupMsg(msg) { //v1.0\r\n");
      out.write("  alert(msg);\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("    \r\n");
      out.write("    ");
      out.write('\r');
      out.write('\n');
try
{
    facno=session.getAttribute("accno").toString(); 
    user=session.getAttribute("user").toString(); 
    bank=session.getAttribute("bank").toString();
}
catch(Exception e)
{
    response.sendRedirect("LOGIN.html");
}

      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("    ");
 
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
    
    
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("  <div class=\"header\">EASY ONLINE BANKING</div>\r\n");
      out.write("  <div class=\"sidebar1\">\r\n");
      out.write("    <ul class=\"nav\">\r\n");
      out.write("      <li><a href=\"DETAILS.jsp\">Account Details</a></li>\r\n");
      out.write("      <li><a href=\"TRANSACTOIN.jsp\">Transaction </a></li>\r\n");
      out.write("      <li><a href=\"DEPOSIT_DETAIL.jsp\">Deposit Details</a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("    <p>&nbsp;</p>\r\n");
      out.write("    <!-- end .sidebar1 --></div>\r\n");
      out.write("  <div class=\"content\">\r\n");
      out.write("    <h1>TRANSACTION \r\n");
      out.write("    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("      <input name=\"submit\" type=\"submit\" formnovalidate=\"formnovalidate\" class=\"DELETE\" id=\"submit\" form=\"viewall2\" formaction=\"logout.jsp\" value=\"SIGN OUT\" />\r\n");
      out.write("    </h1>\r\n");
      out.write("    <hr /><div id=\"viewall\">\r\n");
      out.write("        <form id=\"viewall2\" name=\"viewall2\" method=\"post\" action=\"TRANSACTION_DETAILS.jsp\">\r\n");
      out.write("        <input name=\"submit3\" type=\"submit\" class=\"SUBMIT\" id=\"submit3\" form=\"viewall2\" formaction=\"TRANSACTION_DETAILS.jsp\" formmethod=\"POST\" value=\"VIEW ALL\" />\r\n");
      out.write("      </form>\r\n");
      out.write("  </div>\r\n");
      out.write("<form action=\"TRANSACTION.jsp\" method=\"post\" name=\"TRANSACTION\" target=\"_self\" id=\"TRANSACTION\">\r\n");
      out.write("      <table width=\"1390\" height=\"712\" border=\"0\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\" colspan=\"3\"><div align=\"center\" class=\"HEAD\">FROM ACCOUNT</div></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>BANK NAME</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><input name=\"FBname\" type=\"text\" class=\"CONTACT\" id=\"FBname\" value=\"");
      out.print(bank);
      out.write("\" readonly=\"readonly\" /></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>ACCOUNT USER</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><label for=\"UNAME\"></label>\r\n");
      out.write("            <span id=\"SPRYID3\">\r\n");
      out.write("              <input name=\"UNAME\" type=\"text\" value=\"");
      out.print(user);
      out.write("\" class=\"CONTACT\" id=\"UNAME\" readonly=\"readonly\" />\r\n");
      out.write("          <span class=\"textfieldRequiredMsg\">Required.</span><span class=\"textfieldInvalidFormatMsg\">Only Integer is allowed.</span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>ACCOUNT NUMBER</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><label for=\"FACNUMBER\"></label>\r\n");
      out.write("            <span id=\"SPRYID\">\r\n");
      out.write("            <input name=\"FACNUMBER\" type=\"text\" value=\"");
      out.print(facno);
      out.write("\" class=\"CONTACT\" id=\"FACNUMBER\" readonly=\"readonly\" />\r\n");
      out.write("          <span class=\"textfieldRequiredMsg\">Required.</span><span class=\"textfieldInvalidFormatMsg\">Only Integer is allowed.</span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"278\" height=\"61\"><h3>ACCNOUNT PIN</h3></td>\r\n");
      out.write("          <td width=\"39\"><h3>:</h3></td>\r\n");
      out.write("          <td width=\"571\"><span id=\"SPRYCNAME\">\r\n");
      out.write("          <label for=\"NAME2\">\r\n");
      out.write("            <input name=\"ACPIN\" type=\"password\" class=\"CONTACT\" id=\"ACPIN\" />\r\n");
      out.write("          </label>\r\n");
      out.write("          <span class=\"textfieldRequiredMsg\">PIN is Required.</span><span class=\"textfieldInvalidFormatMsg\">Only Integer is allowed..</span><span class=\"textfieldMaxValueMsg\">Only 4 number is allowed.</span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>SAVINGS AMOUNT</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><input name=\"SAMOUNT\" type=\"number\" value=\"");
      out.print(samnt);
      out.write("\" class=\"CONTACT\" id=\"SAMOUNT\" readonly=\"readonly\" /></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>TRANSACT  AMOUNT</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><span id=\"SPRYCNAME5\">\r\n");
      out.write("            <label for=\"NAME4\">\r\n");
      out.write("              <input name=\"TAMOUNT\" type=\"text\" class=\"CONTACT\" id=\"TAMOUNT\" onblur=\"blncamnt()\"  />\r\n");
      out.write("            </label>\r\n");
      out.write("          <span class=\"textfieldRequiredMsg\">Required.</span><span class=\"textfieldInvalidFormatMsg\">Only Integer is allowed.</span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>BALANCE AMOUNT</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><input name=\"BAMOUNT\" type=\"number\" required=\"required\" class=\"CONTACT\" id=\"BAMOUNT\" readonly=\"readonly\" /></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"65\" colspan=\"3\"><div align=\"center\" class=\"HEAD\">TO ACCOUNT</div></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>BANK NAME</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><span id=\"spryselect1\">\r\n");
      out.write("            <select name=\"Bname\" required=\"required\" id=\"Bname\">\r\n");
      out.write("              <option>Select Bank</option>\r\n");
      out.write("              <option value=\"AXIS\">Axis</option>\r\n");
      out.write("              <option value=\"SBI\">Sbi</option>\r\n");
      out.write("              <option value=\"PUNJAB\">Punjab</option>\r\n");
      out.write("              <option value=\"ICICI\">ICICI</option>\r\n");
      out.write("            </select>\r\n");
      out.write("          <span class=\"selectRequiredMsg\">Please select the bank.</span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td height=\"61\"><h3>ACCOUNT NUMBER</h3></td>\r\n");
      out.write("          <td><h3>:</h3></td>\r\n");
      out.write("          <td><label for=\"TACNUMBER\"></label>\r\n");
      out.write("            <span id=\"SPRYID2\">\r\n");
      out.write("              <input name=\"TACNUMBER\" type=\"text\" class=\"CONTACT\" id=\"TACNUMBER\" />\r\n");
      out.write("          <span class=\"textfieldRequiredMsg\">Required.</span><span class=\"textfieldInvalidFormatMsg\">Only Integer is allowed.</span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("    </form>\r\n");
      out.write("    \r\n");
      out.write("    <table width=\"901\" height=\"88\" border=\"0\">\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td><div align=\"center\">\r\n");
      out.write("          <input name=\"Button\" type=\"submit\" class=\"SUBMIT\" id=\"Button\" form=\"TRANSACTION\" formaction=\"clntwrk.jsp\" formmethod=\"POST\" value=\"TRANSACT\" />\r\n");
      out.write("        </div></td>\r\n");
      out.write("        <td><div align=\"center\">\r\n");
      out.write("          <input name=\"CALCEL\" type=\"reset\" class=\"CANCEL\" id=\"CALCEL\" form=\"ACCOUNT_DETAILS\" value=\"CANCLE\" />\r\n");
      out.write("        </div></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("    <p>&nbsp; \t\t</p>\r\n");
      out.write("  <!-- end .content --></div>\r\n");
      out.write("  <div class=\"footer\">\r\n");
      out.write("    <p>&nbsp;</p>\r\n");
      out.write("    <!-- end .container --></div>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var sprytextfield2 = new Spry.Widget.ValidationTextField(\"SPRYCNAME\", \"integer\", {validateOn:[\"change\"]});\r\n");
      out.write("var sprytextfield3 = new Spry.Widget.ValidationTextField(\"SPRYID\", \"integer\", {isRequired:false});\r\n");
      out.write("var sprytextfield2 = new Spry.Widget.ValidationTextField(\"SPRYCNAME5\", \"integer\", {validateOn:[\"change\"]});\r\n");
      out.write("var sprytextfield3 = new Spry.Widget.ValidationTextField(\"SPRYID2\", \"integer\", {validateOn:[\"change\"]});\r\n");
      out.write("var spryselect1 = new Spry.Widget.ValidationSelect(\"spryselect1\", {validateOn:[\"change\"]});\r\n");
      out.write("var sprytextfield3 = new Spry.Widget.ValidationTextField(\"SPRYID3\", \"none\", {isRequired:false});\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
