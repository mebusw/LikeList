package org.likelist.dao.impl;

import java.util.*;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.IAdminDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AdminDAOImpl extends HibernateDaoSupport implements IAdminDAO {
	public static void main(String[] args) {
		IAdminDAO dao = new AdminDAOImpl();
		System.out.println(dao.approveDeal(1));

	}

	public void adjustWeights(Map<String, Integer> weights) {
		// TODO Auto-generated method stub

	}

	public EsjShopDiscount approveDeal(int dealId) {
		Transaction tran = null;
		EsjShopDiscount esjShopDiscount = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjShopDiscount = (EsjShopDiscount) session.load(
					EsjShopDiscount.class, dealId);
			tran = session.beginTransaction();
			esjShopDiscount.setApproved(true);
			session.save(esjShopDiscount);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjShopDiscount;

	}

	public EsjShop approveShop(int shopId) {
		Transaction tran = null;
		EsjShop esjShop = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjShop = (EsjShop) session.load(EsjShop.class, shopId);
			tran = session.beginTransaction();
			esjShop.setApproved(true);
			session.save(esjShop);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjShop;
	}

//	public void createAd(Advertisement ad) {
//		// TODO Auto-generated method stub
//
//	}

	public EsjShop createShop(EsjShop shop) {
		// TODO Auto-generated method stub
		return null;
	}

	public void delAd(int adId) {
		// TODO Auto-generated method stub

	}

	public int findAllOnlineUser() {
		// TODO Auto-generated method stub
		return 0;
	}

	public void findFeedback() {
		// TODO Auto-generated method stub

	}

	public void findOnlindTreads() {
		// TODO Auto-generated method stub

	}

	public EsjAdminInfo login(String email, String password) {
		List<?> list = null;
		Query query = null;
		EsjAdminInfo esjAdminInfo = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran;
		try {
			query = session
					.createQuery("from EsjAdminInfo where email=? AND password=?");
			// TODO use java to encrypt the password, not sql functions
			query.setString(0, email);
			query.setString(1, password);

			list = query.list();
			if (list.size() > 0) {
				esjAdminInfo = (EsjAdminInfo) list.get(0);
				esjAdminInfo.setLastLogin(new Date());
				tran = session.beginTransaction();
				session.update(esjAdminInfo);
				tran.commit();

			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjAdminInfo;

	}

	public void promoteDeal(int dealId, int bonusScore) {
		// TODO Auto-generated method stub

	}

	public EsjShop promoteShop(int shopId, int bonusScore) {
		// TODO Auto-generated method stub
		return null;
	}

	public void signup(String email, String password) {
		// TODO Auto-generated method stub

	}

	public void transferShopOwner(int shopId, int bizId) {
		// TODO Auto-generated method stub

	}

	public EsjShop updateShop(int shopId, EsjShop shop) {
		// TODO Auto-generated method stub
		return null;
	}

}
