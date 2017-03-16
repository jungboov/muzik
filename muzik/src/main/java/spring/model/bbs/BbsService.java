package spring.model.bbs;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.bbsReply.BbsReplyDAO;

 
@Service 
public class BbsService {
	
	   @Autowired
	   private BbsDAO dao;
	   
	   @Autowired
	   private BbsReplyDAO rdao;
 
      public void delete(int bbsid) throws Exception{
 
             rdao.bdelete(bbsid); //자식레코두 댓글들 삭제
             dao.delete(bbsid);	//전체레코드 댓글을 가진 부모글 삭제
      }
}