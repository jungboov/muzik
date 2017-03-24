package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements INoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// junit test
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("notice.create", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("notice.list", map);
	}

	@Override
	public Object read(Object noticeid) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("notice.read", noticeid);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.update("notice.update", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public boolean delete(Object noticeid) throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.delete("notice.delete", noticeid);
		if(cnt>0)flag=true;
		
		return flag;
	}
//	@Override
//	public Object upViewcnt(Object noticeid){
//		return mybatis.update("notice.upViewcnt", noticeid);
//	}
	

	@Override
	public int total(Map map) throws Exception {
		
		return 0;
	}

	@Override
	public boolean passCheck(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

}
