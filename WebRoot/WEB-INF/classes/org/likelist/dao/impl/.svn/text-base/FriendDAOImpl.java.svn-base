package org.likelist.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.likelist.type.*;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.*;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.*;

public class FriendDAOImpl extends HibernateDaoSupport implements IFriendDAO {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		IFriendDAO dao = new FriendDAOImpl();
		// System.out.println(dao.isFriend(1, 3));
		// System.out.println(dao.isFriend(1, 5));
		// System.out.println(dao.findFriend(1, "林"));
		System.out.println(dao.findPossibleKnownFriend(1, 0, 20).size());
		// System.out.println(dao.findFriendLog(1, 0, 20).size());
		// System.out.println(dao.findRecommendFriend(4).size());

		System.out.println(dao.findRecentLog(2, 0, 20).size());
		System.out.println(dao.findFriendLog(5, 0, 20).get(0));
	}

	public EsjUserFriend acceptInvitation(int uid, int friendId) {
		Query query = null;
		List<EsjUserFriend> list = null;

		Transaction tran = null;
		EsjUserFriend esjUserFriend = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();

			query = session.createQuery("from EsjUserFriend "
					+ " where friendId=? AND userId=? " + " AND state=? ");
			query.setInteger(0, uid);
			query.setInteger(1, friendId);
			query.setInteger(2, FriendState.INVITING.ordinal());
			list = query.list();
			if (list.size() > 0) {
				esjUserFriend = list.get(0);
				esjUserFriend.setState(FriendState.ACCEPTED.ordinal());
			}

			query = session.createQuery("from EsjUserFriend "
					+ " where userId=? AND friendId=? " + " AND state=? ");
			query.setInteger(0, uid);
			query.setInteger(1, friendId);
			query.setInteger(2, FriendState.INVITING.ordinal());
			list = query.list();
			if (list.size() > 0) {
				esjUserFriend = list.get(0);
				esjUserFriend.setState(FriendState.ACCEPTED.ordinal());
			} else {
				esjUserFriend = new EsjUserFriend(uid, friendId,
						FriendState.ACCEPTED.ordinal(), new Date(), "");
				session.save(esjUserFriend);
			}

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserFriend;
	}

	public EsjUserFriend denyInvitation(int uid, int friendId) {
		Query query = null;
		List<EsjUserFriend> list = null;

		Transaction tran = null;
		EsjUserFriend esjUserFriend = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			query = session.createQuery("from EsjUserFriend "
					+ " where friendId=? AND userId=? ");
			query.setInteger(0, uid);
			query.setInteger(1, friendId);
			list = query.list();
			if (list.size() > 0) {

				tran = session.beginTransaction();
				for (EsjUserFriend e : list) {
					session.delete(e);
					esjUserFriend = e;
				}
				tran.commit();
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserFriend;
	}

	public List<EsjUserInfo> findFriend(int uid) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select u from EsjUserInfo u, EsjUserFriend f "
							+ "where f.userId=? AND u.userId=f.friendId AND f.state=? ");
			query.setInteger(0, uid);
			query.setInteger(1, FriendState.ACCEPTED.ordinal());
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjUserInfo>) list;
	}

	public List<EsjUserInfo> findFriend(int uid, String keyword) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select u from EsjUserInfo u, EsjUserFriend f"
							+ " where f.userId=? AND u.userId=f.friendId "
							+ " AND (u.fullName like ? ) AND f.state=? ");
			String key = "%" + keyword + "%";
			query.setInteger(0, uid);
			query.setString(1, key);
			query.setInteger(2, FriendState.ACCEPTED.ordinal());
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjUserInfo>) list;
	}

	public List<EsjUserInfo> findNearbyFriend(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<EsjUserInfo> findRecommendFriend(int uid) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		List<EsjUserInfo> recommands = new ArrayList<EsjUserInfo>();
		try {

			/**
			 * HQL only supports subqueries in the WHERE clause, but not FROM
			 * clause!
			 */
			query = session
					.createQuery(" FROM EsjUserInfo u1"
							+ " WHERE u1.userId IN "
							+ " (SELECT u.userId FROM EsjUserLog l, EsjUserInfo u "
							+ " WHERE u.userId=l.userId AND u.userId<>? "
							+ " GROUP BY l.userId ORDER BY count(l.logId) DESC) "
							+ " AND (SELECT count(f.friendshipId) FROM EsjUserFriend f WHERE f.userId=? AND f.friendId=u1.userId)=0 ");
			query.setInteger(0, uid);
			query.setInteger(1, uid);

			list = query.list();

			Random rnd = new Random();
			for (int i = 0; i < 3; i++) {
				if (list.size() > 0) {
					int r = rnd.nextInt(list.size());
					recommands.add((EsjUserInfo) list.get(r));
					list.remove(r);
				}
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjUserInfo>) recommands;
	}

	public EsjUserFriend inviteFriend(int uid, int friendId) {
		Query query = null;
		Transaction tran = null;
		EsjUserFriend esjUserFriend1 = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("from EsjUserFriend "
							+ " where userId=? AND friendId=? AND state<>? AND state<>?) ");
			query.setInteger(0, uid);
			query.setInteger(1, friendId);
			query.setInteger(2, FriendState.ACCEPTED.ordinal());
			query.setInteger(3, FriendState.INVITING.ordinal());
			if (0 == query.list().size()) {

				tran = session.beginTransaction();
				esjUserFriend1 = new EsjUserFriend(uid, friendId,
						FriendState.INVITING.ordinal(), new Date(), "");
				session.save(esjUserFriend1);
				tran.commit();
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjUserFriend1;
	}

	public boolean isFriend(int uid, int friendId) {
		boolean found = false;
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		try {
			query = session
					.createQuery("select count(friendshipId) from EsjUserFriend "
							+ " where userId=? AND friendId=? AND state=? ");
			query.setInteger(0, uid);
			query.setInteger(1, friendId);
			query.setInteger(2, FriendState.ACCEPTED.ordinal());
			found = ((Long) (query.list().get(0)) > 0 && uid != friendId);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return found;
	}

	public List<EsjUserInfo> findUnhandledInvites(int uid) {
		List<?> list = null;
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		try {
			query = session
					.createQuery("select u from EsjUserFriend f, EsjUserInfo u "
							+ " where u.userId=f.userId AND f.friendId=? AND f.state=? ");
			query.setInteger(0, uid);
			query.setInteger(1, FriendState.INVITING.ordinal());
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjUserInfo>) list;
	}

	public long findUnhandledInviteCount(int uid) {
		Session session = HibernateSessionFactory.getSession();
		Query query = null;
		long count = 0;
		try {
			query = session
					.createQuery("select count(friendshipId) from EsjUserFriend "
							+ " where friendId=? AND state=? ");
			query.setInteger(0, uid);
			query.setInteger(1, FriendState.INVITING.ordinal());
			count = (Long) query.list().get(0);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

	public List<?> findRecentLog(int uid, int offset, int pageSize) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("SELECT s,d,g,l,u FROM "
					+ " EsjUserLog l, EsjUserInfo u,  "
					+ " EsjShop s, EsjShopDiscount d, EsjShopGrouprate g "
					+ " WHERE u.userId=l.userId "
					+ " AND s.shopId=l.shopId  "
					+ " AND d.shopId=s.shopId AND g.shopId=s.shopId "
					+ " ORDER BY l.createTime DESC");
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List<?> findFriendLog(int uid, int offset, int pageSize) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("SELECT s,d,g,l,u FROM "
							+ " EsjUserLog l, EsjUserFriend f, EsjUserInfo u, "
							+ " EsjShop s, EsjShopDiscount d, EsjShopGrouprate g "
							+ " WHERE f.userId=? AND l.userId=f.friendId AND u.userId=f.friendId "
							+ " AND s.shopId=l.shopId "
							+ " AND d.shopId=s.shopId AND g.shopId = s.shopId "
							+ " ORDER BY l.createTime DESC");
			query.setInteger(0, uid);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List<EsjUserInfo> findRecommendFriend(int uid, int offset,
			int pageSize) {
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		List<EsjUserInfo> recommands = null;
		try {

			/**
			 * HQL only supports subqueries in the WHERE clause, but not FROM
			 * clause!
			 */
			query = session
					.createQuery(" FROM EsjUserInfo u1"
							+ " WHERE u1.userId IN "
							+ " (SELECT u.userId FROM EsjUserLog l, EsjUserInfo u "
							+ " WHERE u.userId=l.userId AND u.userId<>? "
							+ " GROUP BY l.userId ORDER BY count(l.logId) DESC) "
							+ " AND (SELECT count(f.friendshipId) FROM EsjUserFriend f WHERE f.userId=? AND f.friendId=u1.userId)=0 ");
			query.setInteger(0, uid);
			query.setInteger(1, uid);

			recommands = query.setFirstResult(offset).setMaxResults(pageSize)
					.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return recommands;
	}

	public List<EsjUserInfo> findPossibleKnownFriend(int uid, int offset,
			int pageSize) {
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		List<EsjUserInfo> recommands = null;
		try {

			query = session
			.createQuery(" FROM EsjUserInfo u"
					+ " WHERE u.userId=? ");
			query.setInteger(0, uid);
			EsjUserInfo user = (EsjUserInfo) query.list().get(0);
	
			query = session
					.createQuery(" FROM EsjUserInfo u "
							+ " WHERE (u.city=? OR u.university=? OR u.companyName=?) AND u.userId<>? "
							+ " AND (SELECT count(f.friendshipId) FROM EsjUserFriend f WHERE f.userId=? AND f.friendId=u.userId)=0 ");
			query.setString(0, user.getCity());
			query.setString(1, user.getUniversity());
			query.setString(2, user.getCompanyName());
			query.setInteger(3, uid);
			query.setInteger(4, uid);

			recommands = query.setFirstResult(offset).setMaxResults(pageSize)
					.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return recommands;
	}

}
