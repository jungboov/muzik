package spring.model.best;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BestDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<BestDTO> llist(){
		
		return sqlSession.selectList("likebest.llist",6);
		
	}
	
	public boolean create(Map  map){
		boolean flag = false;
		int cnt = sqlSession.insert("likebest.create", map);
		if(cnt > 0) flag = true;
		return flag;
	}
}
