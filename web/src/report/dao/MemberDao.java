package report.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDao {
	private static SqlSessionFactory sessionFactory;

	static {
		sessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}

	public static boolean searchId(String id) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			String idMember = session.selectOne("searchId", id);
			if (idMember != null) {
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return false;
	}

	public static boolean pwCheck(String id, String pw) {
		SqlSession session = null;
		try {
			session = sessionFactory.openSession();
			String pwMember = session.selectOne("pwCheck", id);
			if (pw.equals(pwMember)) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return false;
	}
}
