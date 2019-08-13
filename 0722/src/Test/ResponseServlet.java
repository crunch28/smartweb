package Test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//@WebServlet(name="Myserlvet",urlPatterns= {"/Response,/test/Response"})
@WebServlet(name="Myserlvet",urlPatterns= {"/Response"})
public class ResponseServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		out.write("<BODY><H1>");
		out.write("ResponseServlet 요청성공");
		out.write("</H1></BODY>");
		out.close();
	}

}
