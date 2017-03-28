package spring.model.member;

import spring.model.muzik.DAOSTDInter;

public interface IMemberDAO extends DAOSTDInter {
	public String getGrade(String id);
	
	public boolean loginCheck(String id);	
	
	public boolean general_loginCheck(String id, String password);
	
	public boolean general_create(MemberDTO dto);
	
	public String getFname(String id);
		
	public boolean updatePw(String id, String password);
	
	public boolean updateFile(String id, String fname);
	
	public boolean duplicateEmail(String email);
	
	public boolean duplicateId(String id);
	
	public String getNickname(String id);	
	
}
