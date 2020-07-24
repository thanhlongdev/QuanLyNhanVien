package poly.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.Record;
import poly.entity.Staff;
import poly.repository.RecordDAO;
import poly.repository.StaffDAO;

@Controller
@RequestMapping("/admin/record/")
public class RecordController {

	@Autowired
	ServletContext application;
	
	@Autowired
	RecordDAO recordDAO;
	
	@Autowired
	StaffDAO staffDAO;

	@RequestMapping("show-record")
	public String showRecord(ModelMap modelMap, @RequestParam(value = "type") int type) {

		List<Record> list = null;
		switch (type) {
		case 1:
			list = recordDAO.getListRecord(true);
			break;

		case 2:
			list = recordDAO.getListRecord(false);
			break;
		default:
			list = recordDAO.getListRecord();
			break;
		}

		modelMap.addAttribute("listRecord", list);
		return "admin/record/show-record";
	}
	
	@RequestMapping(value = "add-record", method = RequestMethod.GET)
	public String addForm(ModelMap modelMap) {
		modelMap.addAttribute("listStaff", staffDAO.getListStaff());
		return "admin/record/add-record";
	}
	
	@RequestMapping(value = "add-record", method = RequestMethod.POST)
	public String addRecord(ModelMap modelMap,
			@RequestParam("staffId") String staffId,
			@RequestParam("type") Boolean type,
			@RequestParam("date") @DateTimeFormat(iso = ISO.DATE) Date date,
			@RequestParam("reason") String reason) {
		
		Record record = new Record();
		record.setStaff(new Staff());
		record.setType(type);
		record.setDate(date);
		record.setReason(reason);
		record.getStaff().setId(staffId);
		application.setAttribute("status", recordDAO.insertRecord(record));
		return "redirect: show-record.htm?type=0";
	}
	
	@RequestMapping("delete/{id}")
	public String deleteRecord(ModelMap modelMap,
			@PathVariable("id") int id) {
		application.setAttribute("status", recordDAO.deleteRecord(id));
		return "redirect: ../show-record.htm?type=0";
	}
	
	@RequestMapping("update/{id}")
	public String updateForm(ModelMap modelMap,
			@PathVariable("id") int id) {
		
		modelMap.addAttribute("record", recordDAO.getInfoRecord(id));
		return "admin/record/update-record";
	}
	
	@RequestMapping("update")
	public String updateRecord(ModelMap modelMap,
			@RequestParam("id") int id,
			@RequestParam("staffId") String staffId,
			@RequestParam("type") Boolean type,
			@RequestParam("date") @DateTimeFormat(iso = ISO.DATE) Date date,
			@RequestParam("reason") String reason) {
		
		Record record = new Record();
		record.setStaff(new Staff());
		record.setId(id);
		record.setType(type);
		record.setDate(date);
		record.setReason(reason);
		record.getStaff().setId(staffId);
		application.setAttribute("status", recordDAO.updateRecord(record));
		return "redirect: show-record.htm?type=0";
	}
	
}
