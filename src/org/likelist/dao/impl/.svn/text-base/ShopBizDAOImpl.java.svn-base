package org.likelist.dao.impl;

import java.text.SimpleDateFormat;
import java.util.*;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.IShopBizDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;

public class ShopBizDAOImpl extends ShopDAOImpl implements IShopBizDAO {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		IShopBizDAO dao = new ShopBizDAOImpl();
		// System.out.println(dao.createShop(new EsjShop("HYATT", "123", "abc",
		// 1,
		// false)));
		//
		// System.out.println(dao.findShop(1));
		// EsjShopDiscount d = new EsjShopDiscount();
		// d.setDiscountContent("mac");
		// d.setTimeFrom(new Date());
		// d.setTimeTo(new Date());
		// d.setDiscountPercent(8.5f);
		// d.setShopName("MC");
		// d.setSubject("xmas");
		//
		// System.out.println(dao.addDeal(1, d));
		System.out.println(dao.findCategory(0));
		System.out.println(dao.shopReputation(1, 2).size());
		System.out.println(dao.findDeals(1).get(0));
	}

	public EsjShopDiscount createDeal(EsjShopDiscount deal) {
		Transaction tran = null;
		EsjShopDiscount esjShopDiscount = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			deal.setCreateTime(new Date());
			session.save(deal);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjShopDiscount;
	}

	public boolean removeDeal(int dealId) {
		EsjShopDiscount esjShopDiscount;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjShopDiscount = (EsjShopDiscount) session.load(
					EsjShopDiscount.class, dealId);
			Transaction tran = session.beginTransaction();
			session.delete(esjShopDiscount);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	public void findTrends(int shopId, Date beginTime, Date endTime) {
		// TODO Auto-generated method stub

	}

	public EsjShop createShop(EsjShop shop) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			session.save(shop);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return shop;
	}

	public boolean updateShop(EsjShop shop) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			shop.setLastUpdate(new Date());
			session.update(shop);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return true;
	}



	public boolean removeShop(int shopId) {
		EsjShop esjShop;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjShop = (EsjShop) session.load(EsjShop.class, shopId);
			Transaction tran = session.beginTransaction();
			session.delete(esjShop);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	public List<Long> shopReputation(int bid, int shopId) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		long longCount;
		List<?> list;
		List<Long> reputations = new ArrayList<Long>();

		try {
			query = session
					.createQuery("SELECT count(u2blikeitId) FROM EsjUserLikeit WHERE shopId=?");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT count(u2btryitId) FROM EsjUserTryit WHERE shopId=?");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = list.size() > 0 ? (Long) list.get(0) : 0;
			reputations.add(longCount);

			query = session
					.createQuery("SELECT count(DISTINCT f.friendId) FROM EsjUserFriend f "
							+ " WHERE f.userId IN (SELECT userId FROM EsjUserLikeit WHERE shopId=?) "
							+ " AND f.friendId NOT IN (SELECT userId FROM EsjUserLikeit WHERE shopId=?) "
							+ " ");
			query.setInteger(0, shopId);
			query.setInteger(1, shopId);
			list = query.list();
			longCount = list.size() > 0 ? (Long) list.get(0) : 0;
			reputations.add(longCount);

			// TODO
			reputations.add(0L);

			// ////////////daily begin///////////////
			query = session
					.createQuery("SELECT sum(browseTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND to_days(day)=to_days(now())");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(browseTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m%d'), DATE_FORMAT(day, '%Y%m%d'))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(enterTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND to_days(day)=to_days(now())");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(enterTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m%d'), DATE_FORMAT(day, '%Y%m%d'))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(urlclickTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND to_days(day)=to_days(now())");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(urlclickTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m%d'), DATE_FORMAT(day, '%Y%m%d'))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			// ////////////daily over///////////////

			// ////////////weekly begin///////////////
			query = session
					.createQuery("SELECT sum(browseTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " WEEK(NOW())=WEEK(day) ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(browseTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(WEEK(NOW()), WEEK(day))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(enterTimes)FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " WEEK(NOW())=WEEK(day) ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(enterTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(WEEK(NOW()), WEEK(day))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(urlclickTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " WEEK(NOW())=WEEK(day) ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(urlclickTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(WEEK(NOW()), WEEK(day))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			// ////////////weekly over///////////////

			// ////////////monthly begin///////////////
			query = session
					.createQuery("SELECT sum(browseTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " DATE_FORMAT(day, '%Y%m')=DATE_FORMAT(NOW(), '%Y%m') ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(browseTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m'), DATE_FORMAT(day, '%Y%m'))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(enterTimes)FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " DATE_FORMAT(day, '%Y%m')=DATE_FORMAT(NOW(), '%Y%m') ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(enterTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m'), DATE_FORMAT(day, '%Y%m'))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(urlclickTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " DATE_FORMAT(day, '%Y%m')=DATE_FORMAT(NOW(), '%Y%m') ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			query = session
					.createQuery("SELECT sum(urlclickTimes) FROM EsjShopVisitor "
							+ " WHERE shopId=? AND "
							+ " PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m'), DATE_FORMAT(day, '%Y%m'))=1 ");
			query.setInteger(0, shopId);
			list = query.list();
			longCount = (0 == list.size() || null == list.get(0)) ? 0
					: (Long) list.get(0);
			reputations.add(longCount);

			// ////////////monthly over///////////////

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return reputations;
	}


	public List<EsjShop> findMyShops(int bid) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		List<EsjShop> shops = null;

		try {
			query = session.createQuery("FROM EsjShop WHERE bizId=?");
			query.setInteger(0, bid);
			shops = query.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return shops;
	}


	public boolean isDealPublishExpired(int shopId) {
		EsjShop esjShop = null;
		Session session = HibernateSessionFactory.getSession();
		boolean expired = true;
		try {
			esjShop = (EsjShop) session.load(EsjShop.class, shopId);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy ");
			String expireDate = sdf.format(esjShop.getDealPublishExpire());
			String nowDate = sdf.format(new Date());
			expired = (nowDate.compareTo(expireDate) >= 0);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return expired;
	}

	public EsjShop renewDealPublishExpire(int shopId, Date newExpire) {
		EsjShop esjShop = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjShop = (EsjShop) session.load(EsjShop.class, shopId);
			esjShop.setDealPublishExpire(newExpire);
			Transaction tran = session.beginTransaction();
			session.update(esjShop);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjShop;
	}

	public boolean isShopExist(String keyword) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		boolean exist = false;

		try {
			query = session
					.createQuery("FROM EsjShop WHERE shopName=? ");
			query.setString(0, keyword);
			if (query.list().size() > 0) {
				exist = true;
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return exist;
	}

	public EsjShopGrouprate createGrouprate(EsjShopGrouprate gr){
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			gr.setCreateTime(new Date());
			session.save(gr);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return gr;
	
	}

	public EsjShopDiscount updateDeal(EsjShopDiscount deal) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			deal.setLastUpdate(new Date());
			session.update(deal);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return deal;
	}
	public EsjShopGrouprate updateGrouprate(EsjShopGrouprate gr) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			gr.setLastUpdate(new Date());
			session.update(gr);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return gr;
	}
}
