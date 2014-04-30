package org.likelist.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.likelist.dao.IAlbumDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.EsjAlbum;
import org.likelist.po.EsjPhoto;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AlbumDAOImpl extends HibernateDaoSupport implements IAlbumDAO {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		IAlbumDAO dao = new AlbumDAOImpl();
		System.out.println(dao.addPhoto(2, "/attached/girl.png", 1));
		// System.out.println(dao.addPhoto("/attached/kid.png", 1));
		System.out.println(dao.findAllPhotos(1));
		// System.out.println(dao.removePhoto(2));
		// System.out.println(dao.findPhoto(1));
		System.out.println(dao.findAlbum(1));

	}

	public EsjPhoto addPhoto(int ownerId, String photoPath, int albumId) {
		EsjPhoto esjPhoto = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjPhoto = new EsjPhoto(photoPath, albumId, new Date());
			Transaction tran = session.beginTransaction();
			session.save(esjPhoto);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjPhoto;
	}

	public EsjAlbum findAlbum(int albumId) {
		EsjAlbum esjAlbum = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjAlbum = (EsjAlbum) session.load(EsjAlbum.class, albumId);
			Hibernate.initialize(esjAlbum);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjAlbum;
	}

	public List<EsjPhoto> findAllPhotos(int albumId) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjPhoto where albumId=?");
			query.setInteger(0, albumId);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjPhoto>) list;
	}

	public EsjPhoto findPhoto(int photoId) {
		EsjPhoto esjPhoto = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjPhoto = (EsjPhoto) session.load(EsjPhoto.class, photoId);
			Hibernate.initialize(esjPhoto);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjPhoto;
	}

	public EsjPhoto modifyPhotoDesc(int ownerId, int photoId, String newDesc) {
		EsjPhoto esjPhoto = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjPhoto = (EsjPhoto) session.load(EsjPhoto.class, photoId);
			Transaction tran = session.beginTransaction();
			esjPhoto.setDescription(newDesc);
			session.update(esjPhoto);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjPhoto;
	}

	public boolean removePhoto(int ownerId, int photoId) {
		EsjPhoto esjPhoto;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjPhoto = (EsjPhoto) session.load(EsjPhoto.class, photoId);
			Transaction tran = session.beginTransaction();
			session.delete(esjPhoto);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return true;
	}

	public EsjAlbum switchCoverPhoto(int ownerId, int albumId, int photoId) {
		EsjAlbum esjAlbum = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjAlbum = (EsjAlbum) session.load(EsjAlbum.class, albumId);
			Transaction tran = session.beginTransaction();
			esjAlbum.setCoverPhotoId(photoId);
			session.update(esjAlbum);
			tran.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjAlbum;
	}

	public EsjPhoto findCoverPhoto(int albumId) {
		EsjPhoto esjPhoto = null;
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("select p from EsjPhoto p, EsjAlbum a "
					+ " where a.albumId=? AND p.photoId=a.coverPhotoId");
			query.setInteger(0, albumId);
			list = query.list();
			if (list.size() > 0)
				esjPhoto = (EsjPhoto) list.get(0);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjPhoto;
	}

	public EsjAlbum createAlbum(int ownerId) {
		EsjAlbum esjAlbum = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			esjAlbum = new EsjAlbum(new Date(), 0, ownerId);
			Transaction tran = session.beginTransaction();
			session.save(esjAlbum);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return esjAlbum;
	}

}
