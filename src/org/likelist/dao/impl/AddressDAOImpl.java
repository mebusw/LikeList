package org.likelist.dao.impl;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.likelist.dao.IAddressDAO;
import org.likelist.dbc.HibernateSessionFactory;
import org.likelist.po.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AddressDAOImpl extends HibernateDaoSupport implements IAddressDAO {

	public static void main(String[] args) {
		IAddressDAO dao = new AddressDAOImpl();
		System.out.println(dao.fetchProvince().size());
		System.out.println(dao.fetchCity(12).size());

	}
	public List<EsjCity> fetchCity(int provinceId) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjCity where provinceId=?");
			query.setInteger(0, provinceId);
			list = query.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjCity>) list;
	}

	public List<EsjDistrict> fetchDistrict(int cityId) {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjDistrict where cityId=?");
			query.setInteger(0, cityId);
			list = query.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjDistrict>) list;
	}

	public List<EsjProvince> fetchProvince(int countryId) {
		// TODO Auto-generated method stub
		return null;
	}


	public List<EsjProvince> fetchProvince() {
		List<?> list = null;
		Query query = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			query = session.createQuery("from EsjProvince");
			list = query.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return (List<EsjProvince>) list;
	}

}
