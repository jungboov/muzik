package spring.model.guestbook;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestReplyDAO implements IGuestReplyDAO {

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
			int cnt = sqlSession.update("guestreply.createReply", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public boolean createReReply(Object dto) {
		boolean flag = false;
		try {
			int cnt = sqlSession.update("guestreply.createReReply", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public void upAnsnum(Map map) {
		sqlSession.update("guestreply.upAnsnum", map);
	}

	@Override
	public List list(Map map) throws Exception {
		return sqlSession.selectList("guestreply.list", map);
	}
	
	@Override
	public int rcount(Object guestid) {
		return sqlSession.selectOne("guestreply.rcount", guestid);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return sqlSession.selectOne("guestreply.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.update("guestreply.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}
	
	@Override
	public void downAnsnum(Map map) {
		sqlSession.update("guestreply.downAnsnum", map);
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.delete("guestreply.delete", pk);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public boolean checkRefno(Object no) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("guestreply.checkRefno", no);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		return sqlSession.selectOne("guestreply.total", map);
	}

}
