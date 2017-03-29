package spring.sts.muzik;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.YouTube.Search;
import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.google.api.services.youtube.model.Thumbnail;

import spring.model.music.ChartDAO;
import spring.model.music.ChartDTO;

@Controller
public class MusicController {
	/** Global instance properties filename. */
	private static String PROPERTIES_FILENAME = "youtube.properties";

	/** Global instance of the HTTP transport. */
	private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

	/** Global instance of the JSON factory. */
	private static final JsonFactory JSON_FACTORY = new JacksonFactory();

	/**
	 * Global instance of the max number of videos we want returned (50 = upper
	 * limit per page).
	 */
	private static final long NUMBER_OF_VIDEOS_RETURNED = 1;

	/** Global instance of Youtube object to make all API requests. */
	private static YouTube youtube;

	@Autowired
	private ChartDAO cdao;
	
	@RequestMapping("/music/chart")
	public String chart(){
		return "/music/chart";
	}
	@RequestMapping("/music/appendInven")
	public String appendInven(Model model,HttpSession session, int invenId, String title, String addList){
		List<ChartDTO> readInven =new ArrayList<ChartDTO>();
		String id=(String) session.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("invenId", invenId);
		String chartidList=cdao.readInven(map);
		//기존 보관함 목록에 추가
		if(chartidList==null){
			chartidList=addList;
		}else{
			chartidList+=","+addList;
		}
		map.put("myList",chartidList);
		//수정작업
		if(cdao.updateInven(map)>0){
			if(chartidList==null){
				readInven=null;
			}else{
				String[] chartid=chartidList.split(",");
				//chartid기준으로 list 만듦.
				for(int i=0;i<chartid.length;i++){
					readInven.add(cdao.readSong(chartid[i])); //곡 정보가져옴
				}
			}
			model.addAttribute("readInven", readInven);
			model.addAttribute("invenId", invenId);
			model.addAttribute("title", title);
		}
		return "/music/readInven";
	}
	@RequestMapping("/music/updateInvenTitle")
	public String updateInvenTitle(Model model,HttpSession session, int invenId,String title){
		String id=(String) session.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("invenId", invenId);
		map.put("title", title);
		if(cdao.updateInvenTitle(map)>0){
			model.addAttribute("title", cdao.readInvenTitle(map));
		}
		return "/music/readInvenTitle";
	}
	@RequestMapping("/music/deleteAll")
	public String deleteInven(Model model,HttpSession seesion, int invenId){
		List<ChartDTO> readInven =new ArrayList<ChartDTO>();
		String id=(String) seesion.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("invenId", invenId);
		cdao.deleteInven(map);	
		return "redirect:./weekList";
	}
	@RequestMapping("/music/deleteSelect")
	public String deleteSelect(Model model,HttpSession seesion, int invenId, String deleteList){
		List<ChartDTO> readInven =new ArrayList<ChartDTO>();
		String id=(String) seesion.getAttribute("id");
		String myList="";
		String viewPage="/music/weekList";
		Map map=new HashMap();
		map.put("id", id);
		map.put("invenId", invenId);
		String[] chartid=cdao.readInven(map).split(",");
		String[] deleteid=deleteList.split(",");
		List<String> list=new ArrayList<String>();
		Collections.addAll(list, chartid);
		//System.out.println("삭제 전 리스트: "+list);
		//기존 리스트에서 선택된 것만 삭제
		for(int i=0;i<deleteid.length;i++){
			list.remove(deleteid[i]);			
		}
		//System.out.println("삭제 후 리스트: "+list);
		//삭제 처리된 리스트를 디비에 처리하기 위해 문자열 바꿈, 구분자[,]
		myList=String.join(",", list);
		//디비처리를 위해 map에 추가
		map.put("myList", myList);
		//chartid기준으로 list 만듦.
		if(cdao.updateInven(map)>0){		
			for(int i=0;i<list.size();i++){
				readInven.add(cdao.readSong(list.get(i))); //곡 정보가져옴
			}
			model.addAttribute("readInven", readInven);
			model.addAttribute("invenId", invenId);
			viewPage="/music/readInven";
		}
		return viewPage;
	}
	@RequestMapping("/music/readInven")
	public String readInven(Model model,HttpSession seesion, int invenId, String invenname){
		List<ChartDTO> readInven =new ArrayList<ChartDTO>();
		String id=(String) seesion.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("invenId", invenId);
		String chartidList=cdao.readInven(map);
		if(chartidList==null){
			readInven=null;
		}else{
			String[] chartid=chartidList.split(",");
			//chartidList기준으로 list 만듦.
			
			for(int i=0;i<chartid.length;i++){
				readInven.add(cdao.readSong(chartid[i])); //곡 정보가져옴
			}
		}
		model.addAttribute("readInven", readInven);
		model.addAttribute("invenId", invenId);
		model.addAttribute("invenname", invenname);
		return "/music/readInven";
	}
	
	@RequestMapping(value="/music/updateMlike",method = RequestMethod.POST)
	public String updateMlike(Model model,HttpSession seesion,String chartid,String artist,String title){
		String id=(String) seesion.getAttribute("id");
		Map map=new HashMap();
		map.put("artist", artist);
		map.put("title", title);
		System.out.println("artist:"+artist);
		System.out.println("title:"+title);
		Map likeMap=new HashMap();
		likeMap.put("id", id);
		likeMap.put("chartid", chartid);
		int cnt=cdao.updateMlike(map);
		//System.out.println("좋아요 클릭!");
		//System.out.println(title+" - "+artist+" 갱신> "+cnt);
		if(cnt>0){
			cdao.likeUser(likeMap); //좋아요 누른 유저 저장	
			model.addAttribute("mlike",cdao.mlike(map) ); //해당곡 like_cnt
		}
	
		
		return "/music/updateMlike";
	}
	@RequestMapping("/music/playSelect")
	public String playSelect(Model model,String myList){
		List<String> urlList=new ArrayList<String>();
		
		String[] chartid=myList.split(",");
		//chartid기준으로 list 만듦.
		for(int i=0;i<chartid.length;i++){
			urlList.add(cdao.url(chartid[i]));
		}
		model.addAttribute("urlList", urlList);
		return "/music/iframePlayer";
	}
	@RequestMapping("/music/addSelect") //인벤토리에 내 목록 넣기
	public String addSelect(Model model,String myList,HttpSession session,String invenname){
		String id=(String) session.getAttribute("id");
		Map map=new HashMap();
		map.put("myList", myList);
		map.put("id", id);
		map.put("invenname", invenname);
		//System.out.println("title list>>"+title);
		//System.out.println("myList >>"+myList);
		cdao.addSelect(map);
		model.addAttribute("invenList", cdao.invenList(id));
		
		return "/music/inventory";
	}
	@RequestMapping("/music/inventory")
	public String inventory(Model model,HttpSession session){
//		String myListStr="";
//		for(int i=0;i<myList.size();i++){
//			myListStr+=myList.get(i)+",";
//		}
		
		String id=(String) session.getAttribute("id");
		model.addAttribute("invenList", cdao.invenList(id));
		
		//return "redirect:./weekList";
		return "/music/inventory";
	}
	@RequestMapping("/music/read")
	public String read(Model model, String chartid){
		
		model.addAttribute("dto", cdao.read(chartid.trim()));
		return "/music/read";
	}
	@RequestMapping("/music/top100Player")
	public String top100Player(Model model,int period,String chartType){
		Map map=new HashMap();
		map.put("chartType", chartType);
		map.put("period", period);
		model.addAttribute("urlList", cdao.urlList(map));
		System.out.println("map>"+map);
		System.out.println("list"+cdao.urlList(map));
			
		return "/music/iframePlayer";
	}
	@RequestMapping("/music/selectPlayer") //보관함안에서 전체듣기
	public String selectPlayer(Model model, HttpSession session,int invenId ){
		List<String> urlList=new ArrayList<String>();
		String id=(String) session.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("invenId", invenId);
		String[] chartid=cdao.readInven(map).split(",");
		//chartid기준으로 list 만듦.
		for(int i=0;i<chartid.length;i++){
			urlList.add(cdao.url(chartid[i]));
		}
		model.addAttribute("urlList", urlList);
		
		return "/music/iframePlayer";
	}
	@RequestMapping("/music/weekList")
	public String weekList(Model model, HttpSession session,Integer period){
		long startTime = System.currentTimeMillis();
		String chartType="kpop";
		
		Map lastestMap=new HashMap();
		lastestMap.put("separator", "week");
		lastestMap.put("chartType", chartType);
		if(period==null){
			period=Integer.valueOf(cdao.latest(lastestMap));
		}
		Map weekMap=new HashMap();
		weekMap.put("period", period);
		weekMap.put("chartType", chartType);
		String id=(String) session.getAttribute("id");
		if(id==null){
			model.addAttribute("weekList", cdao.weekList(weekMap));
		}else{
			Map map=new HashMap();
			map.put("id",session.getAttribute("id"));
			map.put("period", period);
			map.put("separator", "week");
			
			model.addAttribute("scroll_week", cdao.scroll_week(chartType));
			model.addAttribute("weekList", cdao.weekList(weekMap));
			model.addAttribute("checkedLike", cdao.checkedLike(map));
		}
		long endTime = System.currentTimeMillis();
		// Total time
		double lTime = (double) (endTime - startTime) / 1000;
		System.out.println("ChartList_TIME : " + lTime + "(sec)");
		return "/music/weekList";
	}
	@RequestMapping("/music/weekPopList")
	public String weekPopList(Model model, HttpSession session,Integer period){
		long startTime = System.currentTimeMillis();
		session.setAttribute("id", "KingSung9");
		String chartType="pop";
		
		Map lastestMap=new HashMap();
		lastestMap.put("separator", "week");
		lastestMap.put("chartType", chartType);
		if(period==null){
			period=Integer.valueOf(cdao.latest(lastestMap));
		}
		Map weekMap=new HashMap();
		weekMap.put("period", period);
		weekMap.put("chartType", chartType);
		String id=(String) session.getAttribute("id");
		if(id==null){
			model.addAttribute("weekList", cdao.weekList(weekMap));
		}else{
			Map map=new HashMap();
			map.put("id",session.getAttribute("id"));
			map.put("period", period);
			map.put("separator", "week");
			
			model.addAttribute("scroll_week", cdao.scroll_week(chartType));
			model.addAttribute("weekList", cdao.weekList(weekMap));
			model.addAttribute("checkedLike", cdao.checkedLike(map));
		}
		long endTime = System.currentTimeMillis();
		// Total time
		double lTime = (double) (endTime - startTime) / 1000;
		System.out.println("ChartList_TIME : " + lTime + "(sec)");
		return "/music/weekPopList";
	}
	@RequestMapping(value = "/music/wcreate", method = RequestMethod.GET)
	public String create() {
		return "/music/weekCreateForm";
	}

	@RequestMapping(value = "/music/wcreate", method = RequestMethod.POST)
	public String weekPlaylist(Model model, String period,String url,String chartType) throws IOException {
		
		// 1. 가져오기전 시간 찍기

		System.out.println(" Start Date : " + getCurrentData());

		// 2. 가져올 HTTP 주소 세팅
		// http://gaonchart.co.kr/main/section/chart/online.gaon
		// http://www.naver.com
		HttpPost http = new HttpPost(url);
//		HttpPost http = new HttpPost("http://gaonchart.co.kr/main/section/chart/online.gaon");

		// 3. 가져오기를 실행할 클라이언트 객체 생성

		HttpClient httpClient = HttpClientBuilder.create().build();

		// 4. 실행 및 실행 데이터를 Response 객체에 담음

		HttpResponse response = httpClient.execute(http);

		// 5. Response 받은 데이터 중, DOM 데이터를 가져와 Entity에 담음

		HttpEntity entity = response.getEntity();

		// 6. Charset을 알아내기 위해 DOM의 컨텐트 타입을 가져와 담고 Charset을 가져옴

		ContentType contentType = ContentType.getOrDefault(entity);

		Charset charset = contentType.getCharset();

		// 7. DOM 데이터를 한 줄씩 읽기 위해 Reader에 담음 (InputStream / Buffered 중 선택은 개인취향)

		BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));

		// 8. 가져온 DOM 데이터를 담기위한 그릇

		StringBuffer sb = new StringBuffer();

		// 9. DOM 데이터 가져오기

		String line = "";

		while ((line = br.readLine()) != null) {

			sb.append(line + "\n");

		}

		// 10. 가져온 아름다운 DOM을 보자

		// System.out.println(sb.toString());

		// 11. Jsoup으로 파싱해보자.

		Document doc = Jsoup.parse(sb.toString());
		// System.out.println(el_artist.toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>",
		// ""));

		// 12. 얼마나 걸렸나 찍어보자
		System.out.println(" End Date : " + getCurrentData());

		// Chart !
		Elements el_artist = doc.select(".singer");
		String artist = el_artist.toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		String[] twoWord = artist.split("\n");
		String[] artistList = new String[100];
		String[] albumList = new String[100];

		for (int i = 0; i < twoWord.length; i++) {
			String[] splitWord = twoWord[i].split("[|]");
			artistList[i] = splitWord[0];
			albumList[i] = splitWord[1];

		}

		Elements el_rankCh = doc.select(".change > span");
		String rankCh = el_rankCh.toString();
		String[] rankChList = rankCh.split("\n");

		Elements el_subject = doc.select(".subject >p[title]:first-child");
		String subject = el_subject.toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		String[] titleList = subject.split("\n");
		String urlList[] = new String[100];
		String thumbList[] = new String[100];
		// Read the developer key from youtube.properties
		Properties properties = new Properties();
		try {
			InputStream in = Search.class.getResourceAsStream("/" + PROPERTIES_FILENAME);
			properties.load(in);

		} catch (IOException e) {
			System.err.println(
					"There was an error reading " + PROPERTIES_FILENAME + ": " + e.getCause() + " : " + e.getMessage());
			System.exit(1);
		}

		try {
			/*
			 * The YouTube object is used to make all API requests. The last
			 * argument is required, but because we don't need anything
			 * initialized when the HttpRequest is initialized, we override the
			 * interface and provide a no-op function.
			 */
			youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
				public void initialize(HttpRequest request) throws IOException {
				}
			}).setApplicationName("youtube-cmdline-search-sample").build();

			long startTime = System.currentTimeMillis();
			// 원하는 수만큼 출력하기 (0~99 , max:100),밑에 dto 반복문도 같이 수정해야한다 
			for (int songCount = 0; songCount < 100; songCount++) {
				String inputQuery = artistList[songCount] + " " + titleList[songCount];
				String queryTerm = inputQuery;
				// Get query term from user.
				// String queryTerm = getInputQuery();

				YouTube.Search.List search = youtube.search().list("id,snippet");
				/*
				 * It is important to set your developer key from the Google
				 * Developer Console for non-authenticated requests (found under
				 * the API Access tab at this link: code.google.com/apis/). This
				 * is good practice and increased your quota.
				 */
				String apiKey = properties.getProperty("youtube.apikey");
				search.setKey(apiKey);
				search.setQ(queryTerm);
				/*
				 * We are only searching for videos (not playlists or channels).
				 * If we were searching for more, we would add them as a string
				 * like this: "video,playlist,channel".
				 */
				search.setType("video");
				/*
				 * This method reduces the info returned to only the fields we
				 * need and makes calls more efficient.
				 */
				search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url)");
				search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);
				SearchListResponse searchResponse = search.execute();

				List<SearchResult> searchResultList = searchResponse.getItems();

				if (searchResultList != null) {
					System.out.print(" " + (songCount + 1) + "위");
					if (!searchResultList.iterator().hasNext()) {
						System.out.println(" There aren't any results for your query.");
					}

					// while (searchResultList.iterator().hasNext()) {

					SearchResult singleVideo = searchResultList.iterator().next();
					ResourceId rId = singleVideo.getId();

					// Double checks the kind is video.
					if (rId.getKind().equals("youtube#video")) {
						Thumbnail thumbnail = singleVideo.getSnippet().getThumbnails().get("default");

						System.out.println(" , " + singleVideo.getSnippet().getTitle());
						System.out.println(" Video Id" + rId.getVideoId());
						System.out.println(" URL: https://www.youtube.com/watch?v=" + rId.getVideoId());
						System.out.println(" Thumbnail: " + thumbnail.getUrl());
						System.out.println("\n-------------------------------------------------------------\n");
						urlList[songCount] = rId.getVideoId();
						thumbList[songCount] = thumbnail.getUrl();
					}
					// }
				}
			}
			long endTime = System.currentTimeMillis();
			// Total time
			double lTime = (double) (endTime - startTime) / 1000;
			System.out.println("TIME : " + lTime + "(sec)");
		} catch (GoogleJsonResponseException e) {
			System.err.println(
					"There was a service error: " + e.getDetails().getCode() + " : " + e.getDetails().getMessage());
		} catch (IOException e) {
			System.err.println("There was an IO error: " + e.getCause() + " : " + e.getMessage());
		} catch (Throwable t) {
			t.printStackTrace();
		}

		/*
		 * Returns a query term (String) from user via the terminal.
		 */

		ChartDTO cdto = null;
		if(chartType.equals("kpop")){
			System.out.println("K-PopChart Creating");
			for (int i = 0; i < albumList.length; i++) {			
				String chartid="1"+period+Integer.toString(i+1);
				cdto=new ChartDTO();
				cdto.setPeriod(Integer.parseInt(period));
				cdto.setChartid(chartid);
				cdto.setRank(i+1);
				cdto.setChRank(rankChList[i]);
				cdto.setTitle(titleList[i]);
				cdto.setArtist(artistList[i]);
				cdto.setAlbum(albumList[i]);
				cdto.setThumbnail(thumbList[i]);
				cdto.setUrl(urlList[i]);
				cdto.setSeparator("week");
				cdto.setChartType(chartType);
				if (cdao.create(cdto)) {
					if((i+1)%20==0)
						System.out.println((i+1)+"%");
				} else {
					return "error";
				}
			}
		}else if(chartType.equals("pop")){
			System.out.println("PopChart Creating");
			for (int i = 0; i < albumList.length; i++) {
				String chartid="2"+period+Integer.toString(i+1);
				cdto=new ChartDTO();
				cdto.setPeriod(Integer.parseInt(period));
				cdto.setChartid(chartid);
				cdto.setRank(i+1);
				cdto.setChRank(rankChList[i]);
				cdto.setTitle(titleList[i]);
				cdto.setArtist(artistList[i]);
				cdto.setAlbum(albumList[i]);
				cdto.setThumbnail(thumbList[i]);
				cdto.setUrl(urlList[i]);
				cdto.setSeparator("week");
				cdto.setChartType(chartType);
				if (cdao.create(cdto)) {
					if((i+1)%20==0)
						System.out.println((i+1)+"%");
				} else {
					return "error";
				}
			}
		}
		return "redirect:../";
	}

	@RequestMapping("/music/list")
	public String list(Model model) throws IOException {

		// 1. 가져오기전 시간 찍기

		System.out.println(" Start Date : " + getCurrentData());

		// 2. 가져올 HTTP 주소 세팅
		// http://gaonchart.co.kr/main/section/chart/online.gaon
		// http://www.naver.com
		HttpPost http = new HttpPost("http://gaonchart.co.kr/main/section/chart/online.gaon");

		// 3. 가져오기를 실행할 클라이언트 객체 생성

		HttpClient httpClient = HttpClientBuilder.create().build();

		// 4. 실행 및 실행 데이터를 Response 객체에 담음

		HttpResponse response = httpClient.execute(http);

		// 5. Response 받은 데이터 중, DOM 데이터를 가져와 Entity에 담음

		HttpEntity entity = response.getEntity();

		// 6. Charset을 알아내기 위해 DOM의 컨텐트 타입을 가져와 담고 Charset을 가져옴

		ContentType contentType = ContentType.getOrDefault(entity);

		Charset charset = contentType.getCharset();

		// 7. DOM 데이터를 한 줄씩 읽기 위해 Reader에 담음 (InputStream / Buffered 중 선택은 개인취향)

		BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));

		// 8. 가져온 DOM 데이터를 담기위한 그릇

		StringBuffer sb = new StringBuffer();

		// 9. DOM 데이터 가져오기

		String line = "";

		while ((line = br.readLine()) != null) {

			sb.append(line + "\n");

		}

		// 10. 가져온 아름다운 DOM을 보자

		// System.out.println(sb.toString());

		// 11. Jsoup으로 파싱해보자.

		Document doc = Jsoup.parse(sb.toString());
		// System.out.println(el_artist.toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>",
		// ""));

		// 12. 얼마나 걸렸나 찍어보자
		System.out.println(" End Date : " + getCurrentData());

		// Chart !
		Elements el_artist = doc.select(".singer");
		String artist = el_artist.toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		String[] twoWord = artist.split("\n");
		String[] artistList = new String[100];
		String[] albumList = new String[100];

		for (int i = 0; i < twoWord.length; i++) {
			String[] splitWord = twoWord[i].split("[|]");
			artistList[i] = splitWord[0];
			albumList[i] = splitWord[1];

		}

		Elements el_rankCh = doc.select(".change > span");
		String rankCh = el_rankCh.toString();
		String[] rankChList = rankCh.split("\n");

		Elements el_subject = doc.select(".subject >p[title]:first-child");
		String subject = el_subject.toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		String[] titleList = subject.split("\n");

		/*
		 * String[] titleList1=new String[100]; String[] rankChList1=new
		 * String[100]; String[] albumList1=new String[100]; String[]
		 * artistList1=new String[100];
		 * 
		 * for(int i=0;i<titleList1.length;i++){ artistList1[i]=artistList[i];
		 * albumList1[i]=albumList[i]; rankChList1[i]=rankChList[i];
		 * titleList1[i]=titleList[i]; }
		 */
		// List list=new ArrayList();
		// list.add(titleList1);
		// list.add(rankChList1);
		// list.add(albumList1);
		// list.add(artistList1);
		model.addAttribute("titleList", titleList);
		model.addAttribute("rankChList", rankChList);
		model.addAttribute("albumList", albumList);
		model.addAttribute("artistList", artistList);

		return "/music/list";
	}
	public static String getCurrentData() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

		return sdf.format(new Date());

	}

	private static String getInputQuery() throws IOException {

		String inputQuery = "";

		System.out.print("Please enter a search term: ");
		BufferedReader bReader = new BufferedReader(new InputStreamReader(System.in));
		inputQuery = bReader.readLine();

		if (inputQuery.length() < 1) {
			// If nothing is entered, defaults to "YouTube Developers Live."
			inputQuery = "YouTube Developers Live";
		}
		return inputQuery;
	}

}