package spring.model.music;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ChartDAO implements IChartDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ChartDTO> weekList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chart.weekList",map);
	}

	@Override
	public List<ChartDTO> monthList(int week) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChartDTO> yearList(int week) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> checkedLike(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chart.checkedLike",map);
	}

	@Override
	public List<String> urlList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chart.urlList",map);
	}

	@Override
	public int addSelect(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chart.addSelect",map);
	}

	@Override
	public int latest(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chart.latest",map);
	}

	@Override
	public int mlike(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chart.mlike", map);
	}

	@Override
	public int likeUser(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chart.like_user",map);
	}

	@Override
	public int updateMlike(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("chart.updateMlike",map);
	}

	@Override
	public int updateInven(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("chart.updateInven",map);
	}

	@Override
	public int updateInvenTitle(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("chart.updateInvenTitle",map);
	}

	@Override
	public int deleteInven(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("chart.deleteInven",map);
	}

	@Override
	public String readInven(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chart.readInven",map);
	}

	@Override
	public String readInvenTitle(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chart.readInvenTitle",map);
	}

	@Override
	public ChartDTO read(String chartid) {
		// TODO Auto-generated method stub
		System.out.println("read:"+sqlSession.selectOne("chart.playSong",chartid)+"//chartid:"+chartid);
		return sqlSession.selectOne("chart.playSong",chartid);
	}

	@Override
	public ChartDTO readSong(String chartid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chart.readSong",chartid);
	}

	@Override
	public List<Integer> scroll_week(String chartType) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chart.scroll_week",chartType);
	}

	@Override
	public boolean create(ChartDTO dto) {
		// TODO Auto-generated method stub
		boolean flag=false;
		int cnt=sqlSession.insert("chart.create",dto);
		
		if(cnt>0)
			flag=true;
		return flag;
	}

	@Override
	public List<ChartDTO> invenList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chart.invenList",id);	
	}

	@Override
	public String url(String chartid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chart.url",chartid);
	}

}
