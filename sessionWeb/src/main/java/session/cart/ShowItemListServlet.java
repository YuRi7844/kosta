package session.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowItemListServlet
 */
@WebServlet("/cart/showItems")
public class ShowItemListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 	상품 목록 보기
	 * 	- 상품목록보기 링크 -> ShowItemListServlet -> item_list.jsp
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//원래는 상품목록을 DB에서 조회 - 상품목록 : request scope의 Attribute로 설정 후 item_list로 이동
		
		request.getRequestDispatcher("/cart/item_list.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//원래는 상품목록을 DB에서 조회 - 상품목록 : request scope의 Attribute로 설정 후 item_list로 이동
		
		doGet(request, response);
		
	}

}
