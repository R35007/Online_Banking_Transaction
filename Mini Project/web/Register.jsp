<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DB" %>
<%@page import="com.mongodb.DBCollection" %>
<%@page import="com.mongodb.DBCursor" %>
<%@page import="com.mongodb.MongoClient" %>
<%@page import="com.mongodb.MongoException" %>
<%@page import="java.util.Date"%>
<%@page import="java.net.UnknownHostException" %>

<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;%>

<%! String bank;
    String name;
    String acno;
    String acpin;
    String eid; 
    String pswd;
    
    String dname;
    String dacno;
    String dacpin;
    String deid; 
    String dpswd;
%>
<% 
    try
    {
            bank=request.getParameter("Bname");
            name=request.getParameter("NAME");
            acno=request.getParameter("ACNUMBER");
            acpin=request.getParameter("ACPIN");
            eid=request.getParameter("EID");
            pswd=request.getParameter("PASSWORD");
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
            search.put("Account.Number",acno);
            
            DBCursor cursor = coll.find(search);
            
            if(cursor!=null)
            {
            while (cursor.hasNext()) 
            {
                DBObject cur = cursor.next();
                    
                    dname=cur.get("Name").toString();
                    DBObject account = (BasicDBObject) cur.get("Account");
                    dacno=account.get("Number").toString();
                    dacpin=account.get("Pin").toString();
                    mongo.close();
                    
            }
            }
            else
            {
                mongo.close();
                session.setAttribute("msg", "INVALID ACCOUNT");
                response.sendRedirect("AuthenticationMessage.jsp");
            }
    }
    catch(Exception e)
    {
        mongo.close();
        out.println(e);
    }
    try
    {
       
    if(name.equals(dname))
    {
        if(acno.equals(dacno))
        {
            if(acpin.equals(dacpin))
            {
                 try
                {
                mongo = new MongoClient("localhost", 27017);
                db= mongo.getDB("EOB");
                coll= db.getCollection(bank);
                }
                catch(Exception e)
                {
                out.print(e);
                } 
        
                document = new BasicDBObject();
                document.put("Name",name);
                document.put("Account Number",acno);
                document.put("Password",pswd);
                document.put("DOP",new Date());
                document.put("Email",eid);
                try
                {
                coll.insert(document);
                mongo.close();
                
                %>
                    
                <jsp:forward page="mail">
                    <jsp:param name="page" value="register"></jsp:param>
                    <jsp:param name="to" value="<%= eid%>"></jsp:param>
                </jsp:forward>

                <%
                
                }
                catch(Exception e)
                {
                mongo.close();
                session.setAttribute("msg", "USER ALREADY REGISTERED");
                response.sendRedirect("AuthenticationMessage.jsp");
                }
            }
            else
            {
                mongo.close();
                session.setAttribute("msg", "INVALID ACCOUNT PIN");
                response.sendRedirect("AuthenticationMessage.jsp");
            }
        }
        else
        {
            mongo.close();
            session.setAttribute("msg", "INVALID ACCOUNT NUMBER");
            response.sendRedirect("AuthenticationMessage.jsp");
        }
           
    }
    else
    {
        mongo.close();
        session.setAttribute("msg", "INVALID USER");
        response.sendRedirect("AuthenticationMessage.jsp");
    }
    }
    catch(Exception e)
    {
        mongo.close();
        out.println(e);
    }
    %>
    