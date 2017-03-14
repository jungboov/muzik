package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO implements IBbsDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//Test하기 위해서 set만 설정해준다.(생성자를 통해서 하기 때문에)
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.insert("bbs.create",dto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return sqlSession.selectList("bbs.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return sqlSession.selectOne("bbs.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.update("bbs.update",dto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = sqlSession.delete("bbs.delete",pk);
		if(cnt>0) flag = true;
		return flag;
	}
	
	@Override
	public int total(Map map) throws Exception {
		map.put("col", map.get("col"));
		map.put("word", map.get("word"));
		return sqlSession.selectOne("bbs.total",map);
	}

	@Override
	public void upViewcnt(int bbsid) {
		sqlSession.update("bbs.upViewcnt",bbsid);

	}

	@Override
	public Map pageRead(int bbsid) {
		return sqlSession.selectOne("bbs.pageRead", bbsid);
	}

}
