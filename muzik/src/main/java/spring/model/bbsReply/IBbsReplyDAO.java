package spring.model.bbsReply;

import java.util.List;
import java.util.Map;


public interface IBbsReplyDAO {
	
	public int rcount(int bbsid);
	
	public int bdelete(int bbsid);
	
	public boolean create(BbsReplyDTO dto);

	public List<BbsReplyDTO> list(Map map);

	public BbsReplyDTO read(int rbbsid);

	public boolean update(BbsReplyDTO dto);

	public boolean delete(int rbbsid);

	public int total(int bbsid);
}
