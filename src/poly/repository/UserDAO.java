package poly.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import poly.entity.User;

@Repository
@Transactional
public class UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<User> getListUser(String username) {
		List<User> list = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(User.class);
			if (!username.equals("")) {
				criteria.add(Restrictions.like("username", username + "%"));
			}
			list = (List<User>) criteria.list();
		} catch (HibernateException e) {
			System.out.println("Get List User ex: " + e.toString());
		}
		return list;
	}

	public User getInfoByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		User user = null;
		try {
			user = (User) session.get(User.class, username);
		} catch (HibernateException e) {
			System.out.println("Get User by username ex: " + e.toString());
		}
		return user;
	}

	public boolean insertUser(User user) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.save(user);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Add User Exception: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean updateUser(User user) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Add User Exception: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean deleteUser(String username) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.delete(getInfoByUsername(username));
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Delete User Exception: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

}
