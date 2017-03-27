package spring.model.qna;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO implements IQnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("qna.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public List list(Map map) throws Exception {

		return mybatis.selectList("qna.list", map);
	}

	@Override
	public QnaDTO read(Object pk) throws Exception {

		return mybatis.selectOne("qna.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.update("qna.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("qna.delete", pk);
		if (cnt > 0)
			flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		map.put("col", "");
		map.put("word", "");

		return mybatis.selectOne("qna.total", map);
	}

	@Override
	public boolean createReply(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("qna.createReply", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public Object readReply(Object pk) throws Exception {
		
		return mybatis.selectOne("qna.readReply", pk);
	}

	public void upAnsnum(Map map) {

		mybatis.update("qna.upAnsnum", map);
	}
	
	public void upViewcnt(int qnaid){
		
		mybatis.update("qna.upViewcnt", qnaid);
	}

}
