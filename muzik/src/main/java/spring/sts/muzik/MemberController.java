package spring.sts.muzik;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.muzik.Utility;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value="/member/delete",method=RequestMethod.GET)
	public String delete(HttpSession session,Model model){
		String id=(String)session.getAttribute("id");
		
		String oldfile=dao.getFname(id);
		
		model.addAttribute("id", id);
		model.addAttribute("oldfile", oldfile);
		
		return "member/deleteForm";
	}
	@RequestMapping(value="/member/delete",method=RequestMethod.POST)
	public String delete(String id, String oldfile,HttpServletRequest request,HttpSession session) throws Exception{
		String basePath =request.getRealPath("/member/storage");
		if(dao.delete(id)){
			if(oldfile!=null && !oldfile.equals("member.jpg")){
			Utility.deleteFile(basePath, oldfile);			
		}			
			session.invalidate();
			return "redirect:../";
		}else{
			return "error";
		}		
	}
	
	@RequestMapping(value="/member/updatePw",method=RequestMethod.GET)
	public String updatePw(){
		return "member/updatePwForm";
	}
	
	@RequestMapping(value="/member/updatePw",method=RequestMethod.POST)
	public String updatePw(String id, String password){
		if(dao.updatePw(id, password)){
			return "redirect:./read";
		}else{
			return "error";
		}		
	}
	
	@RequestMapping(value="/member/updateFile",method=RequestMethod.GET)	
	public String updateFile(){
		
		return "member/updateFileForm";
	}
	
	@RequestMapping(value="/member/updateFile",method=RequestMethod.POST)	
	public String updateFile(String id,String oldfile, MultipartFile fnameMF,HttpServletRequest request){
		
		String basePath=request.getRealPath("/member/storage");
		
		int filesize=(int)fnameMF.getSize();
		String fname="";
		if(filesize>0){
			fname= Utility.saveFile(fnameMF, basePath);
		}
		if(dao.updateFile(id, fname)){			   
			if(oldfile!=null && !oldfile.equals("member.jpg")){				
				Utility.deleteFile(basePath, oldfile);				
			}
			return "redirect:./read";
		}else{
			return "error";
		}
		
		
	}
	
	
	@RequestMapping(value="/member/update",method=RequestMethod.GET)
	public String update(HttpServletRequest request,HttpSession session){
				
		String id= request.getParameter("id");
		if(id==null){
			id=(String)session.getAttribute("id");
		}		
			
		MemberDTO dto;
		try {
			dto = (MemberDTO) dao.read(id);
			request.setAttribute("dto", dto);
			request.setAttribute("id", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "member/updateForm";
	}
	
	@RequestMapping(value="/member/update",method=RequestMethod.POST)
	public String update(MemberDTO dto,String col,String word,String nowPage,Model model,HttpSession session) throws Exception{
		String id=(String)session.getAttribute("id");
		String grade=(String)session.getAttribute("grade");
		
		if(dao.update(dto)){
			if(nowPage!=null && !nowPage.equals("")){
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
		
				return "redirect:../admin/list";				
			
			}else{
				return "redirect:../";
		
			}
		}else{
			return "error";
		}
		
		
	}
	
	
	@RequestMapping("/member/read")
	public String read(HttpServletRequest request, HttpSession session){
		//관리자가 list에서 id를 클릭하고 사용자 상세정보 볼 때
		String id= request.getParameter("id");
			
		//read.jsp에서 회원 목록 버튼 보여주기 위해서(grade=='A')
		String grade=(String)session.getAttribute("grade");		    		
		//일반 사용자가 로그인 후 메뉴에서 '나의 정보'를 눌렀을 때
		if(id==null){//관리자가 아닐 때. 
			id=(String)session.getAttribute("id");		
		 }
			
		MemberDTO dto;
		try {
			dto = (MemberDTO) dao.read(id);
			request.setAttribute("id",id);
			request.setAttribute("grade",grade);
			request.setAttribute("dto",dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
				
		
		
		return "member/read";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:../";
	}

	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String login(String id, String passwd, String c_id,String nickname,
			String no,
			String ino,
			String nowPage, 
			String nPage,
			String col, 
			String word,
			String bflag,
			Model model,
			HttpSession session, HttpServletResponse response){
		boolean flag= dao.loginCheck(id);
		String grade = null;//회원등급	
		if(flag){//회원인 경우
			grade=dao.getGrade(id);
			nickname=dao.getNickname(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			session.setAttribute("nickname", nickname);
			
		    // ---------------------------------------------- 
		    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		    // ---------------------------------------------- 
		    Cookie cookie = null; 		    
		       
		    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
		      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록 
		   
		      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록  
		         
		    }else{ 
		      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		         
		      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		    } 
		    String url = "redirect:/";
		    if(bflag !=null && !bflag.equals("")){
		    model.addAttribute(ino, no);

		    model.addAttribute("nowPage", nowPage);
		    model.addAttribute("nPage", nPage);
		    model.addAttribute("col", col);
		    model.addAttribute("word", word);
		    url = "redirect:"+bflag;
		    }
		    
		    return url;	
		}else{
			return "member/idPwError";
		}
		
	}
	
	
	
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		   
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		    
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		    
		   if (cookies != null){ 
		    for (int i = 0; i < cookies.length; i++) { 
		      cookie = cookies[i]; 
		    
		      if (cookie.getName().equals("c_id")){ 
		        c_id = cookie.getValue();     // Y 
		      }else if(cookie.getName().equals("c_id_val")){ 
		        c_id_val = cookie.getValue(); // user1... 
		      } 
		    } 
		   } 

		   /*----쿠키설정 내용 끝----------------------------*/
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);		
		
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/general_login",method=RequestMethod.POST)
	public String general_login(String id, String password, String c_id,String nickname,
			String no,
			String ino,
			String nowPage, 
			String nPage,
			String col, 
			String word,
			String bflag,
			Model model,
			HttpSession session, HttpServletResponse response){
		boolean flag= dao.general_loginCheck(id, password);
		String grade = null;//회원등급	
		if(flag){//회원인 경우
		    grade=dao.getGrade(id);
		    nickname=dao.getNickname(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			session.setAttribute("nickname", nickname);
		    // ---------------------------------------------- 
		    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		    // ---------------------------------------------- 
		    Cookie cookie = null; 		    
		       
		    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
		      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록 
		   
		      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록  
		         
		    }else{ 
		      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		         
		      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		    } 
		    String url = "redirect:/";
		    if(bflag !=null && !bflag.equals("")){
		    model.addAttribute(ino, no);

		    model.addAttribute("nowPage", nowPage);
		    model.addAttribute("nPage", nPage);
		    model.addAttribute("col", col);
		    model.addAttribute("word", word);
		    url = "redirect:"+bflag;
		    }
		    
		    return url;	
		}else{
			return "member/idPwError";
		}
		
	}
	
	
	@RequestMapping(value="/member/general_login",method=RequestMethod.GET)
	public String general_login(HttpServletRequest request){
		   
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		    
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		    
		   if (cookies != null){ 
		    for (int i = 0; i < cookies.length; i++) { 
		      cookie = cookies[i]; 
		    
		      if (cookie.getName().equals("c_id")){ 
		        c_id = cookie.getValue();     // Y 
		      }else if(cookie.getName().equals("c_id_val")){ 
		        c_id_val = cookie.getValue(); // user1... 
		      } 
		    } 
		   } 

		   /*----쿠키설정 내용 끝----------------------------*/
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);		
		
		return "member/general_loginForm";
	}
	
	
	@RequestMapping(value="/member/admin_login",method=RequestMethod.POST)
	public String admin_login(String id, String password, String c_id,
			String no,
			String ino,
			String nowPage, 
			String nPage,
			String col, 
			String word,
			String bflag,
			Model model,
			HttpSession session, HttpServletResponse response){
		boolean flag= dao.general_loginCheck(id, password);
		String grade = null;//회원등급	
		if(flag){//회원인 경우
		    grade=dao.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
		    // ---------------------------------------------- 
		    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		    // ---------------------------------------------- 
		    Cookie cookie = null; 		    
		       
		    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
		      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록 
		   
		      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록  
		         
		    }else{ 
		      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		         
		      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		    } 
		    String url = "redirect:/";
		    if(bflag !=null && !bflag.equals("")){
		    model.addAttribute(ino, no);

		    model.addAttribute("nowPage", nowPage);
		    model.addAttribute("nPage", nPage);
		    model.addAttribute("col", col);
		    model.addAttribute("word", word);
		    url = "redirect:"+bflag;
		    }
		    
		    return url;	
		}else{
			return "member/idPwError";
		}
		
	}
	
	
	@RequestMapping(value="/member/admin_login",method=RequestMethod.GET)
	public String admin_login(HttpServletRequest request){
		   
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		    
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		    
		   if (cookies != null){ 
		    for (int i = 0; i < cookies.length; i++) { 
		      cookie = cookies[i]; 
		    
		      if (cookie.getName().equals("c_id")){ 
		        c_id = cookie.getValue();     // Y 
		      }else if(cookie.getName().equals("c_id_val")){ 
		        c_id_val = cookie.getValue(); // user1... 
		      } 
		    } 
		   } 

		   /*----쿠키설정 내용 끝----------------------------*/
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);		
		
		return "member/admin_loginForm";
	}
	
	
	
	
	
	
	@RequestMapping(value="/member/idpasswordCheck")
	public String idpasswordCheck(String id, String password, Model model){
		
	
		boolean flag=dao.general_loginCheck(id, password);
		
		model.addAttribute("id",id);		
		model.addAttribute("password",password);	
		model.addAttribute("flag",flag);
	
		
		return "member/idpasswordCheck";
	}
	
	
	
	@RequestMapping(value="/member/email_proc")
	public String email_proc(String email,Model model){
		boolean flag=dao.duplicateEmail(email);
		
		model.addAttribute("email",email);
		model.addAttribute("flag",flag);
		
		return "member/email_proc";
	}
	
	@RequestMapping("/member/email_form")
	public String email_form(){		
		return "member/email_form";
	}
	
	@RequestMapping("/member/id_proc")
	public String id_proc(String id,Model model){
		
		boolean flag=dao.duplicateId(id);
		
		model.addAttribute("id",id);
		model.addAttribute("flag",flag);
		
		return "member/id_proc";
	}
	
	@RequestMapping("/member/id_form")
	public String id_form(){		
		return "member/id_form";
	}
	
	
	@RequestMapping(value="/member/create",method=RequestMethod.GET)
	public String create(){
		return "member/createForm";
	}
	
	@RequestMapping(value="/member/create",method=RequestMethod.POST)
	public String create(MemberDTO dto,HttpServletRequest request){
				
		String str="";
		String viewPage="member/prcreateProc";
		
		
		
		boolean flag;
		try {
			flag = dao.create(dto);
			if(flag){
				viewPage="redirect:../";		
			} else{
				viewPage="error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		 return viewPage;
	}
	
	
	@RequestMapping(value="/member/general_create",method=RequestMethod.GET)
	public String general_create(){
		return "member/general_createForm";
	}
	
	@RequestMapping(value="/member/general_create",method=RequestMethod.POST)
	public String general_create(MemberDTO dto,HttpServletRequest request){
				
		String str="";
		String viewPage="member/prcreateProc";
		
		
		String upDir= request.getRealPath("/member/storage");//절대경로에서부터 뽑아오기 위한 것.
		String filename="";
		int filesize=(int)dto.getFnameMF().getSize();
		
		if(filesize>0){
			filename=Utility.saveFile(dto.getFnameMF(), upDir);
		} else{
			filename="member.jpg";
		}		
		
		dto.setFname(filename);
		
		boolean flag= dao.general_create(dto);
		if(flag){
			viewPage="redirect:../";		
		} else{
			viewPage="error";
		}
		
		
		 return viewPage;
	}
	
	@RequestMapping("/member/agree")
	public String agree(){
		return "/member/agree";
	}
	
	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) throws Exception{
		//검색관련
		String col= Utility.checkNull(request.getParameter("col"));
		String word= Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word= "";		
		}

		//페이징 관련
		int nowPage= 1;
		int recordPerPage= 5;
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		//DB에서 가져올 순번
		int sno= ((nowPage-1)*recordPerPage)+1;
		int eno= nowPage*recordPerPage;
		
		Map map =new HashMap();
		
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		
		int total= dao.total(map);
		List <MemberDTO> list= dao.list(map);
		Iterator<MemberDTO> iter=list.iterator();
		
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		
		
		return "member/list";
	}
}
