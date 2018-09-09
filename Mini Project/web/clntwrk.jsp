<%@page import="com.mongodb.DBObject"%>
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
    
    String fbank;
    String fsacno;
    int facno;
    int samnt;
    int tamnt;
    int bamnt;
    
    String dname;
    String dacpin;
    String dacno;
    String sacpin;
    String sacno;
    String dblnc;
    String tuser;
    String toeid;
    int iblnc;
    int addamnt;
    int iacno;
    
    Date dtdate;
    
    %>
<% 
    try
    {
    btn=request.getParameter("Button");
    bank=request.getParameter("Bname");
    name=request.getParameter("UNAME");
    
    if("UPDATE".equals(btn))
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
    else if("TRANSACT".equals(btn))
    {
        fbank=request.getParameter("FBname");
        
	fsacno=request.getParameter("FACNUMBER");
        facno=Integer.parseInt(fsacno);
        
        sacpin=request.getParameter("ACPIN");
        samnt=Integer.parseInt(request.getParameter("SAMOUNT"));
        tamnt=Integer.parseInt(request.getParameter("TAMOUNT"));
        bamnt=Integer.parseInt(request.getParameter("BAMOUNT"));
        sacno=request.getParameter("TACNUMBER");
        
    }
    
    }
    catch(Exception e)
    {
        out.println("test");
        out.print(e);
    }
    
    
    if("UPDATE".equals(btn))
    {
    
         try
    {
    mongo = new MongoClient("localhost", 27017);
        db = mongo.getDB(bank);
        coll = db.getCollection("ACCOUNTS");
    }
    catch(Exception e)
    {
        mongo.close();
        out.print("DB Error");
        out.print(e);
    } 
        
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
        
         try
       {
       BasicDBObject search = new BasicDBObject();
       search.put("Name",name);
       coll.update(search,document);
       mongo.close();
       session.setAttribute("msg", "SUCESSFULLY UPDATED");
       response.sendRedirect("ClientMessage.jsp");
       }
       catch(Exception e)
       {
        mongo.close();
        session.setAttribute("msg", "THE USER NAME OR ACCOUNT NUMBER ALREADY EXIST.TRY AGAIN");
        response.sendRedirect("ClientMessage.jsp");
       }
          
    }
    else if("TRANSACT".equals(btn))
    {
        
        try
        {
            mongo = new MongoClient("localhost", 27017);
            db = mongo.getDB(fbank);
            coll = db.getCollection("ACCOUNTS");
        }
        catch(Exception e)
        {
            mongo.close();
            out.print(e);
        } 
        
        BasicDBObject search = new BasicDBObject();
            search.put("Account.Number",fsacno);
            
            DBCursor cursor = coll.find(search);
            if(cursor!=null)
            {
                while (cursor.hasNext()) 
                {
                DBObject cur = cursor.next();
                    
                    dname=cur.get("Name").toString();
                    eid=cur.get("Email").toString();
                    
                    DBObject account = (BasicDBObject) cur.get("Account");
                    dacno=account.get("Number").toString(); 
                    dacpin=account.get("Pin").toString(); 
                    mongo.close();
                }
            }
            else
            {
                mongo.close();
                session.setAttribute("msg", "INVALID USER NAME.TRY AGAIN");
                response.sendRedirect("ClientMessage.jsp");
            }
            
       if(fsacno.equals(dacno)) 
       {
           if(sacpin.equals(dacpin))
           {
               try
                {
                    mongo = new MongoClient("localhost", 27017);
                    db = mongo.getDB(bank);
                    coll = db.getCollection("ACCOUNTS");
                }
                catch(Exception e)
                {
                    mongo.close();
                    out.print("Db error inside transact");
                    out.print(e);
                } 
               try
                {
                iacno=Integer.parseInt(sacno);
                BasicDBObject tosearch = new BasicDBObject();
                tosearch.put("Account.Number",sacno);
                
            
                DBCursor cursor2 = coll.find(tosearch);
                if(cursor2!=null)
                {
                    while (cursor2.hasNext()) 
                    {
                        
                        DBObject cur2 = cursor2.next();
                        tuser=cur2.get("Name").toString();
                        toeid=cur2.get("Email").toString();
                        DBObject account2 = (BasicDBObject) cur2.get("Account");
                        dacno=account2.get("Number").toString();
                        dblnc=account2.get("Balance").toString();
                        mongo.close();
                        
                    }
                }
                else
                {
                    mongo.close();
                    session.setAttribute("msg", "INVALID ACCOUNT NUMBER.TRY AGAIN");
                    response.sendRedirect("ClientMessage.jsp");
                }
                
                iblnc=Integer.parseInt(dblnc);
                addamnt=iblnc+tamnt;
                
                if(sacno.equals(dacno))
                {
                    if(facno!=iacno)
                    {
                        if(bamnt>=500)
                        {
                            try
                            {
                                mongo = new MongoClient("localhost", 27017);
                                db = mongo.getDB(fbank);    
                                coll=db.getCollection("ACCOUNTS");
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print("Db error inside blnc check");
                                out.print(e);
                            } 
                            try
                            {
                            BasicDBObject balance = new BasicDBObject();
                            balance.put("Account.Balance",bamnt);
                            
                            BasicDBObject setbalance = new BasicDBObject();
                            setbalance.put("$set",balance);
                            
                            BasicDBObject frmacnt = new BasicDBObject();
                            frmacnt.put("Account.Number",fsacno);
                            
                            coll.update(frmacnt,setbalance);
                            mongo.close();
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print("update error 1");
                                out.println(e);
                            }
                            
                            try
                            {
                                mongo = new MongoClient("localhost", 27017);
                                db = mongo.getDB(bank);    
                                coll=db.getCollection("ACCOUNTS");
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print("db error aftr update 1");
                                out.print(e);
                            } 
                            
                            try
                            {
                            BasicDBObject balance = new BasicDBObject();
                            balance.put("Account.Balance",addamnt);
                            
                            BasicDBObject setbalance = new BasicDBObject();
                            setbalance.put("$set",balance);
                            
                            BasicDBObject frmacnt = new BasicDBObject();
                            frmacnt.put("Account.Number",sacno);
                            
                            coll.update(frmacnt,setbalance);
                            mongo.close();
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print("update error 2");
                                out.println(e);
                            }
                            
                            dtdate=new Date();
                            try
                            {
                                mongo = new MongoClient("localhost", 27017);
                                db = mongo.getDB(fbank);    
                                coll=db.getCollection("TRANSACTION");
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print("db error aftr update error 2");
                                out.print(e);
                            } 
                            try
                            {
                            BasicDBObject from = new BasicDBObject();
                            from.put("Name",name);
                            from.put("Account",fsacno);
                            
                            BasicDBObject to = new BasicDBObject();
                            to.put("Bank",bank);
                            to.put("Name",tuser);
                            to.put("Account",sacno);
                            
                            BasicDBObject amount = new BasicDBObject();
                            amount.put("Transacted",tamnt);
                            amount.put("Balance",bamnt);
                            
                            document = new BasicDBObject();
                            document.put("From",from);
                            document.put("To",to);
                            document.put("Amount",amount);
                            document.put("DOT",dtdate);
                        
                            coll.insert(document);
                            
                            mongo.close();
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print("transaction insert error");
                                out.println(e);  
                            }
                            
                            try
                            {
                                mongo = new MongoClient("localhost", 27017);
                                db = mongo.getDB(bank);    
                                coll=db.getCollection("DEPOSIT");
                            }
                            catch(Exception e)
                            {
                                mongo.close();
                                out.print(e);
                            } 
                            try
                            {
                            BasicDBObject from = new BasicDBObject();
                            from.put("Bank",fbank);
                            from.put("Name",name);
                            from.put("Account",fsacno);
                            
                            BasicDBObject to = new BasicDBObject();
                            to.put("Name",tuser);
                            to.put("Account",sacno);
                            
                            BasicDBObject amount = new BasicDBObject();
                            amount.put("Deposited",tamnt);
                            amount.put("Balance",addamnt);
                            
                            document = new BasicDBObject();
                            document.put("From",from);
                            document.put("To",to);
                            document.put("Amount",amount);
                            document.put("DOD",dtdate);
                        
                            coll.insert(document);
                            
                            mongo.close();
                            }
                            catch(Exception e)
                            {
                                mongo.close();  
                                out.print("deposit error");
                                out.println(e);  
                            }
                            
                            mongo.close();
                            out.print(toeid); 
                            %>
                            <jsp:forward page="mail">
                                <jsp:param name="page" value="Transact"></jsp:param>
                                <jsp:param name="from" value="<%= fbank%>"></jsp:param>
                                <jsp:param name="account" value="<%= fsacno%>"></jsp:param>
                                <jsp:param name="tobank" value="<%= bank%>"></jsp:param>
                                <jsp:param name="toaccount" value="<%= sacno %>"></jsp:param>
                                <jsp:param name="amount" value="<%= tamnt%>"></jsp:param>
                                <jsp:param name="to" value="<%= toeid %>"></jsp:param>
                                <jsp:param name="fromid" value="<%= eid %>"></jsp:param>
                            </jsp:forward>
                    <%
                        }
                        else
                        {
                            mongo.close();
                            session.setAttribute("msg", "YOUR BALANCE AMOUNT MUST BE ATLEAST 500/-");
                            response.sendRedirect("ClientMessage.jsp");
                        }
                    }
                    else
                    {
                    mongo.close();
                    session.setAttribute("msg", "TO ACCOUNT NUMBER CAN NOT BE SAME AS FROM ACCOUNT NUMBER. TRY AGAIN");
                    response.sendRedirect("ClientMessage.jsp");
                    }
                    
                }
                else
                {
                    mongo.close();
                    session.setAttribute("msg", "INVALID TO ACCOUNT NUMBER");
                    response.sendRedirect("ClientMessage.jsp");
                }
                 }
           catch(Exception e)
                   {
                       out.print("overall error");
                   out.println(e);
                   }
            }
            else
            {
                mongo.close();
                session.setAttribute("msg", "INVALID ACCOUNT PIN");
                response.sendRedirect("ClientMessage.jsp");
            }
           
          
           
        }
        else
        {
            mongo.close();
            session.setAttribute("msg", "INVALID USER");
            response.sendRedirect("ClientMessage.jsp");
        }
           
    }
%>
