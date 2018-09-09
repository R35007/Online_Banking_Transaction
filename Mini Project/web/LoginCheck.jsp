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
<%@page import="java.io.*" %>

<%! String bank;
    String accno;
    String pswd;
    String uname;
    
    String daccno;
    String dpswd;
    
    int i=0;
%>
<%! DB db;  DBCollection coll; MongoClient mongo; BasicDBObject document;%>
<% 
    session=request.getSession();
    try
    {
            bank=request.getParameter("Bname");
            accno=request.getParameter("ACCNONUMBER");
            pswd=request.getParameter("PASSWORD");
            
            mongo = new MongoClient("localhost", 27017);
            db = mongo.getDB("EOB");
            coll = db.getCollection(bank);
            
            BasicDBObject search = new BasicDBObject();
            search.put("Account Number",accno);
            
            DBCursor cursor = coll.find(search);
            
            if(cursor!=null)
            {
            while (cursor.hasNext()) 
            {   
                DBObject cur = cursor.next();
                uname=cur.get("Name").toString(); 
                daccno=cur.get("Account Number").toString();
                dpswd=cur.get("Password").toString();
                mongo.close();
            }
            }
            else  
            {
                mongo.close();
                session.setAttribute("msg", "INVALID ACCOUNT");
                response.sendRedirect("AuthenticationMessage.jsp");
            }
            if(accno.equals(daccno))
                {
                    if(pswd.equals(dpswd))
                    {
                    mongo.close();
                    session.setAttribute("accno", accno);
                    session.setAttribute("user", uname);
                    session.setAttribute("bank", bank);
                    response.sendRedirect("DETAILS.jsp");
                    }
                    else
                    {
                        mongo.close();
                        session.setAttribute("msg", "INVALID PASSWORD");
                        response.sendRedirect("AuthenticationMessage.jsp");
                    }
                }
            else if("Admin".equals(accno) && "Siva".equals(pswd))
                {
                    mongo.close();
                    session.setAttribute("page", "Admin");
                    response.sendRedirect("ACCOUNT DETAILS.jsp");
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
    