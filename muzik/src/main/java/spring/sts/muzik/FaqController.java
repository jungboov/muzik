package spring.sts.muzik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.istack.internal.logging.Logger;


import spring.model.faq.FaqDAO;
import spring.model.faq.FaqDTO;
import spring.utility.muzik.Utility;

@Controller
public class FaqController {
	@Autowired
	private FaqDAO dao;

	@RequestMapping(value = "/faq/create", method = RequestMethod.GET)
	public String create() {

		return "/faq/create";
	}

	@RequestMapping(value = "/faq/create", method = RequestMethod.POST)
	public String create(FaqDTO dto) throws Exception {
		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping("/faq/list")
	public String list(HttpServletRequest request) throws Exception {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		/** 페이지 관련 */
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 8;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<FaqDTO> list = dao.list(map);
		int total = dao.total(map);
		
		/*FaqDTO dto = new FaqDTO();
		String content = dto.getContent().replaceAll("\r\n", "<br>");
		dto.setContent(content);*/

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		/*request.setAttribute("content", content);*/

		return "/faq/list";
	}

/*	@RequestMapping("/faq/read")
	public String read(int faqid, Model model, HttpServletRequest request, int nowPage, String col, String word)
			throws Exception {
		FaqDTO dto = dao.read(faqid);
		String content = dto.getContent().replaceAll("\r\n", "<br>");
		dto.setContent(content);
		model.addAttribute("dto", dto);

		return "/faq/read";
	}*/

	@RequestMapping(value = "/faq/update", method = RequestMethod.GET)
	public String update(int faqid, Model model) throws Exception {
		model.addAttribute("dto", dao.read(faqid));
		return "/faq/update";
	}

	@RequestMapping(value = "/faq/update", method = RequestMethod.POST)
	public String update(FaqDTO dto, String word, String col, String nowPage, Model model) throws Exception {

		boolean flag = dao.update(dto);
		if (flag) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);

			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping("/faq/delete")
	public String delete(int faqid, String col, String word, String nowPage, Model model) {
		String viewPage = "";

		try {
			dao.delete(faqid);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);

			viewPage = "redirect:./list";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			viewPage = "error";
		}

		return viewPage;
	}
}
