package poly.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.User;
import poly.repository.UserDAO;

@Controller
@RequestMapping("/admin/user/")
public class UserController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	ServletContext application;

	@RequestMapping("show-user")
	public String showAllUser(ModelMap modelMap) {

		List<User> list = userDAO.getListUser("");
		modelMap.addAttribute("listUser", list);

		return "admin/user/show-user";
	}

	@RequestMapping(value = "find", method = RequestMethod.GET)
	public String findUser(ModelMap modelMap, @RequestParam(value = "find", required = false) String find) {
		if (find.length() != 0) {
			modelMap.addAttribute("listUser", userDAO.getListUser(find));
			return "admin/user/show-user";
		} else {
			return "redirect: show-user.htm";
		}
	}

	@RequestMapping("delete/{username}")
	public String deleteUser(ModelMap modelMap, @PathVariable("username") String username) {
		application.setAttribute("status", userDAO.deleteUser(username));
		return "redirect: ../show-user.htm";
	}

	@RequestMapping(value = "add-user", method = RequestMethod.GET)
	public String showAddForm(ModelMap modelMap) {
		return "admin/user/add-user";
	}

	@RequestMapping(value = "add-user", method = RequestMethod.POST)
	public String addUser(ModelMap modelMap, User user) {
		application.setAttribute("status", userDAO.insertUser(user));
		return "redirect: show-user.htm";
	}

	@RequestMapping(value = "update-user/{username}", method = RequestMethod.GET)
	public String showAddForm(ModelMap modelMap, @PathVariable("username") String username) {
		modelMap.addAttribute("user", userDAO.getInfoByUsername(username));
		return "admin/user/update-user";
	}

	@RequestMapping(value = "update-user", method = RequestMethod.POST)
	public String showAddForm(ModelMap modelMap, User user) {
		application.setAttribute("status", userDAO.updateUser(user));
		return "redirect: show-user.htm";
	}
}
