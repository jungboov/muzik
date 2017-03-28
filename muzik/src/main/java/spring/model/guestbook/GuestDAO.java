package spring.model.guestbook;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAO implements IGuestDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** JUnit test용 */
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean create(Object dto) {
		boolean flag = false;
		try {
			int cnt = sqlSession.update("guest.create", dto);
			if (cnt > 0)
				flag = true;
			System.out.println("GuestDAO flag : " + flag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return sqlSession.selectList("guest.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return sqlSession.selectOne("guest.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.update("guest.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.delete("guest.delete", pk);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		map.put("col", map.get("col"));
		map.put("word", map.get("word"));
		return sqlSession.selectOne("guest.total", map);
	}

	@Override
	public boolean checkRefno(Object no) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("guest.checkRefno", no);
		if (cnt > 0)
			flag = true;
		return flag;
	}

}
