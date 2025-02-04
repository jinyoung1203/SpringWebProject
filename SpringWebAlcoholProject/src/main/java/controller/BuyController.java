package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BuyDAO;
import util.Buy;
import vo.FullViewVO;
import vo.OrderListVO;
import vo.UserVO;

@Controller
public class BuyController implements Buy {

	@Autowired
	ServletContext app;

	@Autowired
	BuyDAO buydao;

	@RequestMapping("/buy_product.do")
	@ResponseBody
	public int buyProduct(int idx) {
		return buydao.selectProduct(idx).getProduct_price();
	}

	@RequestMapping("/cartAdd.do")
	public void cartAdd(int idx, int amount, int price, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<OrderListVO> cart = (List<OrderListVO>) (session.getAttribute("cart"));

		if (cart == null) {
			cart = new ArrayList<OrderListVO>();
		}

		boolean isExist = false;
		for (OrderListVO item : cart) {
			if (item.getProduct_idx() == idx) {
				cart.remove(item);
				item.setProduct_amount(amount);
				cart.add(item);
				isExist = true;
				break;
			}
		}
		if (!isExist) {
			OrderListVO cart_input = new OrderListVO();
			cart_input.setProduct_idx(idx);
			cart_input.setProduct_amount(amount);
			cart.add(cart_input);
		}
		session.setAttribute("cart", cart);
		try {
			response.sendRedirect("cart.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/cart.do")
	public String Cart_In(HttpServletRequest request, Model model) {
		List<OrderListVO> cart = (List<OrderListVO>) (request.getSession().getAttribute("cart"));
		List<FullViewVO> cart_in = buydao.selectProducts(cart);
		for (FullViewVO i : cart_in) {
			for (OrderListVO j : cart) {
				if (i.getProduct_idx() == j.getProduct_idx())
					i.setProduct_amount(j.getProduct_amount());
			}
		}
		model.addAttribute("cart_in", cart_in);
		return CART_IN;
	}

	@RequestMapping("/remove_cart_in.do")
	@ResponseBody
	public void Remove_Cart_In(int idx, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<OrderListVO> cart = (List<OrderListVO>) (session.getAttribute("cart"));
		for (OrderListVO item : cart) {
			if (item.getProduct_idx() == idx) {
				cart.remove(item);
				break;
			}
		}
		session.setAttribute("cart", cart);
	}

	@RequestMapping(value = "/findProdcerName.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String[] findProdcerName(@RequestBody Map<String, Object> data) {
		List<Integer> idxs = (ArrayList<Integer>) (data.get("idxs"));
		String[] names = new String[idxs.size()];
		for (int i = 0; i < idxs.size(); i++) {
			if (idxs.get(i) != 0) {
				names[i] = buydao.selectProducer(idxs.get(i)).getProducer_name();
			}
		}
		return names;
	}

	@RequestMapping("/fixAmount.do")
	@ResponseBody
	public void fixAmount(int idx, int amount, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<OrderListVO> cart = (List<OrderListVO>) (session.getAttribute("cart"));

		for (OrderListVO item : cart) {
			if (item.getProduct_idx() == idx) {
				cart.remove(item);
				item.setProduct_amount(amount);
				cart.add(item);
				break;
			}
		}

		session.setAttribute("cart", cart);
	}

	@RequestMapping("/buy_ready1.do")
	public String Buying(int amount, int idx, int price, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		HttpSession session = request.getSession();
		try {
			UserVO user = (UserVO) session.getAttribute("user1");
			List<OrderListVO> cart = new ArrayList<OrderListVO>();
			OrderListVO item = new OrderListVO();
			item.setUser_idx(user.getUser1_idx());
			item.setOrderlist_date(buydao.Sysdate());
			item.setProduct_amount(amount);
			item.setProduct_idx(idx);
			item.setOrderlist_addr(user.getUser1_addr());
			cart.add(item);
			buydao.insertOrder(cart);

			session.removeAttribute("cart");
			model.addAttribute("cost", price);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendRedirect("login.do");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return BUY_READY;
	}

	@RequestMapping("/buy_readys.do")
	public String Buying(int cost, HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		try {
			UserVO user = (UserVO) session.getAttribute("user1");
			Date date=buydao.Sysdate();
			List<OrderListVO> cart = (List<OrderListVO>) (session.getAttribute("cart"));
			for (int i = 0; i < cart.size(); i++) {
				OrderListVO item = cart.get(i);
				item.setOrderlist_date(date);
				item.setUser_idx(user.getUser1_idx());
				item.setOrderlist_addr(user.getUser1_addr());
			}
			buydao.insertOrder(cart);
			model.addAttribute("cost", cost);

		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendRedirect("login.do");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return BUY_READY;
	}
}