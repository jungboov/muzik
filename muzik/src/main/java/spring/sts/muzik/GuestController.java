package spring.sts.muzik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.guestbook.GuestDAO;
import spring.model.guestbook.GuestDTO;
import spring.model.guestbook.GuestReplyDAO;
import spring.model.guestbook.GuestReplyDTO;
import spring.utility.muzik.Utility;

@Controller
public class GuestController {

	@Autowired
	private GuestDAO dao;

	@Autowired
	private GuestReplyDAO rdao;

	/*
	 * @RequestMapping("/guest/GuestReplyCount") public String
	 * GuestReplyCount(Model model,@RequestParam("guestid")int guestid){
	 * model.addAttribute("guestid", guestid); model.addAttribute("rdao",rdao);
	 * return "/guest/guestReplyCount"; }
	 */

	@RequestMapping("/guest/list")
	public String list(HttpServletRequest request) {
		System.out.println("guestController - list");
		// 검색관련 필요 컬럼-----------------------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지 관련---------------------------------------------
		int nowPage = 1; // 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null && !request.getParameter("nowPage").equals("")) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		System.out.println("nowPage : " + nowPage);
		int recordPerPage = 5; // 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------------------------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total;
		try {
			total = dao.total(map);
			List<GuestDTO> list = dao.list(map);
			String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
			request.setAttribute("col", col);
			request.setAttribute("word", word);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);
			request.setAttribute("dao", dao);
			// list.jsp에서 댓글 갯수 가져올 <util:rcount(num,rdao)>에서 사용할
			// rdao(GuestReplyDAO)의 값을 request 객체에 담는다.
			request.setAttribute("rdao", rdao);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/guest/list";
	}

	@RequestMapping("/guest/read")
	public String read(int guestid, Model model, int nowPage, String col, String word, HttpServletRequest request) {
		try {
			GuestDTO dto;
			dto = (GuestDTO) dao.read(guestid);
			String content = dto.getContent().replaceAll("\r\n", "<br>");
			dto.setContent(content);
			model.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String url = "read";
		int nPage = 1; // 시작 페이지 번호는 1부터
		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		return "/guest/read";
	}

	@RequestMapping(value = "/guest/create", method = RequestMethod.GET)
	public String create() {

		return "/guest/create";
	}

	@RequestMapping(value = "/guest/create", method = RequestMethod.POST)
	public String create(GuestDTO dto, HttpServletRequest request) {

		boolean flag = dao.create(dto);
		if (flag) {
			return "redirect:./list";
		} else {
			return "/error";
		}
	}

	@RequestMapping(value = "/guest/update", method = RequestMethod.POST)
	public String update(GuestDTO dto, String col, String word, String nowPage, String oldfile, Model model,
			HttpServletRequest request) {
		try {
			Map map = new HashMap();
			map.put("guestid", dto.getGuestid());
			dao.update(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("nowPage", nowPage);
		model.addAttribute("word", word);
		model.addAttribute("col", col);
		return "redirect:./list";
	}

	@RequestMapping(value = "/guest/update", method = RequestMethod.GET)
	public String update(int guestid, Model model) {
		try {
			model.addAttribute("dto", dao.read(guestid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/guest/update";
	}

	@RequestMapping(value = "/guest/delete", method = RequestMethod.POST)
	public String delete(int guestid, String col, String nowPage, String word, Model model,
			HttpServletRequest request) {
		Map map = new HashMap();
		map.put("guestid", guestid);
		String url = "/error";
		try {
			if (dao.delete(guestid)) {
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
				url = "redirect:./list";
			} else {
				url = "/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/guest/delete", method = RequestMethod.GET)
	public String delete(int guestid, Model model) {
		model.addAttribute("flag", dao.checkRefno(guestid));
		return "/guest/delete";
	}

	@RequestMapping(value = "/guest/reply", method = RequestMethod.POST)
	public String reply(GuestReplyDTO rdto, Model model, String nowPage, String col, String word,
			HttpServletRequest request) {
		Map map = new HashMap();
		map.put("guestid", rdto.getGuestid());
		map.put("ansnum", rdto.getAnsnum());
		rdao.upAnsnum(map);

		boolean flag = rdao.create(rdto);

		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			return "redirect:./list";
		} else {
			return "/error";
		}
	}

	@RequestMapping(value = "/guest/reply", method = RequestMethod.GET)
	public String reply(int guestid, Model model) {
		try {
			model.addAttribute("dto", dao.read(guestid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/guest/reply";
	}

	@RequestMapping(value = "/guest/replyRead")
	public String replyRead(int guestid, String col, String word, String nowPage, Model model) {
		Map map = new HashMap();
		map.put("guestid", guestid);
		/*
		 * map.put("sno", 1); map.put("eno", 5);
		 */
		try {
			List<GuestReplyDTO> rlist = rdao.list(map);
			model.addAttribute("rlist", rlist);
			model.addAttribute("dto", dao.read(guestid));
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("replyRead 확인");
		return "/guest/replyRead";
	}

	@RequestMapping(value = "/guest/replyAjax", method = RequestMethod.POST)
	public String replyAjax(HttpServletResponse res, String guestid, GuestReplyDTO rdto, Model model, String nowPage,
			String col, String word, HttpServletRequest request) throws IOException {
		Map map = new HashMap();
		map.put("guestid", rdto.getGuestid());
		map.put("ansnum", rdto.getAnsnum());
		rdao.upAnsnum(map);
		boolean flag = rdao.create(rdto);
		model.addAttribute("guestid", guestid);
		System.out.println("guestid : " + guestid);
		/*
		 * res.setContentType(""); PrintWriter print = res.getWriter();
		 * print.println(flag);
		 */
		return "redirect:./replyRead";
		// if (flag) {
		// model.addAttribute("nowPage", nowPage);
		// model.addAttribute("word", word);
		// model.addAttribute("col", col);
		// } else {
		// System.out.println("replyAjax controller Error");
		// }
		// System.out.println("replyajax return 직전");
		//
	}

	@RequestMapping(value = "/guest/replyCreate")
	public String replyCreate(int guestid, String col, String word, String nowPage, Model model) {
		model.addAttribute("guestid", guestid);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		System.out.println("reply 창 열림");
		return "/guest/replyCreate";
	}

	@RequestMapping("/guest/rupdate")
	public String replyUpdate(GuestReplyDTO rdto, Model model, int guestrid) {
		String url = "/error";
		try {
			if (rdao.update(rdto)) {
				model.addAttribute("rdto", rdao.read(guestrid));
				url = "/guest/replyUpdate";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/guest/replyCheckRefno", method = RequestMethod.POST)
	public String replyCheckRefno(int guestrid, Model model) {
		model.addAttribute("flag", rdao.checkRefno(guestrid));
		model.addAttribute("guestrid", guestrid);
		return "/guest/replyDelete";
	}

	@RequestMapping("/guest/replyDelete")
	public void replyDelete(int guestrid, Model model) {
		System.out.println("댓글번호" + guestrid + "-replyDelete");
		System.out.println(guestrid);
		try {
			rdao.delete(guestrid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}