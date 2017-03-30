package spring.model.best;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BestDAO implements IBestDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public boolean create(Map map) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("likebest.create", map);
		if(cnt > 0) flag = true;
		return flag;
	}
	
	public boolean popcreate(Map map) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("likebest.popcreate", map);
		if(cnt > 0) flag = true;
		return flag;
	}
	
	@Override
	/**
	 * 국내차트 및 해외 차트 리스트
	 */
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("likebest.list",map);
	}
	@Override
	public List<BestDTO> klist(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("likebest.klist", map);
	}
	@Override
	/**
	 * chart->best로 저장
	 */
	public List<BestDTO> plist(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("likebest.plist",map);
	}
//	@Override
//	public List kpopList(Map map) throws Exception {
//		// TODO Auto-generated method stub
//		return mybatis.selectList("likebest.kpopList",map);
//	}
//	@Override
//	public List<BestDTO> popList(Map map) throws Exception {
//		// TODO Auto-generated method stub
//		return mybatis.selectList("likebest.popList",map);
//	}

	@Override
	public Object read(Object bestid) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("likebest.readBest", bestid);
	}
	@Override
	public BestDTO readSong(Object chartid) throws Exception {
		return mybatis.selectOne("likebest.readSong", chartid);
	}
	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int total(String chartType) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("likebest.total", chartType);
	}

	@Override
	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	


}
