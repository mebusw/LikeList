package org.likelist.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.*;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.likelist.type.OperationType;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopUserDAOImpl extends ShopDAOImpl implements IShopUserDAO {

	public static void main(String args[]) {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IShopUserDAO dao = (ShopUserDAOImpl) ac.getBean("shopUserDAO");

		// System.out.println(dao.searchShopCount(1, "麦当劳"));
		// System.out.println(dao.searchShopCount(1, "麦当劳", "美食", "咖啡", "杭州"));
		// System.out.println(dao.searchShopByPage(1, "麦当劳", 0, 10, 0).get(0));
		// dao.shopOperationFromFriends(1, esjShop);
		// System.out.println(dao.myLikes(1, 0, 10, 0).get(0).getShopName());
		//System.out.println(dao.visitShop(1, 1, 1));

		//System.out.println(dao.findRecentDeal(1, 0, 20));
		// System.out.println(dao.isLikedByMe(2, dao.findShop(3)));
		Logger logger = Logger.getLogger(ShopUserDAOImpl.class);
		logger.debug(" debug test ");
		logger.error(" error test");
		System.out.println(dao.likedFriendsCount(2, 1));
		

	}

	public EsjUserLikeit ILike(int uid, int shopId) {
		Transaction tran = null;
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		EsjUserLikeit esjUserLikeit = null;
		try {
			query = session
					.createQuery("select u2blikeitId from EsjUserLikeit where userId=? AND shopId=?");
			query.setInteger(0, uid);
			query.setInteger(1, shopId);
			list = query.list();
			if (list.size() <= 0) {
				tran = session.beginTransaction();
				esjUserLikeit = new EsjUserLikeit(false, uid, new Date(), "",
						shopId);
				session.save(esjUserLikeit);
				tran.commit();
			} else {
				esjUserLikeit = (EsjUserLikeit) list.get(0);
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return esjUserLikeit;

	}

	public boolean disLike(int uid, int shopId) {
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try {
			query = session
					.createQuery("DELETE  FROM EsjUserLikeit WHERE userId=? AND shopId=?");
			query.setInteger(0, uid);
			query.setInteger(1, shopId);
			tran = session.beginTransaction();

			query.executeUpdate();

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return true;

	}

	public boolean disTry(int uid, int shopId) {
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = null;

		try {
			query = session
					.createQuery("DELETE  FROM EsjUserTryit WHERE userId=? AND shopId=?");
			query.setInteger(0, uid);
			query.setInteger(1, shopId);
			tran = session.beginTransaction();

			query.executeUpdate();

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return true;
	}

	public EsjUserTryit ITry(int uid, int shopId) {
		Transaction tran = null;
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		EsjUserTryit esjUserTryit = null;
		try {
			query = session
					.createQuery("select u2btryitId from EsjUserTryit where userId=? AND shopId=?");
			query.setInteger(0, uid);
			query.setInteger(1, shopId);
			list = query.list();
			if (list.size() <= 0) {
				tran = session.beginTransaction();
				esjUserTryit = new EsjUserTryit(uid, new Date(), "", shopId);
				session.save(esjUserTryit);
				tran.commit();
			} else {
				esjUserTryit = (EsjUserTryit) list.get(0);
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return esjUserTryit;

	}

	public boolean IForward(int uid, int shopId) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			tran = session.beginTransaction();
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return true;
	}

	public boolean IGroupPurchase(int uid, int shopId) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			tran = session.beginTransaction();
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return true;
	}

	public boolean IShare(int uid, int shopId) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		EsjUserLog esjUserLog;
		try {
			tran = session.beginTransaction();
			esjUserLog = new EsjUserLog(uid, new Date(), OperationType.SHARE
					.ordinal(), shopId, 0, "");
			session.save(esjUserLog);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return true;
	}

	public EsjShopVisitor visitShop(int uid, int shopId, int visitType) {
		EsjShopVisitor esjShopVisitor = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = null;
		Query query = null;
		List<?> list = null;

		try {

			query = session.createQuery("FROM EsjShopVisitor "
					+ " WHERE shopId=? AND day=?");
			query.setInteger(0, shopId);
			query.setDate(1, new Date());

			list = query.list();
			if (list.size() > 0)
				esjShopVisitor = (EsjShopVisitor) list.get(0);
			else
				esjShopVisitor = new EsjShopVisitor(shopId, 0, 0, 0, new Date());

			switch (visitType) {
			case 0:
				esjShopVisitor
						.setBrowseTimes(esjShopVisitor.getBrowseTimes() + 1);
				break;
			case 1:
				esjShopVisitor
						.setEnterTimes(esjShopVisitor.getEnterTimes() + 1);
				break;
			case 2:
				esjShopVisitor.setUrlclickTimes(esjShopVisitor
						.getUrlclickTimes() + 1);
				break;
			}

			tran = session.beginTransaction();
			session.saveOrUpdate(esjShopVisitor);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjShopVisitor;
	}

	public long likedFriendsCount(int uid, int shopId) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		long count = 0;

		try {
			query = session
					.createQuery("SELECT count(l.u2blikeitId) FROM EsjUserLikeit l, EsjUserFriend f "
							+ " WHERE l.shopId=? AND f.userId=? AND l.userId=f.friendId ");
			query.setInteger(0, shopId);
			query.setInteger(1, uid);
			count = (Long) query.list().get(0);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

	public long triedFriendsCount(int uid, int shopId) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		long count = 0;

		try {

			query = session
					.createQuery("SELECT count(l.u2btryitId) FROM EsjUserTryit l, EsjUserFriend f "
							+ " WHERE l.shopId=? AND f.userId=? AND l.userId=f.friendId ");
			query.setInteger(0, shopId);
			query.setInteger(1, uid);
			count = (Long) query.list().get(0);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

	public boolean isLikedByMe(int uid, EsjShop esjShop) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		boolean flag = false;
		try {
			query = session
					.createQuery("from EsjUserLikeit where shopId=? AND userId=?");
			query.setInteger(0, esjShop.getShopId());
			query.setInteger(1, uid);
			if (query.list().size() > 0) {
				esjShop.setLikedByMe(true);
				flag = true;
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return flag;
	}

	public boolean isTriedByMe(int uid, EsjShop esjShop) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		boolean flag = false;

		try {
			query = session
					.createQuery("from EsjUserTryit where shopId=? AND userId=?");
			query.setInteger(0, esjShop.getShopId());
			query.setInteger(1, uid);
			if (query.list().size() > 0) {
				esjShop.setTriedByMe(true);
				flag = true;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return flag;
	}

	public List<?> myLikes(int uid, int offset, int pageSize, int sortBy) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		String sortField;
		try {
			switch (sortBy) {
			case 1:
				sortField = "s.lastUpdate";
				break;
			default:
				sortField = "s.shopLiked";
			}

			query = session
					.createQuery("select s,d,g from EsjUserLikeit l, EsjShop s, EsjShopDiscount d, EsjShopGrouprate g "
							+ " where l.userId=? AND l.shopId=s.shopId "
							+ " AND s.shopId=d.shopId AND s.shopId=g.shopId "
							+ " ORDER BY " + sortField + " DESC ");
			query.setInteger(0, uid);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjShop>) list;
	}

	public long myLikesCount(int uid) {
		Query query = null;
		long longCount = 0;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select count(*) from EsjUserLikeit l, EsjShop s "
							+ " where l.userId=? AND l.shopId=s.shopId ");
			query.setInteger(0, uid);
			longCount = (Long) query.list().get(0);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return longCount;
	}

	public long myTriesCount(int uid) {
		Query query = null;
		long longCount = 0;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select count(*) from EsjUserTryit l, EsjShop s "
							+ " where l.userId=? AND l.shopId=s.shopId ");
			query.setInteger(0, uid);
			longCount = (Long) query.list().get(0);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return longCount;
	}

	public List<?> myTries(int uid, int offset, int pageSize, int sortBy) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		String sortField;
		try {
			switch (sortBy) {
			case 1:
				sortField = "s.lastUpdate";
				break;
			default:
				sortField = "s.shopLiked";
			}

			query = session
					.createQuery("select s,d,g from EsjUserTryit l, EsjShop s, EsjShopDiscount d, EsjShopGrouprate g "
							+ " where l.userId=? AND l.shopId=s.shopId "
							+ " AND s.shopId=d.shopId AND s.shopId=g.shopId "
							+ " ORDER BY " + sortField + " DESC ");
			query.setInteger(0, uid);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjShop>) list;
	}

	public long updateLikeCount(int shopId) {
		Transaction tran = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		long longCount = 0;
		try {
			query = session
					.createQuery("select count(u2blikeitId) from EsjUserLikeit where shopId=?");
			query.setInteger(0, shopId);
			longCount = (Long) query.list().get(0);

			tran = session.beginTransaction();

			EsjShop esjShop = (EsjShop) session.load(EsjShop.class, shopId);
			esjShop.setShopLiked((int) longCount);
			session.update(esjShop);

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return longCount;

	}

	public long updateTryCount(int shopId) {
		Transaction tran = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		long longCount = 0;
		try {
			query = session
					.createQuery("select count(u2btryitId) from EsjUserTryit where shopId=?");
			query.setInteger(0, shopId);
			longCount = (Long) query.list().get(0);

			tran = session.beginTransaction();

			EsjShop esjShop = (EsjShop) session.load(EsjShop.class, shopId);
			esjShop.setShopLiked((int) longCount);
			session.update(esjShop);

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return longCount;
	}

	public EsjUserLog createUserLog(int uid, OperationType type, int shopId,
			int friendId, String destContent) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		EsjUserLog esjUserLog = null;
		try {
			tran = session.beginTransaction();
			esjUserLog = new EsjUserLog(uid, new Date(), type.ordinal(),
					shopId, friendId, destContent);
			session.save(esjUserLog);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();

		return esjUserLog;
	}

	public List<?> findRecentDeal(int uid, int offset, int pageSize) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("FROM EsjShop s, EsjShopDiscount d, EsjShopGrouprate g "
							+ " WHERE s.shopId=d.shopId AND s.shopId=g.shopId "
							+ " AND s.approved=1 AND d.approved=1"
							+ " ORDER BY d.lastUpdate DESC ");
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List<?> findRecentGr(int uid, int offset, int pageSize) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("FROM EsjShop s, EsjShopDiscount d, EsjShopGrouprate g "
							+ " WHERE s.shopId=d.shopId AND s.shopId=g.shopId "
							+ " AND s.approved=1 AND g.approved=1"
							+ " ORDER BY g.lastUpdate DESC ");
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}

}
