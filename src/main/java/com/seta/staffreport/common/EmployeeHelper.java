package com.seta.staffreport.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.seta.staffreport.hibernate.HibernateUtility;
import com.seta.staffreport.persisted.Employees;

public class EmployeeHelper {
	public static Employees getPersistantObject(Employees Employees) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			Employees = (Employees) hibernateSession.get(Employees.class,
					Employees.getEmpId());
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return Employees;
	}

	public static long saveOrUpdate(Employees Employees) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			hibernateSession.saveOrUpdate(Employees);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return Employees.getEmpId();
	}

	@SuppressWarnings("unchecked")
	public static List<Employees> getAllEmployeess() {
		Session hibernateSession = null;
		Transaction transaction = null;
		List<Employees> objectList = new ArrayList<Employees>();
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			objectList = hibernateSession.createCriteria(Employees.class)
					.list();
			transaction.commit();
		} catch (HibernateException he) {
			if (transaction != null)
				transaction.rollback();
			System.err.println(he.getMessage());
		}
		return objectList;
	}

	public static void delete(Employees Employees) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			Employees = (Employees) hibernateSession
					.createCriteria(Employees.class)
					.add(Restrictions.eq("id", Employees.getEmpId()))
					.uniqueResult();
			hibernateSession.delete(Employees);
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
