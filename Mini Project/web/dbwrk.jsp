<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DB" %>
<%@page import="com.mongodb.DBCollection" %>
<%@page import="com.mongodb.DBCursor" %>
<%@page import="com.mongodb.MongoClient" %>
<%@page import="com.mongodb.MongoException" %>
<%@page import="java.util.Date"%>
<%@page import="java.net.UnknownHostException" %>

<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;%>

<%! String btn; 
    String bank;
    String acno;
    String acpin;
    int blncamnt;
    String name;
    int date;
    String month;
    int year;
    int age;
    String gender;
    String addrs;
    String city;
    int pncd;
    String cntry;
    String state;
    String cntcno;
    String emgcntcno;
    String eid;
    String dnum;
    String route;
    %>
<% 
   
    try
    {
    btn=request.getParameter("Button");
    bank=request.getParameter("Bname");
    name=request.getParameter("UNAME");
    
    if("INSERT".equals(btn)||"UPDATE".equals(btn))
    {
    acno=request.getParameter("ACCNONUMBR");
    acpin=request.getParameter("ACCNOPIN");
    blncamnt=Integer.parseInt(request.getParameter("BLNCAMNT"));
    date=Integer.parseInt(request.getParameter("DATE"));
    month=request.getParameter("MONTH");
    year=Integer.parseInt(request.getParameter("YEAR"));
    age=Integer.parseInt(request.getParameter("AGE"));
    gender=request.getParameter("GENDER");
    addrs=request.getParameter("HADDRESS");
    dnum=request.getParameter("DNUM");
    route=request.getParameter("ROUTE");
    city=request.getParameter("CITY");
    state=request.getParameter("STATE");
    pncd=Integer.parseInt(request.getParameter("PCODE"));
    cntry=request.getParameter("COUNTRY");
    cntcno=request.getParameter("CNUMBER");
    emgcntcno=request.getParameter("ENUMBER");
    eid=request.getParameter("EADDRESS");
    }
    
    }
    catch(Exception e)
    {
        out.print(e);
    }
    
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
    if("INSERT".equals(btn)||"UPDATE".equals(btn))
    {
    
    BasicDBObject account = new BasicDBObject();
			account.put("Number",acno);
			account.put("Pin", acpin); 
                        account.put("Balance",blncamnt);
                        
    BasicDBObject dob = new BasicDBObject();
			dob.put("Date",date);
			dob.put("Month", month);
                        dob.put("Year",year);
                        
    BasicDBObject contact = new BasicDBObject();
			contact.put("Contact",cntcno);
			contact.put("Emergency", emgcntcno);
                        
    BasicDBObject address = new BasicDBObject();
			address.put("Place",addrs);
                        address.put("Door",dnum);
                        address.put("Route",route);
			address.put("City", city);
                        address.put("State", state);
                        address.put("Pincode",pncd);
                        address.put("Country",cntry);
                      
    
    document = new BasicDBObject();
	document.put("Name", name);
	document.put("Account", account);
	document.put("DOB", dob);
        document.put("Age", age);
        document.put("Gender", gender);
        document.put("Address", address);
        document.put("Email", eid);
        document.put("Contacts", contact);
    }
   
    if("INSERT".equals(btn))
    {
        try
        {
	coll.insert(document);  
        mongo.close();
        session.setAttribute("msg", "SUCESSFULLY INSERTED");
        response.sendRedirect("AdminMessage.jsp");
        }
        catch(Exception e)
        {
        mongo.close();
        session.setAttribute("msg", "THE USER NAME OR ACCOUNT NUMBER ALREADY EXIST.TRY AGAIN");
        response.sendRedirect("AdminMessage.jsp");
        }
    }
    else if("UPDATE".equals(btn))
    {
       try
       {
       BasicDBObject search = new BasicDBObject();
       search.put("Account.Number",acno);
       coll.update(search,document);
       mongo.close();
       session.setAttribute("msg", "SUCESSFULLY UPDATED");
       response.sendRedirect("AdminMessage.jsp");
       }
       catch(Exception e)
       {
        mongo.close();
        session.setAttribute("msg", "THE USER NAME OR ACCOUNT NUMBER ALREADY EXIST.TRY AGAIN");
        response.sendRedirect("AdminMessage.jsp");
       }
    }
    else if("DELETE".equals(btn))
    {
        try
       {
       BasicDBObject search = new BasicDBObject();
       search.put("Account.Number",acno);
       coll.remove(search);
       mongo.close();
       session.setAttribute("msg", "SUCESSFULLY DELETED");
       response.sendRedirect("AdminMessage.jsp");
       }
       catch(Exception e)
       {
        mongo.close();  
        session.setAttribute("msg", "THE USER NAME DOESNOT EXIST.TRY AGAIN");
        response.sendRedirect("AdminMessage.jsp");
       }
    }
%>
