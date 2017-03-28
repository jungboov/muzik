package spring.model.guestbook;

import spring.model.muzik.DAOSTDInter;

public interface IGuestDAO extends DAOSTDInter {

	/* 공동 인터페이스에 없지만, guest에서 필요로 하는 것들 추가하는곳 */
	public boolean checkRefno(Object no);

}
