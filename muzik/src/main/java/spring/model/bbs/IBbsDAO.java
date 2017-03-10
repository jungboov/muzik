package spring.model.bbs;

import spring.model.muzik.DAOSTDInter;

public interface IBbsDAO extends DAOSTDInter {
		public void upViewcnt(int bbsid);
		
		public int pageRead(int bbsid);
}
