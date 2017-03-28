package spring.model.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.muzik.DAOSTDInter;

@Repository
public class FaqDAO implements DAOSTDInter {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/** junit test */
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {	
		boolean flag = false;
		int cnt = mybatis.insert("faq.create", dto);
		if(cnt > 0)
			flag = true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
			
		return mybatis.selectList("faq.list", map);
	}
	
	@Override
	public FaqDTO read(Object pk) throws Exception {
		
		return mybatis.selectOne("faq.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {	
		boolean flag = false;
		int cnt = mybatis.update("faq.update", dto);
		if(cnt > 0) 
			flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {	
		boolean flag = false;
		int cnt = mybatis.delete("faq.delete", pk);
		if(cnt > 0)
			flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		map.put("col", "");
		map.put("word", "");
		
		return mybatis.selectOne("faq.total", map);
	}

}
