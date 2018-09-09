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

public final class TRANSACTION_005fDETAILS_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String user,facno,bank;
 DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;
 
	String fname;
    String tbank;
    String tname;
	String tacno;
	String tamnt;
	String bamnt;
	String dot;

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
      out.write("<title>TRANSACTION DETAILS</title>\r\n");
      out.write("\r\n");
      out.write("<link href=\"CSS/STYLES5.css\" rel=\"stylesheet\" type=\"text/css\" /><style type=\"text/css\"></style>\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://127.0.0.1:8080/jasperserver-pro/client/visualize.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("visualize({\r\n");
      out.write("    auth: {\r\n");
      out.write("        name: \"jasperadmin\",\r\n");
      out.write("        password: \"jasperadmin\",\r\n");
      out.write("        organization: \"organization_1\"\r\n");
      out.write("    }\r\n");
      out.write("}, function (v) {\r\n");
      out.write("    //render report from provided resource\r\n");
      out.write("    v(\"#container\").report({\r\n");
      out.write("        resource: \"/public/Mydata/Reports/AXIS_Bank_Transaction_Report\",\r\n");
      out.write("        error: handleError\r\n");
      out.write("    });\r\n");
      out.write("    //show error\r\n");
      out.write("    function handleError(err) {\r\n");
      out.write("        alert(err.message);\r\n");
      out.write("    }\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
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
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("  <div class=\"header\">EASY ONLINE BANKING</div>\r\n");
      out.write("  <div class=\"sidebar1\">\r\n");
      out.write("    <ul class=\"nav\">\r\n");
      out.write("      <li><a href=\"DETAILS.jsp\">Account Details</a></li>\r\n");
      out.write("      <li><a href=\"TRANSACTOIN.jsp\">Transaction</a></li>\r\n");
      out.write("      <li><a href=\"DEPOSIT_DETAIL.jsp\">Deposit Details</a>    <!-- end .sidebar1 --></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("    <h1>TRANSACTION DETAILS    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("      <input name=\"submit\" type=\"submit\" formnovalidate=\"formnovalidate\" class=\"DELETE\" id=\"submit\" form=\"form1\" formaction=\"logout.jsp\" value=\"SIGN OUT\" />\r\n");
      out.write("    </h1>\r\n");
      out.write("    <hr />\r\n");
      out.write("    <form id=\"form1\" name=\"form1\" method=\"post\" action=\"logout.jsp\">\r\n");
      out.write("    </form>\r\n");
      out.write("    <p><div align=\"center\"><div id=\"container\" align=\"center\"></div></div></p>\r\n");
      out.write("    <table width=\"100%\" height=\"142\" border=\"1\" id=\"ALLRECORDS\">\r\n");
      out.write("      <tbody>\r\n");
      out.write("        <tr class=\"HEAD\">\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>FROM USER</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>FROM ACCOUNT</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>TO BANK</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>TO  USER</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>TO  ACCOUNT</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>AMOUNT TRANSACTED</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>BALANCE AMOUNT</h6></td>\r\n");
      out.write("          <td align=\"center\" valign=\"middle\"><h6>DATE OF TRANSACTION</h6></td>\r\n");
      out.write("        </tr>\r\n");
      out.write(" \r\n");
      out.write("        ");
  try
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
                    
 			
      out.write("\r\n");
      out.write("          <tr>    \r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( fname );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( facno );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( tbank );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( tname );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( tacno );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( tamnt );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( bamnt );
      out.write("</td>\r\n");
      out.write("          <td style=\"font-size: small\">");
      out.print( dot );
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\t\t  ");
 }
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
    
    
      out.write("\r\n");
      out.write("      </tbody>\r\n");
      out.write("  </table>\r\n");
      out.write("    \r\n");
      out.write("      <!-- end .container -->\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"footer\">\r\n");
      out.write("      <p>&nbsp;</p>\r\n");
      out.write("</div>\r\n");
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
