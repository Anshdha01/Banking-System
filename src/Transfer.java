

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Transfer
 */
@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		String sender=(String) session.getAttribute("name");
		String balance = (String) session.getAttribute("balance");
		String dt=request.getParameter("date");
		/*SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = (Date) sdf.parse(dt); */
		String amount=request.getParameter("amount"); 
		String receiver=request.getParameter("recepient");
		int bal=Integer.parseInt(balance);
		int amt=Integer.parseInt(amount);
		if(amt > bal){
			
			out.println("<script>window.alert('Insufficient Balance');</script>");
		}
		else{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","12345");
				String qr="insert into transfers values(?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(qr);
				ps.setString(1, dt);
				ps.setString(2, sender);
				ps.setString(3, receiver);
				ps.setString(4, amount);
				int i=ps.executeUpdate();
				if(i>0)
				{
					RequestDispatcher rd=request.getRequestDispatcher("index.html");
					rd.include(request, response);
					out.println("<script>window.alert('Transaction Successfull');</script>");
					int newbal=bal-amt;
					String qr1="update customers set balance=? where name=?";
					PreparedStatement ps1=con.prepareStatement(qr1);
					ps1.setInt(1, newbal);
					ps1.setString(2, sender);
					ps1.addBatch();
					ps1.executeBatch();
					String qr2="update customers set balance=balance+? where name=?";
					PreparedStatement ps2=con.prepareStatement(qr2);
					ps2.setInt(1, amt);
					ps2.setString(2, receiver);
					ps2.executeUpdate();
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
					rd.include(request, response);
					out.println("cannot process the request");	
				}
				con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
		}
	}

}
