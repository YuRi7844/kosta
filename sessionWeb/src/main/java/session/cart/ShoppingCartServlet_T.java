package session.cart;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/cart/addCart2")
public class ShoppingCartServlet_T extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 로그인 체크
		HttpSession session = request.getSession();
		if (session.getAttribute("loginMember") == null) {// 로그인 안한 상태면 login_form.jsp로 이동
			request.setAttribute("errorMessage", "장바구니 작업은 로그인을 먼저 해야 합니다.");
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
			return;
		}
		// 2. 장바구니에 상품 담는 작업 처리
		// 2-1. 요청파라미터 조회(담을 상품 조회)
		request.setCharacterEncoding("UTF-8");// 한글처리
		String[] items = request.getParameterValues("items");
		//사용자가 전달한 상품이 없는 경우 바로 상품목록으로 이동한다.
		if(items == null) {
			request.setAttribute("errorMessage", "상품을 선택하세요");
			request.getRequestDispatcher("/cart/showItems").forward(request, response);
			return;
		}
		// 2-2. 장바구니에 추가.
		// 장바구니 조회
		HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
		if (cart == null) {// 장바구니 처리를 처음하는 경우 Map객체를 생성해 session에 추가(binding)
			cart = new HashMap<String, Integer>();
			session.setAttribute("cart", cart);
		}
		// 상품을 장바구니에 추가 || 수량 갱신 (key: 제품명, value: 주문수량)
		for (int i = 0; i < items.length; i++) {
			if (cart.containsKey(items[i])) {// 이미 담은 상품 - 수량 갱신 (+1)
				// int newCount = cart.get(items[i])+1; cart.put(items[i], newCount);
				cart.put(items[i], cart.get(items[i]) + 1);
			} else {// 처음 담는 상품 - 추가
				cart.put(items[i], 1);
			}
		}
	
		
		// 3. 응답 - /session/cart_list.jsp
		request.getRequestDispatcher("/cart/cart_list.jsp").forward(request, response);

	}

}
