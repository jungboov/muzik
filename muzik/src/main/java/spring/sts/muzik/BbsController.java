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


import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.utility.muzik.Utility;

@Controller //delete 완성하기
public class BbsController {
	@Autowired
	private BbsDAO dao;
	
	@RequestMapping("/bbs/read")
	public String read(Model model, int bbsid, int nowPage, String col, String word,
			HttpServletRequest request) throws Exception{
		
		dao.upViewcnt(bbsid);
		BbsDTO dto = (BbsDTO)dao.read(bbsid);
		dto.getContent().replaceAll("\r\n", "<br>");
		
		Map pageRead = dao.pageRead(bbsid);
		BigDecimal noArr[] = {
		((BigDecimal)pageRead.get("PRE_BBSID1")),
		//((BigDecimal)pageRead.get("bbsid")),
		((BigDecimal)pageRead.get("NEX_BBSID1"))	
		};
		
		model.addAttribute("dto", dto);
		model.addAttribute("noArr", noArr);
		
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
		int recordPerPage = 5;
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
		return "/bbs/updateForm";
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.POST)
	public String update(BbsDTO dto, Model model, HttpServletRequest request,
			String col, String word, String nowPage, String oldfile){
		
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
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				model.addAttribute("nowPage",nowPage);
				url += "redirect:./list"; 
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
		String url = "";
		dao.delete(bbsid);
		/*Utility.deleteFile(upDir, oldfile);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);*/
		url = "redirect:./list";
		
		return url;
	}
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.GET)
	public String create(){
		return "/bbs/createForm";
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
