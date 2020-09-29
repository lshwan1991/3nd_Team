package Test.Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import DAO.storeDAO;
import DAO.storeVO;

@WebServlet("/ex02Ajax")
public class ex02Ajax extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		
		System.out.println(title);
		
		storeDAO dao2 = new storeDAO();
		storeVO vo2 = dao2.oneselect(title);
		System.out.println(vo2.getSTORE_NAME());
		
		JSONObject object2 = new JSONObject(vo2);
		System.out.println(object2);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println(object2);
		
	}

}
