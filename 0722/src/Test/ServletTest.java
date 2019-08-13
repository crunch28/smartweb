package Test;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="Myserlvet",urlPatterns= {"/hello","/test/hello"})

public class ServletTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// System.out.println("hello servlet 요청!!!");
		response.setContentType("text/html");
		response.setCharacterEncoding("EUC-KR");
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);

		PrintWriter out = response.getWriter();
		out.write("<HTML><HEAD><TITLE>servletTest</TITLE></HEAD>");
		out.write("<BODY><H1>");
		out.write("현재시간 ");
		out.write(Integer.toString(hour));
		out.write("시 ");
		out.write(Integer.toString(minute));
		out.write("분 ");
		out.write(Integer.toString(second));
		out.write("초");
		out.write("</H1></BODY></HTML>");
		out.close();
	}

}
