package spring.model.bbsReply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.iReplyDAO;

@Repository
public class BbsReplyDAO implements IBbsReplyDAO, iReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int rcount(int bbsid) {
		return sqlSession.selectOne("bbsReply.rcount", bbsid);
	}

	@Override
	public int bdelete(int bbsid) {
		return sqlSession.delete("bbsReply.bdelete",bbsid);
	}

	@Override
	public boolean create(BbsReplyDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("bbsReply.create",dto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public List<BbsReplyDTO> list(Map map) {
		return sqlSession.selectList("bbsReply.list",map);
	}

	@Override
	public BbsReplyDTO read(int rbbsid) {
		return sqlSession.selectOne("bbsReply.read",rbbsid);
	}

	@Override
	public boolean update(BbsReplyDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.update("bbsReply.update",dto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public boolean delete(int rbbsid) {
		boolean flag = false;
		int cnt = sqlSession.delete("bbsReply.delete",rbbsid);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public int total(int bbsid) {
		return sqlSession.selectOne("bbsReply.total",bbsid);
	}

}
