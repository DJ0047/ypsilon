package report.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import report.model.Play;

public class PlayDao {
	private static SqlSessionFactory sessionFactory;

	static {
		sessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}

	public static void insertReview(Play play) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			session.insert("insertReview", play);
			session.commit();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static List<Play> searchDateAll() {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			return session.selectList("searchDateAll");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return null;
	}

	public static List<Play> searchDate(String yyyymm) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			return session.selectList("searchDate", yyyymm);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return null;
	}

	public static Play searchPlay(String getDate) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			Play play = session.selectOne("searchPlay", getDate);
			return play;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return null;
	}

	public static void deletePlay(String getDate) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			session.delete("deletePlay", getDate);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void updatePlay(Play play) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			session.update("updatePlay", play);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		} finally {
			if (session != null)
				session.close();
		}
	}

}
