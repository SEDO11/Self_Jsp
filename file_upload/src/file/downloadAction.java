package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@WebServlet("/downloadAction")
public class downloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String fileName = request.getParameter("file");
		String directory = this.getServletContext().getRealPath("/upload/");
		File file = new File(directory + "/" + fileName);
		
		// 어떠한 데이터를 주고 받을 지 선택
		String mimetype = getServletContext().getMimeType(file.toString());
		if (mimetype == null) { // null 값인 경우 오류 방지, 
			response.setContentType("application/octet-stream");
		}
		
		String downloadName = null;
		if (request.getHeader("user-agent").indexOf("MSIE") == -1) { // 익스플로어가 아닌 다른 브라우저
			downloadName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		} else { // 익스플로어 브라우저
			downloadName = URLEncoder.encode(fileName,"EUC-KR").replaceAll("\\+", "%20");
		}
		
		response.setHeader("content-Disposition", "attachment;filename=\"" + downloadName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		//바이트 단위로 쪼개서 보내기 위해 1024 배열로 만듬
		byte b[] = new byte[1024];
		int data = 0;
		
		// while문을 통해서 1024B만큼씩 데이터를 보내서 사용자에게 파일을 보냄
		while((data = (fileInputStream.read(b, 0, b.length))) != -1) {
			servletOutputStream.write(b, 0, data);
		}
		
		// 데이터를 다 보내고 나서 객체 사용 중지
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
