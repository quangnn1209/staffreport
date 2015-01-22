package com.seta.staffreport.common;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.seta.staffreport.hibernate.HibernateUtility;
import com.seta.staffreport.persisted.Class;

public class ClassHelper {

	public static long saveOrUpdate(com.seta.staffreport.persisted.Class clazz) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory().openSession();
			transaction = hibernateSession.beginTransaction();
			hibernateSession.saveOrUpdate(clazz);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return clazz.getId();
	}

	public static void delete(com.seta.staffreport.persisted.Class clazz) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory().openSession();
			transaction = hibernateSession.beginTransaction();
			clazz = (Class) hibernateSession.createCriteria(Class.class).add(Restrictions.eq("id", clazz.getId())).uniqueResult();
			hibernateSession.delete(clazz);
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
