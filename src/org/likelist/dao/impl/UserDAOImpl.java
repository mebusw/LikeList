package org.likelist.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.IUserDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

//import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserDAOImpl extends HibernateDaoSupport implements IUserDAO {

	public static void main(String args[]) {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UserDAOImpl dao = (UserDAOImpl) ac.getBean("userDAO");

		// System.out.println(dao.signup("mebusw@6.com", "123", "wy", "", "林",
		// "林大大"));
//		System.out.println(dao.login111("mebusw@4.com",
//				"202cb962ac59075b964b07152d234b70").getLoginTimes());
//		System.out.println(dao.findMyFriendsLog(1));
//		System.out.println(dao.readProfile(3));
		System.out.println(dao.findUserByEmail("mebusw@163.com"));
	}

	public EsjUserInfo login(String email, String password) {
		EsjUserInfo esjUserInfo = null;

		List<?> list = getHibernateTemplate().find(
				"from EsjUserInfo where email=? AND password=?",
				new Object[] { email, password });

		if (list.size() > 0) {
			esjUserInfo = (EsjUserInfo) list.get(0);
			esjUserInfo.setLoginTimes(esjUserInfo.getLoginTimes() + 1);
			esjUserInfo.setLastLogin(new Date());
			getHibernateTemplate().update(esjUserInfo);
			
		}
		return esjUserInfo;
	}

	public EsjUserInfo login111(final String email, final String password) {
		EsjUserInfo esjUserInfo = null;

		List<?> list = getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session s)
							throws HibernateException, SQLException {
						Query query = s.createQuery("from EsjUserInfo where email=? AND password=?");
						query.setString(0, email);
						query.setString(1, password);
						
						query.setFirstResult(0);
						query.setMaxResults(5);
						List list = query.list();
						return list;
					}
				});
		if (list.size() > 0) {
			esjUserInfo = (EsjUserInfo) list.get(0);
			esjUserInfo.setLoginTimes(esjUserInfo.getLoginTimes() + 1);
			esjUserInfo.setLastLogin(new Date());
			getHibernateTemplate().update(esjUserInfo);
		}
		return esjUserInfo;

	}

	public EsjUserInfo readProfile(int uid) {
		EsjUserInfo esjUserInfo = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjUserInfo = (EsjUserInfo) session.load(EsjUserInfo.class, uid);
			Hibernate.initialize(esjUserInfo);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserInfo;

	}

	public EsjUserInfo validEmail(int userId, int validCode) {
		Transaction tran = null;
		EsjUserInfo esjUserInfo = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjUserInfo = (EsjUserInfo) session.load(EsjUserInfo.class, userId);
			if (esjUserInfo.getEmailCheckCode() == validCode) {
				tran = session.beginTransaction();
				esjUserInfo.setEmailChecked(true);
				session.update(esjUserInfo);
				tran.commit();
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserInfo;
	}

	public boolean updateProfile(EsjUserInfo pf) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			pf.setLastUpdate(new Date());
			session.update(pf);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	public List<EsjUserLog> findFriendLog(int friendId) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjUserLog where userid=?");
			query.setInteger(0, friendId);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjUserLog>) list;
	}

	public EsjUserInfo findUser(int userId) {
		EsjUserInfo esjUserInfo = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjUserInfo where userid=?");
			query.setInteger(0, userId);
			esjUserInfo = (EsjUserInfo)query.list().get(0);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserInfo;
	}

	public List<EsjUserLog> findMyFriendsLog(int uid) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select l from EsjUserLog l, EsjUserFriend f where f.userId=? AND f.friendId=l.userId");
			query.setInteger(0, uid);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjUserLog>) list;
	}

	private int generateCode() {
		return (int) new Date().getTime();
	}

	public EsjUserInfo updateAvatar(int uid, String avatarPath) {
		EsjUserInfo esjUserInfo = null;
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjUserInfo = (EsjUserInfo) session.load(EsjUserInfo.class, uid);
			esjUserInfo.setAvatarDir(avatarPath);

			tran = session.beginTransaction();
			session.update(esjUserInfo);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserInfo;
	}

	public EsjUserInfo signup(EsjUserInfo userInfo) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			int emailCheckCode = generateCode();
			userInfo.setEmailCheckCode(emailCheckCode);
			userInfo.setLoginTimes(0);
			session.save(userInfo);

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return userInfo;
	}

	public boolean emailExist(String email) {
		List<?> list = null;
		Query query = null;
		boolean exist = false;
		Session session = HibernateSessionFactory.getSession();

		try {
			query = session.createQuery("from EsjUserInfo where email=?");
			query.setString(0, email);
			list = query.list();
			if (list.size() > 0) {
				exist = true;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return exist;
	}

	public EsjUserInfo findUserByEmail(String email) {
		List<?> list = null;
		Query query = null;
		EsjUserInfo esjUserInfo = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			query = session.createQuery("from EsjUserInfo where email=?");
			query.setString(0, email);
			list = query.list();
			if (list.size() > 0) {
				esjUserInfo = (EsjUserInfo) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserInfo;
	}

}
