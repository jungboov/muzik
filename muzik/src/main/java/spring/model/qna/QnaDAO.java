package spring.model.qna;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.muzik.DAOSTDInter;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
