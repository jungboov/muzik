package spring.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAO implements IMemberDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public String getGrade(String id){
		
		return sqlSession.selectOne("member.getGrade", id);		
	}
	@Override
	public boolean loginCheck(String id){
		boolean flag= false;
		Map map =new HashMap();
		map.put("id", id);
		
		int cnt=sqlSession.selectOne("member.loginCheck", map);
		if(cnt>0)flag=true;
		return flag;
	}
	
	@Override
	public boolean general_loginCheck(String id, String password){
		boolean flag= false;
		Map map =new HashMap();
		map.put("id", id);
		map.put("password", password);
		
		int cnt=sqlSession.selectOne("member.general_loginCheck", map);
		
		if(cnt>0)flag=true;
		
		return flag;
	}
		
/*	public boolean delete(String id){
		boolean flag=false;
		int cnt=sqlSession.delete("member.delete", id);
		if(cnt>0) flag=true;
		return flag;
	}*/
	@Override
	public String getFname(String id){	
		return sqlSession.selectOne("member.getFname", id);		
	}	
	/*public boolean update(MemberDTO dto){
		boolean flag = false;
		int cnt=sqlSession.update("member.update", dto);
		if(cnt>0) flag=true;		
		return flag;
	}*/
	@Override
	public boolean updatePw(String id, String password){
		boolean flag = false;
		Map map = new HashMap();
		map.put("id",id );
		map.put("password", password);
		
		int cnt=sqlSession.update("member.updatePw", map);
		if(cnt>0) flag=true;
		return flag;
		}
	@Override
	public boolean updateFile(String id, String fname){
		boolean flag = false;
		Map map =new HashMap();
		map.put("id",id );
		map.put("fname", fname);
		
		int cnt=sqlSession.update("member.updateFile", map);
		if(cnt>0) flag=true;
		 
		return flag;
		}
	
/*	public MemberDTO read(String id){
		
		return sqlSession.selectOne("member.read", id);
	}*/
	
	@Override
	public List<MemberDTO> list (Map map){			
		return sqlSession.selectList("member.list", map);
	}
	
    /* public int total(String col, String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		return sqlSession.selectOne("member.total", map);
		
	}*/
	
/*	public boolean create(MemberDTO dto){
		boolean flag=false;
		int cnt=sqlSession.insert("member.create", dto);
		if(cnt>0)flag=true;
		return flag;
	}*/
	@Override
	public boolean general_create(MemberDTO dto){
		boolean flag=false;
		int cnt=sqlSession.insert("member.general_create", dto);
		if(cnt>0)flag=true;
		return flag;
	}
	@Override
	public boolean duplicateEmail(String email){
		boolean flag= false;
		int cnt=sqlSession.selectOne("member.duplicateEmail", email);
		if(cnt>0) flag=true;
		return flag;
	}
	@Override
	public boolean duplicateId(String id){
		boolean flag= false;
		int cnt=sqlSession.selectOne("member.duplicateId", id);
		if(cnt>0) flag=true;
		return flag;
	}
	@Override
	public String getNickname(String id) {
		// TODO Auto-generated method stub
	 return sqlSession.selectOne("member.getNickname", id);		
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag=false;
		int cnt=sqlSession.insert("member.create", dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public Object read(Object id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.read", id);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt=sqlSession.update("member.update", dto);
		if(cnt>0) flag=true;		
		return flag;
	}

	@Override
	public boolean delete(Object id) throws Exception {
		boolean flag=false;
		int cnt=sqlSession.delete("member.delete", id);
		if(cnt>0) flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		
		map.put("col", map.get("col"));
		map.put("word", map.get("word"));
		
		return sqlSession.selectOne("member.total", map);
	}
	
}
