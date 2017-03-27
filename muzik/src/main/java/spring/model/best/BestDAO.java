package spring.model.best;

import java.util.HashMap;
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

	public List<BestDTO> kpopList(Map map) {

		return sqlSession.selectList("likebest.kpopList",map);
	}
	public List<BestDTO> popList(Map map) {
		
		return sqlSession.selectList("likebest.kpopList",map);
	}
	public String read(int bestid){
		
		return sqlSession.selectOne("likebest.readBest", bestid);
	}
	public BestDTO readSong(String chartid){
		return sqlSession.selectOne("likebest.readSong",chartid);
	}
	public BestDTO readPopSong(String popchartid){
		return sqlSession.selectOne("likebest.readPopSong", popchartid);
	}
}
