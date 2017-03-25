package spring.sts.muzik;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.best.BestDAO;
import spring.model.best.BestDTO;
import spring.model.best.LikebestDAO;
import spring.model.best.LikebestDTO;
@Controller
public class LikebestController {

	@Autowired
	private LikebestDAO ldao;
	
	@Autowired
	private BestDAO bdao;
	@RequestMapping("/likebest/list")
	public String list(Model model){
		
		List<LikebestDTO> list = ldao.list();
		
		model.addAttribute("list", list);
		
		return "/likebest/list";
		
	}
	
	@RequestMapping("/best/list")
	public String llist(Model model){
		model.addAttribute("list", bdao.list());						
		return "/best/list";
	}
	@RequestMapping("/best/read")
	public String read(Model model, int bestid){
		List<BestDTO> list=new ArrayList<BestDTO>();
		String id_list=bdao.read(bestid);
		String[] chartid=id_list.split("[,]");
		BestDTO dto=null;
		for(int i=0;i<chartid.length;i++){		
			dto=new BestDTO();
			dto=(bdao.readSong(chartid[i]));
			list.add(dto);
		}
		model.addAttribute("list", list);
		return "/best/read";
	}
	@RequestMapping(value="/best/create", method=RequestMethod.GET)
	public String create(){
		return "/best/create";
	}
	@RequestMapping(value="/best/create", method=RequestMethod.POST)
	public String create(Model model){
		LikebestDTO dto = new LikebestDTO();
		BestDTO bdto=null;
		List<LikebestDTO> list = ldao.list(); //�뜲�씠�꽣媛��졇�샂
		List<BestDTO> llist = bdao.llist();
		String id_list="";
		for(int i=0; i<llist.size(); i++){
			
			id_list+=llist.get(i).getChartid();
			if(i!=(llist.size()-1))
				id_list+=",";
			else
				continue;
			
			
		}
		Map map=new HashMap();
		map.put("id_list", id_list);
		map.put("period", llist.get(0).getPeriod());
		map.put("chartType", llist.get(0).getChartType());
		bdao.create(map);
	
		return "redirect:../";
	}
	
	
}
