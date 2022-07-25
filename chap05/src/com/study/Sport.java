package com.study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sport
 */
@WebServlet("/Sport")
public class Sport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); // 한글 깨짐 방지
		
		String[] usel = request.getParameterValues("sport");
		String res = "<html>";
		try {
			for(int i=0; i<usel.length; i++) {
				res += "<h3>Selected sport: " + usel[i] + "</h3>";
			}
		} catch(NullPointerException e) {
			res += "<h3>잘못 된 입력값 입니다.</h3>";
		} finally {
			res += "</html>";
		}
		res += "</html>";
		PrintWriter writer = response.getWriter();
		writer.print(res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
