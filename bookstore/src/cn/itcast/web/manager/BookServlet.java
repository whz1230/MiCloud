package cn.itcast.web.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.domain.Book;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.WebUtils;

public class BookServlet extends HttpServlet {
	private BusinessService service = new BusinessServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("forAddUI".equals(method)){
			forAddUI(request,response);
		}
		if("add".equals(method)){
			add(request,response);
		}
		if("list".equals(method)){
			list(request,response);
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list = service.getAllBook();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/manager/listbook.jsp").forward(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Book  book = WebUtils.request2Bean(request, Book.class);
		try {
			
			Book book = WebUtils.upload(request, this.getServletContext().getRealPath("/images"));
			service.addBook(book);
			request.setAttribute("message", "��ӳɹ�����");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "���ʧ�ܣ���");
		}
		request.getRequestDispatcher("/message.jsp").forward(request, response);
	}

	private void forAddUI(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		List categories = service.getAllCategory();
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("/manager/addbook.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
