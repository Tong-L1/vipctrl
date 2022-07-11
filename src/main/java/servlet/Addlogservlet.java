package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;


@WebServlet("/Addlogservlet")
public class Addlogservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addlogservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type","text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		Dao dao = new Dao();
		PrintWriter out = response.getWriter();	

		String time = dao.getTime();
		String name=(String)request.getParameter("name");
		String phone=(String)request.getParameter("phone");
		String event=(String)request.getParameter("event");
		String amount=(String)request.getParameter("amount");
		
		dao.addlog(time, name, event, amount, phone);
		dao.updateBalance(phone, amount);
		out.print("<script> alert('成功！');location.href='index.jsp#Logs';</script>");
		out.flush();
	    out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
