package spring.model.guestbook;

import java.util.Map;

import spring.model.muzik.DAOSTDInter;

public interface IGuestReplyDAO extends DAOSTDInter {
	
	/*공동 인터페이스에 없지만, guestreply에서 필요로 하는 것들 추가하는곳*/
	public boolean checkRefno(Object no);
	
	public boolean createReReply(Object dto);
	
	public void upAnsnum(Map map);

	public void downAnsnum(Map map);
	
	public int rcount(Object guestid);
}
