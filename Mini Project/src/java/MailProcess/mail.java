/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MailProcess;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Siva
 */
public class mail extends HttpServlet {
HttpSession session1;String pg,to,subject,body,bank,acnt,amnt,to2,subject2,body2,tobank,toacnt;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int i;
        
        try (PrintWriter out = response.getWriter()) {
   
           
           try
           {
               pg= request.getParameter("page");
               
           }
           catch(Exception e)
                   {
                       out.print(e);
                   }
 if(pg.equals("Transact"))
 {
     bank=request.getParameter("from");
     acnt=request.getParameter("account");
     amnt=request.getParameter("amount");
     to=request.getParameter("to");
     
     tobank=request.getParameter("tobank");
     toacnt=request.getParameter("toaccount");
     

     
     subject="Deposit";
     body= "Account Number "+acnt+" has  Debited "+amnt+" /- From "+bank+" bank to your account";
     
     to2=request.getParameter("fromid");
     subject2="Transaction";
     body2= "You have Sucessfully Transacted "+amnt+" /- to the "+tobank+" bank account "+toacnt;
 }
 else if (pg.equals("register"))
 {
 to=request.getParameter("to");
 subject="Online Transaction Registeration";
 body="Your Account has been Sucessfully Registered to the Easy Online Banking. For further details pleasae visit our ";
 }
 
  Properties props = new Properties();
  
  props.put("mail.smtp.host", "smtp.gmail.com");
  props.put("mail.smtp.socketFactory.port", "465");
  props.put("mail.smtp.socketFactory.class",
        	"javax.net.ssl.SSLSocketFactory");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.port", "465");
 
  Session session;
            session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("Mycount.siva@gmail.com","asdf123!@");
                        }
                    });
 
  try {
   MimeMessage message1 = new MimeMessage(session);
   message1.setFrom(new InternetAddress("Mycount.siva@gmail.com"));//change accordingly
   message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
   message1.setSubject(subject);
   message1.setText(body);
   message1.setSentDate(new Date());
   
   Transport.send(message1);
   i=1;
   
   if(pg.equals("Transact"))
   {
       MimeMessage message2 = new MimeMessage(session);
   message2.setFrom(new InternetAddress("Mycount.siva@gmail.com"));//change accordingly
   message2.addRecipient(Message.RecipientType.TO,new InternetAddress(to2));
   message2.setSubject(subject2);
   message2.setText(body2);
   message2.setSentDate(new Date());
   
   Transport.send(message2);
   i=1;
   }

   

 
  } 
  catch(Exception e)
  {
      i=0;
      out.println(e);
  }
  if(i==1)
  {
      if(pg.equals("Transact"))
 {
      request.setAttribute("cnfmmsg", "Transacted Sucessfully");
      RequestDispatcher requestDispatcher=request.getRequestDispatcher("RegisterAuthentication.jsp");
      requestDispatcher.forward(request, response);
  }
      else if(pg.equals("register"))
      {
           request.setAttribute("cnfmmsg", "Registered Sucessfully");
      RequestDispatcher requestDispatcher=request.getRequestDispatcher("RegisterAuthentication.jsp");
      requestDispatcher.forward(request, response);
      }
  }
  else if(i==0)
  {
      //request.setAttribute("cnfmmsg", "Registere Failed. Try again");
      //RequestDispatcher requestDispatcher=request.getRequestDispatcher("RegisterAuthentication.jsp");
      //requestDispatcher.include(request, response);
  }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
