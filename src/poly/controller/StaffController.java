package poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.Depart;
import poly.entity.Staff;
import poly.repository.DepartDAO;
import poly.repository.RecordDAO;
import poly.repository.StaffDAO;

@Controller
@RequestMapping("/admin/staff/")
public class StaffController {

	@Autowired
	ServletContext application;

	@Autowired
	StaffDAO staffDAO;

	@Autowired
	DepartDAO departDAO;

	@Autowired
	RecordDAO recordDAO;

	@RequestMapping("show-staff")
	public String showStaff(ModelMap modelMap) {
		modelMap.addAttribute("listStaff", staffDAO.getListStaff());
		return "admin/staff/show-staff";
	}

	@RequestMapping(value = "add-staff", method = RequestMethod.GET)
	public String showAddForm(ModelMap modelMap) {
		modelMap.addAttribute("listDepart", departDAO.getListDepart());
		return "admin/staff/add-staff";
	}

	@RequestMapping(value = "add-staff", method = RequestMethod.POST)
	public String insertStaff(ModelMap modelMap, HttpServletRequest request,
			@RequestParam("birthday") @DateTimeFormat(iso = ISO.DATE) Date birthday,
			@RequestParam("fileUpload") MultipartFile image) {
		Staff staff = getStaff(request, birthday);
		if (!image.isEmpty()) {
			try {
				String nameFile = staff.getId() + "."
						+ image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".") + 1);
				String path = application.getRealPath("/resource/avatar/" + nameFile);
				System.out.println(path);
				image.transferTo(new File(path));
				staff.setPhoto(nameFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		application.setAttribute("status", staffDAO.insertStaff(staff));
		return "redirect: show-staff.htm";
	}

	@RequestMapping(value = "update-staff/{id}", method = RequestMethod.GET)
	public String updateForm(ModelMap modelMap, @PathVariable("id") String id) {
		modelMap.addAttribute("listDepart", departDAO.getListDepart());
		modelMap.addAttribute("staff", staffDAO.getInfoStaff(id));
		return "admin/staff/update-staff";
	}

	@RequestMapping(value = "update-staff", method = RequestMethod.POST)
	public String updateStaff(ModelMap modelMap, HttpServletRequest request,
			@RequestParam("birthday") @DateTimeFormat(iso = ISO.DATE) Date birthday,
			@RequestParam("fileUpload") MultipartFile image) {
		Staff staff = getStaff(request, birthday);
		if (!image.isEmpty()) {
			try {
				if (!staff.getPhoto().equals("unknown-avatar.jpg")) {
					new File(application.getRealPath("/resource/avatar/" + staff.getPhoto())).delete();
				}
				String nameFile = staff.getId() + "."
						+ image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".") + 1);
				String path = application.getRealPath("/resource/avatar/" + nameFile);
				System.out.println(path);
				image.transferTo(new File(path));
				staff.setPhoto(nameFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		application.setAttribute("status", staffDAO.updateStaff((staff)));
		return "redirect: show-staff.htm";
	}

	@RequestMapping("delete/{id}")
	public String deleteStaff(ModelMap modelMap, @PathVariable("id") String id) {
		Staff staff = staffDAO.getInfoStaff(id);
		try {
			if (!staff.getPhoto().equals("unknown-avatar.jpg")) {
				new File(application.getRealPath("/resource/avatar/" + staff.getPhoto())).delete();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		if (recordDAO.deleteByStaffId(id)) {
			application.setAttribute("status", staffDAO.deleteStaff(id));
		} else {
			application.setAttribute("status", false);
		}
		return "redirect: ../show-staff.htm";
	}

	public Staff getStaff(HttpServletRequest request, Date birthday) {
		Staff staff = new Staff();
		staff.setDepart(new Depart());
		staff.setId(request.getParameter("id").toString().trim());
		staff.setName(request.getParameter("name").toString().trim());
		staff.setGender(Boolean.valueOf(request.getParameter("gender").toString()));
		staff.setEmail(request.getParameter("email").toString());
		staff.setPhone(request.getParameter("phone").toString());
		staff.setSlary(Float.parseFloat(request.getParameter("salary").toString()));
		staff.setBirthday(birthday);
		staff.getDepart().setId(request.getParameter("departId").toString());
		staff.setPhoto(request.getParameter("photo").toString());
		return staff;
	}
}
