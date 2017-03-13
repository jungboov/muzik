package spring.model.notice;

import java.util.Map;

import spring.model.muzik.DAOSTDInter;

public interface INoticeDAO extends DAOSTDInter {
		boolean passCheck(Map map);
		
		
//		Object upViewcnt(Object noticeid);
		
		
}
