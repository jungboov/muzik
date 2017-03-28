package spring.model.qna;

import java.util.List;
import java.util.Map;

import spring.model.muzik.DAOSTDInter;

public interface IQnaDAO extends DAOSTDInter {
	public boolean createReply(Object dto) throws Exception;

	public Object readReply(Object pk) throws Exception;

}
