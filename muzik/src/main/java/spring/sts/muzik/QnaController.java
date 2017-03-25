package spring.sts.muzik;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.qna.QnaDAO;
import spring.model.qna.QnaDTO;
import spring.utility.muzik.Utility;

@Controller
public class QnaController {
	@Autowired
	private QnaDAO dao;

	@RequestMapping(value = "/qna/create", method = RequestMethod.GET)
	public String create() {

		return "/qna/create";
	}

	@RequestMapping(value = "/qna/create", method = RequestMethod.POST)
	public String create(QnaDTO dto, HttpServletRequest request) throws Exception {
		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping("/qna/list")
	public String list(HttpServletRequest request) throws Exception {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<QnaDTO> list = dao.list(map);
		int total = dao.total(map);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/qna/list";
	}

	@RequestMapping("/qna/read")
	public String read(int qnaid, Model model, HttpServletRequest request, int nowPage, String col, String word)
			throws Exception {
		dao.upViewcnt(qnaid);
		QnaDTO dto = dao.read(qnaid);
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));

		model.addAttribute("dto", dto);

		return "/qna/read";
	}

	@RequestMapping(value = "/qna/update", method = RequestMethod.GET)
	public String update(int qnaid, Model model) throws Exception {
		model.addAttribute("dto", dao.read(qnaid));

		return "/qna/update";
	}

	@RequestMapping(value="/qna/update", method=RequestMethod.POST)
	public String update(QnaDTO dto, Model model, String col, String word, String nowPage) {
		
		String url = "";
		boolean flag;
		try {
			flag = dao.update(dto);
			if(flag){
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
				
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
		

	@RequestMapping("/qna/delete")
	public String delete(int qnaid, String col, String word, String nowPage, Model model) {

		try {
			boolean flag = dao.delete(qnaid);
			if (flag) {
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);

				return "redirect:./list";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "error";

	}

	@RequestMapping(value = "/qna/reply", method = RequestMethod.GET)
	public String reply(int qnaid, Model model) throws Exception {

		model.addAttribute("dto", dao.readReply(qnaid));

		return "/qna/reply";
	}

	@RequestMapping(value = "/qna/reply", method = RequestMethod.POST)
	public String reply(QnaDTO dto, Model model, String col, String word, String nowPage) {

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());

		dao.upAnsnum(map);
		boolean flag;
		try {
			flag = dao.createReply(dto);

			if (flag) {
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);

				return "redirect:./list";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";

	}

}
