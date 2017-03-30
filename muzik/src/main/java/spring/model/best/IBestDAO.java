package spring.model.best;

import java.util.List;
import java.util.Map;

import spring.model.muzik.DAOSTDInter;

public interface IBestDAO extends DAOSTDInter {
//		boolean passCheck(Map map);
	 List<BestDTO> plist(Map map) throws Exception;
	 List<BestDTO> klist(Map map) throws Exception;
//	 List<BestDTO> kpopList(Map map) throws Exception;
//	 List<BestDTO> popList(Map map) throws Exception;
	 
	 boolean create(Map map) throws Exception;
	 boolean popcreate(Map map) throws Exception;
	 BestDTO readSong(Object pk) throws Exception;
	int total(String chartType) throws Exception;
	 
//		Object upViewcnt(Object noticeid);
		
		
}
