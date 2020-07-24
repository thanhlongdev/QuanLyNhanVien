package poly.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.hibernate.dialect.SQLServerDialect;

import poly.entity.Staff;
import poly.repository.StaffDAO;
import poly.repository.UserDAO;

@Controller
@Transactional
@RequestMapping("/home/")
public class HomeController {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	StaffDAO staffDAO;
	@Autowired
	UserDAO userDAO;

	@SuppressWarnings("unchecked")
	@RequestMapping("index")
	public String index(ModelMap modelMap) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT r.staff.id, SUM(case when r.type=1 then 1 else 0 end)-SUM(case when r.type=0 then 1 else 0 end) as m FROM Record r where r.type = 1 GROUP BY r.staff.id order by m desc";
		Query query = session.createQuery(hql);
		List<Staff> listStaff = new ArrayList<Staff>();
		try {
			List<Object[]> list = query.list();
			for (Object[] object : list) {
				Staff staff = staffDAO.getInfoStaff(object[0].toString());
				listStaff.add(staff);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			session.close();
		}

		modelMap.addAttribute("topStaff",listStaff);
		
		return "home/index";
	}

}
