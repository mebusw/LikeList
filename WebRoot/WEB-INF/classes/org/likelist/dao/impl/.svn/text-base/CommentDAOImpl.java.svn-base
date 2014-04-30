package org.likelist.dao.impl;

import java.util.*;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.ICommentDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CommentDAOImpl extends HibernateDaoSupport implements ICommentDAO {
	public EsjU2sComment addComment(int shopId, String text, int uid) {
		Transaction tran = null;
		EsjU2sComment esjU2sComment = null;
		Session session = HibernateSessionFactory.getSession();

		try {
			tran = session.beginTransaction();
			esjU2sComment = new EsjU2sComment(uid, 0, 0, new Date(), text,
					shopId);
			session.save(esjU2sComment);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjU2sComment;

	}

	public List<EsjU2sComment> findCommentsByPage(int shopId, int offset,
			int pageSize) {
		List<?> list = null;
		List<EsjU2sComment> sList = null;
		Query query = null;
		EsjU2sComment esjU2sComment;
		EsjUserInfo esjUserInfo;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select c,u from EsjU2sComment c, EsjUserInfo u"
							+ " where c.shopId=? AND c.userId=u.userId ORDER BY c.createTime DESC ");
			query.setInteger(0, shopId);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();

			sList = new ArrayList();
			Iterator iterator1 = list.iterator();
			while (iterator1.hasNext()) {
				Object[] o = (Object[]) iterator1.next();
				esjU2sComment = (EsjU2sComment) o[0];
				esjUserInfo = (EsjUserInfo) o[1];
				esjU2sComment.setUserPhotoPath(esjUserInfo.getAvatarDir());
				esjU2sComment.setUserFullName(esjUserInfo.getFullName());

				sList.add(esjU2sComment);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return sList;

	}


	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ICommentDAO dao = new CommentDAOImpl();
		// System.out.println(dao.addComment(100, "good!", 1, "MC"));
		System.out.println(dao.findCommentsByPage(1, 0, 65535).size());
		System.out.println(dao.findCommentsCount(1));
		// System.out.println(dao.replyComment(11, "bad!", 1));

	}

	public long findCommentsCount(int shopId) {
		Query query = null;
		long count = 0;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session
					.createQuery("select count(u2sCommentId) from EsjU2sComment "
							+ " where shopId=? ");
			query.setInteger(0, shopId);
			count = (Long) query.list().get(0);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
	}

}
