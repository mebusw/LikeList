package org.likelist.dao.impl;

import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.ISmsDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class SmsDAOImpl extends HibernateDaoSupport implements ISmsDAO {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ISmsDAO dao = new SmsDAOImpl();
		//System.out.println(dao.sendSms(1, 2, "hello", "dear"));
		//System.out.println(dao.replySms(2, 1, "honey"));
		//System.out.println(dao.sendSms(3, 1, "hi", "dear"));
		System.out.println(dao.findUnreadSmsCount(1));
		System.out.println(dao.findSmsInboxCount(1));

	}

	public List<EsjU2uSms> findSmsOutbox(int uid) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjU2uSms where userid=?");
			query.setInteger(0, uid);
			list = query.list();
			// TODO sort the sms and replies by smsId
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjU2uSms>) list;
	}

	public long findUnreadSmsCount(int uid) {
		Query query = null;
		long count = 0;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select count(u2uCommentId) from EsjU2uSms where friendId=? AND unread=1");
			query.setInteger(0, uid);
			count = (Long) query.list().get(0);
			// TODO sort the sms and replies by smsId
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

	public EsjU2uSms readSms(int uid, int smsId) {
		Transaction tran = null;
		EsjU2uSms esjU2uSms = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjU2uSms = (EsjU2uSms) session.load(EsjU2uSms.class, smsId);
			tran = session.beginTransaction();
			esjU2uSms.setUnread(false);
			session.update(esjU2uSms);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjU2uSms;
	}

	public EsjU2uSms replySms(int uid, int smsId, String content) {
		Transaction tran = null;
		EsjU2uSms esjU2uSms = null;
		EsjU2uSms reply = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			esjU2uSms = (EsjU2uSms) session.load(EsjU2uSms.class, smsId);
			tran = session.beginTransaction();
			reply = new EsjU2uSms(uid, smsId, new Date(), esjU2uSms
					.getSubject(), content, true, esjU2uSms.getUserId());

			session.save(reply);

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjU2uSms;
	}

	public EsjU2uSms sendSms(int uid, int friendId, String subject, String content) {
		Transaction tran = null;
		EsjU2uSms esjU2uSms = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			esjU2uSms = new EsjU2uSms(uid, 0, new Date(), subject, content, true,
					friendId);
			session.save(esjU2uSms);

			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjU2uSms;
	}

	public long findSmsInboxCount(int uid) {
		long count = 0;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("select count(u2uCommentId) from EsjU2uSms where friendId=?");
			query.setInteger(0, uid);
			count = (Long)query.list().get(0);
			
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

	public List<?> findSmsInboxByPage(int uid, int offset,
			int pageSize) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select c,u from EsjU2uSms c, EsjUserInfo u"
							+ " where c.friendId=? AND c.userId=u.userId ORDER BY c.createTime DESC ");
			query.setInteger(0, uid);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<?>) list;

	}
	
}
