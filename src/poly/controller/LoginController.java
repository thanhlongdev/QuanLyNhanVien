package poly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.User;
import poly.repository.UserDAO;

@Controller
@RequestMapping("/login/")
public class LoginController {

	@Autowired
	UserDAO UserDAO;

	@RequestMapping("index")
	public String index() {
		return "login/login";
	}

	@RequestMapping(value = "submit", method = RequestMethod.POST)
	public String login(ModelMap modelMap,
			HttpSession session,
			@RequestParam("username") String username,
			@RequestParam("pass") String pass) {

		User user = null;
		user = UserDAO.getInfoByUsername(username);
		if (user == null) {
			modelMap.addAttribute("message", "Không tìm thấy username");
			return "login/login";
		}
		if (!user.getPassword().equalsIgnoreCase(pass)) {
			modelMap.addAttribute("message", "Sai mật khẩu");
			return "login/login";
		}
		session.setAttribute("loginUser", user);
		return "redirect: ../admin/user/show-user.htm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect: ../home/index.htm";
	}
}
