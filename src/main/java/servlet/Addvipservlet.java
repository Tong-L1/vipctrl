package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;


@WebServlet("/Addvipservlet")
public class Addvipservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addvipservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type","text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String name=request.getParameter("addname");
		String sex=request.getParameter("addsex");
		String phone=request.getParameter("addphone");
		String balance=request.getParameter("addbalance");
		
		Dao dao = new Dao();
		String time = dao.getTime();
		System.out.println("添加"+name+"成功");
		PrintWriter out = response.getWriter();
		if(dao.same(phone) ) {
			 out.print("<script> alert('该手机号已经添加过');location.href='index.jsp#AddVIP';</script>");
		}
		else {
			 dao.addvip(name,sex,phone,balance,time);
			 out.print("<script> alert('会员登记成功！');location.href='index.jsp#AddVIP';</script>");
		}
		out.flush();
	    out.close();
		
		//doGet(request, response);
	}

}
