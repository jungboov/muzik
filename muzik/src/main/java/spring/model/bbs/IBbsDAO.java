package spring.model.bbs;

import java.util.Map;

import spring.model.muzik.DAOSTDInter;

public interface IBbsDAO extends DAOSTDInter {
		public void upViewcnt(int bbsid);
		
		public Map pageRead(int bbsid);
}
