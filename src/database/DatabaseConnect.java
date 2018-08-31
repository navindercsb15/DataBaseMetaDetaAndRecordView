package database;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;


public abstract class DatabaseConnect
   extends HttpServlet
   implements HttpJspPage
{
   protected Connection con;


   public void init(ServletConfig config, String input)
      throws ServletException
   {
      super.init(config);
      try {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+input, "root","nav15csb");
      }
      catch (Exception e) {
         throw new UnavailableException(e.getMessage());
      }

      jspInit();
   }

   public void destroy()
   {
      try {
         if (con != null) {
            con.close();
            con = null;
         }
      }
      catch (Exception ignore) {}

      jspDestroy();
      super.destroy();
   }

   public void jspInit() {}

   public void jspDestroy() {}

   public final void service(
         HttpServletRequest request,
         HttpServletResponse response)
      throws ServletException, IOException
   {
      _jspService(request, response);
   }

   public abstract void _jspService(
         HttpServletRequest request,
         HttpServletResponse response)
      throws ServletException, IOException;
}
