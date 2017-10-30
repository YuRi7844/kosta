package session.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/cart/addCart")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 기본흐름
	 * 1. 로그인 체크
	 * 2. 요청파라미터 조회 - items
	 * 3. Session에 장바구니에 담을(사용자가 선택한) item추가
	 * 4. 응답 - cart_list.jsp 
	 */
	/*기본흐름
	 * 1. 로그인 체크
	 * 
	 * 2. 장바구니에 상품 담기
	 * 	2-1 요청파라미터 조회
	 * 	2-2 장바구니에 상품 추가
	 * 3. 응답 - cart_list.jsp 로 이동
	 * 
	 * 오류 흐름
	 * 1-a 로그인이 안된 상태 -> login_form.jsp로 이동
	 * 2-a-1 사용자가 장바구니에 담도록 요청한 상품이 없는 경우
	 * 		-> 상품목록(/cart/showItems)으로 이동.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		//1. HttpSession을 조회
		HttpSession session = request.getSession();
		//2. 로그인 여부 체크 - x : login_form.jsp로 이동
		if(session.getAttribute("loginMember") == null) {
			request.setAttribute("errorMessage", "장바구니 이용은 로그인을 해야 가능합니다.");
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
			return;
		}
		
		//요청파라미터 조회
		String [] items = request.getParameterValues("items");
		if(items == null) {
			request.setAttribute("errorMessage", "선택된 상품이 없습니다.");
			request.getRequestDispatcher("/cart/showItems").forward(request, response);
			return;
		}
		
		//장바구니에 담기
		//Map이니까 for문을 이용하되 이미 cart에 등록된 상품인지 아닌지 체크하여 상품 수량을 표시 할 것.
		HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
		if(cart == null) {//session에 Attribute가 존재하지 않는것
			cart = new HashMap<String, Integer>();
			session.setAttribute("cart", cart);
		}
		for(int i = 0; i < items.length; i++) {
			if(cart.containsKey(items[i])) {
				cart.put(items[i], cart.get(items[i])+1);
			}else {
				cart.put(items[i], 1);
			}
		}
			
		
		//응답
//		request.getRequestDispatcher("/cart/cart_list.jsp").forward(request, response);
		response.sendRedirect("/sessionWeb/cart/cart_list.jsp");
		//새로고침해도 장바구니 목록에 담은 갯수가 늘지 않는다.
	}

}
