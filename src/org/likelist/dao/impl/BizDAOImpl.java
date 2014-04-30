package org.likelist.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.IBizDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BizDAOImpl extends HibernateDaoSupport implements IBizDAO {

	public EsjBizInfo login(String email, String password) {
		List<?> list = null;
		Query query = null;
		EsjBizInfo esjBizInfo = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran;
		try {

			query = session
					.createQuery("from EsjBizInfo where email=? AND password=? AND approved=?");

			query.setString(0, email);
			query.setString(1, password);
			query.setBoolean(2, true);

			list = query.list();
			if (list.size() > 0) {
				esjBizInfo = (EsjBizInfo) list.get(0);
				esjBizInfo.setLastLogin(new Date());
				tran = session.beginTransaction();
				session.update(esjBizInfo);
				tran.commit();

			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjBizInfo;

	}

	public EsjBizInfo readProfile(int bizId) {
		EsjBizInfo esjBizInfo = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjBizInfo = (EsjBizInfo) session.load(EsjBizInfo.class, bizId);
			Hibernate.initialize(esjBizInfo);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjBizInfo;
	}


	public boolean updateProfile(EsjBizInfo pf) {
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

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		BizDAOImpl dao = new BizDAOImpl();
		System.out.println(dao.login("icewe@2.com",
				"202cb962ac59075b964b07152d234b70").getFullName());
		// System.out.println(dao.signup("y22@2.com", "123", "二二", "", "杨",
		// "杨二二"));

	}

	public EsjBizInfo signup(EsjBizInfo bizInfo) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			session.save(bizInfo);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return bizInfo;
	}

	public boolean emailExist(String email) {
		List<?> list = null;
		Query query = null;
		boolean exist = false;
		Session session = HibernateSessionFactory.getSession();

		try {
			query = session.createQuery("from EsjBizInfo where email=?");
			query.setString(0, email);
			list = query.list();
			if (list.size() > 0)
				exist = true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return exist;
	}

	public EsjBizInfo findUserByEmail(String email) {
		List<?> list = null;
		Query query = null;
		EsjBizInfo esjBizInfo = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			query = session.createQuery("from EsjUserInfo where email=?");
			query.setString(0, email);
			list = query.list();
			if (list.size() > 0) {
				esjBizInfo = (EsjBizInfo) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjBizInfo;
	}

}
