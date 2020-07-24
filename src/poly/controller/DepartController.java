package poly.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.entity.Depart;
import poly.repository.DepartDAO;

@Controller
@RequestMapping("admin/depart/")
public class DepartController {

	@Autowired
	ServletContext application;

	@Autowired
	DepartDAO departDAO;

	@RequestMapping("show-depart")
	public String showDepart(ModelMap modelMap) {
		modelMap.addAttribute("departs", departDAO.getListDepart());
		return "admin/depart/show-depart";
	}

	@RequestMapping(value = "add-depart", method = RequestMethod.GET)
	public String addForm() {
		return "admin/depart/add-depart";
	}

	@RequestMapping(value = "add-depart", method = RequestMethod.POST)
	public String addDepart(ModelMap modelMap, Depart depart) {

		if (departDAO.getDepartById(depart.getId()) != null) {
			modelMap.addAttribute("message", "Valid Depart Id");
			return "admin/depart/add-depart";
		} else {
			application.setAttribute("status", departDAO.insertDepart(depart));
			return "redirect: show-depart.htm";
		}

	}
	
	@RequestMapping(value = "update-depart/{id}")
	public String showUpdate(ModelMap modelMap,
			@PathVariable("id") String id) {
		modelMap.addAttribute("depart",departDAO.getDepartById(id));
		return "admin/depart/update-depart"; 
	}
	
	@RequestMapping(value = "update-depart", method = RequestMethod.POST)
	public String updateDepart(ModelMap modelMap, Depart depart) {
		application.setAttribute("status", departDAO.updateDepart(depart));
		return "redirect: show-depart.htm";
	}
	
	@RequestMapping("delete/{id}")
	public String deleteDepart(ModelMap modelMap,
			@PathVariable("id") String id) {
		application.setAttribute("status", departDAO.deleteDepart(departDAO.getDepartById(id)));
		return "redirect: ../show-depart.htm";
	}

}
