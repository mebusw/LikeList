package org.likelist.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.ITradeDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.EsjOrderInfo;
import org.likelist.type.OrderType;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class TradeDAOImpl extends HibernateDaoSupport implements ITradeDAO {

	public EsjOrderInfo createOrder(EsjOrderInfo order) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			tran = session.beginTransaction();
			session.save(order);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return order;
	}

	public EsjOrderInfo findOrder(int orderId) {
		EsjOrderInfo esjOrderInfo = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjOrderInfo = (EsjOrderInfo) session.load(EsjOrderInfo.class,
					orderId);
			Hibernate.initialize(esjOrderInfo);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjOrderInfo;
	}

	public boolean isOrderPaid(int orderId) {
		EsjOrderInfo esjOrderInfo = null;
		Session session = HibernateSessionFactory.getSession();
		boolean paid = false;

		try {
			esjOrderInfo = (EsjOrderInfo) session.load(EsjOrderInfo.class,
					orderId);
			paid = esjOrderInfo.getPaid();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return paid;
	}

	public EsjOrderInfo updateOrder(EsjOrderInfo order) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			session.update(order);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return order;
	}

	public long grPaidCount(int grId) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		long count = 0;
		try {
			query = session
					.createQuery("SELECT count(orderId) FROM EsjOrderInfo "
							+ " WHERE productId=? "
							+ " AND productType=? AND paid=1");
			query.setInteger(0, grId);
			query.setInteger(1, OrderType.GROUPRATE.ordinal());
			count = (Long) query.list().get(0);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

	public EsjOrderInfo findGrByCode(String code) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		EsjOrderInfo order = null;
		List<?> list;
		try {
			query = session.createQuery("FROM EsjOrderInfo " + " WHERE code=? "
					+ " AND productType=? ");
			query.setString(0, code);
			query.setInteger(1, OrderType.GROUPRATE.ordinal());

			list = query.list();
			if (list.size() > 0) {
				order = (EsjOrderInfo) list.get(0);
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return order;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		TradeDAOImpl dao = (TradeDAOImpl) ac.getBean("tradeDAO");

		// EsjOrderInfo order = new EsjOrderInfo(1, 1, 1, 1, 0.01f, new Date(),
		// false, "13800012345");
		// order = dao.createOrder(order);
		System.out.println(dao.grPaidCount(0));
		System.out.println(dao.findGrByCode("13313035345161401178879085"));
	}

}
