package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Fruit
 */
@WebServlet("/Fruit")
public class FruitRadio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FruitRadio() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); // 한글 깨짐 방지

		String fruit = request.getParameter("fruit");
		String res = "<html>";
		res += "<h3>User comment: " + fruit + "</h3>";

		HttpSession session = request.getSession(false);

		if (session == null) {
			res += "<p>1 번째 방문 입니다.</p>";

			// session을 받아온다.
			session = request.getSession(true);

			// session object 생성
			session.setAttribute("visited", "1");
		} else {
			String visitedStr = session.getAttribute("visited").toString();
			int visited = Integer.parseInt(visitedStr);
			visited++;

			res += "<p>";
			res += visited;
			res += "번째 방문입니다.";
			res += "</p>";
			session = request.getSession(true); // session을 받아온다.

			// session object 생성
			session.setAttribute("visited", (visited) + "");
		}
		res += "</html>";

		PrintWriter writer = response.getWriter();
		writer.print(res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
