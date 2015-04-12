package com.seta.staffreport.common;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.seta.staffreport.hibernate.HibernateUtility;
import com.seta.staffreport.persisted.Image;

public class ImageHelper {
	public static Image getPersistantObject(Image img) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory().openSession();
			transaction = hibernateSession.beginTransaction();
			img = (Image) hibernateSession.get(Image.class, img.getId());
			// img.setFile((File)
			// hibernateSession.createCriteria(File.class).add(Restrictions.eq("id",
			// img.getFile().getId())).uniqueResult());
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return img;
	}

	public static long saveOrUpdate(Image img) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory().openSession();
			transaction = hibernateSession.beginTransaction();
			hibernateSession.save(img.getFile());
			hibernateSession.saveOrUpdate(img);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return img.getId();
	}

	@SuppressWarnings("unchecked")
	public static List<Image> getAllImages() {
		Session hibernateSession = null;
		Transaction transaction = null;
		List<Image> objectList = new ArrayList<Image>();
		try {
			hibernateSession = HibernateUtility.getSessionFactory().openSession();
			transaction = hibernateSession.beginTransaction();
			objectList = hibernateSession.createCriteria(Image.class).list();
			transaction.commit();
		} catch (HibernateException he) {
			if (transaction != null)
				transaction.rollback();
			System.err.println(he.getMessage());
		}
		return objectList;
	}

	public static void delete(Image Image) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory().openSession();
			transaction = hibernateSession.beginTransaction();
			Image = (Image) hibernateSession.createCriteria(Image.class).add(Restrictions.eq("id", Image.getId())).uniqueResult();
			hibernateSession.delete(Image);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("Could not delete node - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
	}
}
