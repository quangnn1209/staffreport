package com.seta.staffreport.common;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.seta.staffreport.hibernate.HibernateUtility;
import com.seta.staffreport.persisted.Team;

public class TeamHelper {
	public static Team getPersistantObject(Team Team) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			Team = (Team) hibernateSession.get(Team.class, Team.getTeamId());

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return Team;
	}

	public static long saveOrUpdate(Team Team) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			hibernateSession.saveOrUpdate(Team);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			System.out.println("object not saved  - " + e.getMessage());
		} finally {
			hibernateSession.close();
		}
		return Team.getTeamId();
	}

	@SuppressWarnings("unchecked")
	public static List<Team> getAllTeams() {
		Session hibernateSession = null;
		Transaction transaction = null;
		List<Team> objectList = new ArrayList<Team>();
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			objectList = hibernateSession.createCriteria(Team.class).list();
			transaction.commit();
		} catch (HibernateException he) {
			if (transaction != null)
				transaction.rollback();
			System.err.println(he.getMessage());
		}
		return objectList;
	}

	public static void delete(Team Team) {
		Session hibernateSession = null;
		Transaction transaction = null;
		try {
			hibernateSession = HibernateUtility.getSessionFactory()
					.openSession();
			transaction = hibernateSession.beginTransaction();
			Team = (Team) hibernateSession.createCriteria(Team.class)
					.add(Restrictions.eq("id", Team.getTeamId()))
					.uniqueResult();
			hibernateSession.delete(Team);
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
