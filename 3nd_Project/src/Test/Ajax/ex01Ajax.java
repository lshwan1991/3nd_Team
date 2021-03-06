
package Test.Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONTokener;


import com.google.gson.Gson;

import DAO.storeDAO;
import DAO.storeVO;
import DAO.storescoreDAO;
import DAO.storescoreVO;
import DAO.titleDAO;
import DAO.titleVO;

@WebServlet("/ex01Ajax")
public class ex01Ajax extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("euc-kr");
		String title = request.getParameter("title");
		
		System.out.println(title);
		
		//DB에서 검색(JDBC,DAO)
		/*titleDAO dao = new titleDAO();
		titleVO vo = dao.oneselect(title);
		System.out.println(vo.getTitle());*/
		
		storescoreDAO dao = new storescoreDAO();
		storescoreVO vo = dao.oneselect(title);
		System.out.println(vo.getSTORE_NAME());
		
		//JSON
		JSONObject object = new JSONObject(vo);
		System.out.println(object);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		//out.println("DB에서 검색한 정보");
		//out.println(vo.getScore());
		//out.println(vo.getTel());
		//out.println(vo.getAddress());
		out.println(object);
		
	}

}
