package spring.sts.muzik;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.iReplyDAO;
import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.model.bbs.BbsService;
import spring.model.bbsReply.BbsReplyDAO;
import spring.model.bbsReply.BbsReplyDTO;
import spring.utility.muzik.Utility;

@Controller
public class BbsController {
	@Autowired
	private BbsDAO dao;
	
	@Autowired
	private BbsReplyDAO rdao;
	
	@Autowired
	private BbsService service;
	
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int rbbsid, int bbsid, int nowPage, int nPage, String col, String word, Model model){
		
		int total = rdao.total(bbsid);
		int totalPage = (int)(Math.ceil((double) total/10));
		if(rdao.delete(rbbsid)){
			if(nPage != 1 && nPage == totalPage && total % 10 == 1);{
				nPage = nPage ;
			}
			model.addAttribute("bbsid", bbsid);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		}
		
		return "redirect:./read";
	}
	
	
	@RequestMapping("/bbs/rupdate")
	public String rupdate(BbsReplyDTO dto, Model model){
//		public String rupdate(BbsReplyDTO dto, Model model, String col, String word, int nowPage, int nPage){
		rdao.update(dto);
		
		model.addAttribute("readReply", rdao.read(dto.getRbbsid()).getContent());
		return "/bbs/replyUpdate";
	}
	
	@RequestMapping("/bbs/rcreate")
	public String rcreate(BbsReplyDTO dto, String col, String word, int nowPage, Model model){
		
		rdao.create(dto);
		model.addAttribute("bbsid", dto.getBbsid());
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		
		return "redirect:./read";
	}
	
	
	@RequestMapping("/bbs/read")
	public String read(Model model, int bbsid, int nowPage, String col, String word, HttpServletRequest request) throws Exception{
		
		dao.upViewcnt(bbsid);
		BbsDTO dto = (BbsDTO)dao.read(bbsid);
		dto.getContent().replaceAll("\r\n", "<br>");
		
		Map pageRead = dao.pageRead(bbsid);
		BigDecimal noArr[] = {
		((BigDecimal)pageRead.get("PRE_BBSID1")),
		//((BigDecimal)pageRead.get("bbsid")),
		((BigDecimal)pageRead.get("NEX_BBSID1"))	
		};
		
		//댓글
		String url = "read";
		String no = "bbsid";
		int nPage = 1;
		
		if(request.getParameter("nPage") != null){
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 10;
		int sno = ((nPage-1) * recordPerPage) + 1; 
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsid", bbsid);

		List<BbsReplyDTO> list = rdao.list(map);
	
		int total = rdao.total(bbsid);
		
		String paging = Utility.paging(total, nPage, recordPerPage, url, no, bbsid, nowPage, col, word);
		
		model.addAttribute("dto", dto);
		model.addAttribute("paging", paging);
		model.addAttribute("noArr", noArr);
		model.addAttribute("rlist", list);
		model.addAttribute("nPage", nPage);
		
		return "/bbs/read";
	}
	
	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request) throws Exception{
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("tot")){
			word = "";
		}
		
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;
		int sno = ((nowPage - 1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		List<BbsDTO> list = dao.list(map);
		int total = dao.total(map);
		
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		
		iReplyDAO irdao = rdao;
		request.setAttribute("irdao", irdao);
		
		return "/bbs/list";
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.GET)
	public String update(int bbsid, Model model){
		try {
			model.addAttribute("dto", dao.read(bbsid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/bbs/update";
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.POST)
	public String update(BbsDTO dto, Model model, HttpServletRequest request,
			String col, String word, String nowPage, String oldfile, int bbsid){
		
		String basePath = request.getRealPath("/bbs/storage");
		int filesize = (int)dto.getFileMF().getSize();
		
		String filename = "";
		if(filesize>0){
			filename = Utility.saveFile(dto.getFileMF(),basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		String url = "";
		boolean flag;
		try {
			flag = dao.update(dto);
			if(flag){
				Utility.deleteFile(basePath, oldfile);
				model.addAttribute("bbsid", bbsid);
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				model.addAttribute("nowPage",nowPage);
				url += "redirect:./read"; 
			}else{
				url += "error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/bbs/delete")
	public String delete(int bbsid, Model model, String col, String word, 
			String nowPage, String oldfile, HttpServletRequest request) throws Exception{
		
		String upDir = request.getRealPath("/bbs/storage");

		//dao.delete(bbsid);
		service.delete(bbsid);
		Utility.deleteFile(upDir, oldfile);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		
		return "redirect:./list";
	}
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.GET)
	public String create(){
		return "/bbs/create";
	}
	
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.POST)
	public String create (BbsDTO dto, HttpServletRequest request) throws Exception{
		String basePath = request.getRealPath("/bbs/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "";
		if(filesize>0){
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		boolean flag = dao.create(dto);
		
		if(flag){
			return "redirect:./list";
		}else{
			return "error";
		}
	}
}
