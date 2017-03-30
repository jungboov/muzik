package spring.sts.muzik;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.best.BestDAO;
import spring.model.best.BestDTO;
import spring.model.notice.NoticeDTO;
import spring.utility.muzik.Utility;
@Controller
public class LikebestController {

	
	
	@Autowired
	private BestDAO bdao;
	
	
	@RequestMapping("/best/list")
	public String klist(Model model, HttpServletRequest request, String chartType){
		System.out.println("/best/list");
		//--------------검색-----------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if(col.equals("total")){
			word="";
		}
	
		//----------------------페이지간련----------------------
		int nowPage = 1; // 현재 보고 있는 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
		//-------------DB에서 가져올 순번-------------------------
		int sno = ((nowPage-1)*recordPerPage) +1;
		int eno = nowPage * recordPerPage;
		if(chartType==null)
			chartType="kpop";
		Map kpop=new HashMap();
		kpop.put("chartType", chartType);
		kpop.put("col", col);
		kpop.put("word", word);
		kpop.put("sno", sno);
		kpop.put("eno", eno);
		kpop.put("nowPage", nowPage);
//		kpop.put("rownum", 5);
		
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		int total=0;
		try {
			total = bdao.total(chartType);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String paging = Utility.paging5(total, nowPage, recordPerPage, col, word,chartType);
		
		try {
			model.addAttribute("list", bdao.list(kpop));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("paging", paging);
		request.setAttribute("chartType", chartType);
		
		return "/best/list";
	}
	
//	@RequestMapping("/best/plist")
//	public String plist(Model model, HttpServletRequest request){
//		
//		//--------------검색-----------------
//		String col = Utility.checkNull(request.getParameter("col"));
//		String word = Utility.checkNull(request.getParameter("word"));
//
//		if(col.equals("total")){
//			word="";
//		}
//	
//		//----------------------페이지간련----------------------
//		int nowPage = 1; // 현재 보고 있는 페이지
//		if(request.getParameter("nowPage")!=null){
//			nowPage = Integer.parseInt(request.getParameter("nowPage"));
//		}
//		int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
//		//-------------DB에서 가져올 순번-------------------------
//		int sno = ((nowPage-1)*recordPerPage) +1;
//		int eno = nowPage * recordPerPage;
//	
//		Map map = new HashMap();
//		map.put("col", col);
//		map.put("word", word);
//		
//		Map pop=new HashMap();
//		pop.put("chartType", "pop");
//		pop.put("col", col);
//		pop.put("word", word);
//		pop.put("nowPage", nowPage);
//		pop.put("sno", sno);
//		pop.put("eno", eno);
////		pop.put("rownum", 5);
//		
//		int total= 0;
//		try {
//			total = bdao.total(map);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		String paging = Utility.paging5(total, nowPage, recordPerPage, col, word);
//		
//		try {
//			model.addAttribute("popList", bdao.popList(pop));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		request.setAttribute("paging", paging);
//		request.setAttribute("chartId", "pop");
//
//		
//		return "/best/plist";
//	}
//	

		
	
	
	
	@RequestMapping("/best/read")
	public String read(Model model, int bestid){
		List<BestDTO> list=new ArrayList<BestDTO>();
		String id_list = null;
		try {
			id_list = (String) bdao.read(bestid);
			System.out.println(id_list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String[] chartid=id_list.split(",");
		BestDTO dto= null;
		for(int i=0;i<chartid.length;i++){		
			dto=new BestDTO();
			try {
				dto=bdao.readSong(chartid[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(dto);
		}
		model.addAttribute("list", list);
		return "best/read";
	}
	@RequestMapping(value="/best/create", method=RequestMethod.GET)
	public String create(){
		return "/best/create";
	}
	@RequestMapping(value="/best/create", method=RequestMethod.POST)
	public String create(Model model, int period){
		Map kpop=new HashMap();
		Map pop=new HashMap();
		kpop.put("rownum", 5);
		kpop.put("chartType", "kpop");
		kpop.put("period", period);
		
		pop.put("rownum", 5);
		pop.put("chartType", "pop");
		pop.put("period", period);
		BestDTO bdto=null;	
		List<BestDTO> klist = null;
		try {
			klist = bdao.klist(kpop);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		List<BestDTO> plist = null;
		try {
			plist = bdao.plist(pop);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
//--------------------------------------------------------------------------	
		/*국내 차트*/
		String id_list="";
		for(int i=0; i<klist.size(); i++){
			id_list+=klist.get(i).getChartid();
			
			if(i!=(klist.size()-1))
				id_list+=",";
			else
				break;
		}
//------------------------------------------------------------		
		/*해외차트*/
		String pop_list="";
		for(int i=0; i<plist.size(); i++){
			pop_list+=plist.get(i).getChartid();
			
			if(i!=(plist.size()-1))
				pop_list+=",";
			else
				break;
		}
		
		//String pop ="";
		//String kpop="";
		
//------------------------------------------------------------------
		Map map=new HashMap();
		map.put("id_list",id_list );
		map.put("period", klist.get(0).getPeriod());
		map.put("chartType","kpop");
		
		try {
			bdao.create(map);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//------------------------------------------------------------------
		Map map2=new HashMap();
		map2.put("pop_list",pop_list );
		map2.put("period", plist.get(0).getPeriod());
		map2.put("chartType", "pop");
		map2.put("title", plist.get(0).getTitle());

		try {
			bdao.popcreate(map2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:../";
	}
		
}
