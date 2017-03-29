package spring.model.music;

import java.util.List;
import java.util.Map;

import spring.model.muzik.DAOSTDInter;

public interface IChartDAO extends DAOSTDInter {
	
	/**
	 * 주간 차트
	 * @param week
	 * @return
	 */
	public List<ChartDTO> weekList(Map map); 
	/**
	 * 월간 차트
	 * @param week
	 * @return
	 */
	public List<ChartDTO> monthList(int week);
	/**
	 * 연간 차트
	 * @param week
	 * @return
	 */
	public List<ChartDTO> yearList(int week);
	/**
	 * '좋아요'를 눌렀는지 체크
	 *  유저가 체크한pk 
	 * @param map( chartid, id) 
	 * @return chartid
	 */
	public List<String> checkedLike(Map map);
	/**
	 * 전곡듣기 - urlList
	 * @param week
	 * @return
	 */
	public List<String> urlList(Map map);
	/**
	 * 선택한 곡 추가
	 * @param map
	 * @return
	 */
	public int addSelect(Map map);
	/**
	 * list화면에 최근곡 띄우기 위해서 가장 최근 날짜값 
	 * @return
	 */
	public int latest(Map map);
	/**
	 * 해당 곡 '좋아요' 수
	 * ajax처리하고 결과처리용도
	 * @param map
	 * @return
	 */
	public int mlike(Map map);
	/**
	 * '좋아요' 눌렀는지 체크할 때 사용
	 * @param map
	 * @return
	 */
	public int likeUser(Map map);
	/**
	 * '좋아요' 눌렀을 때 ++
	 * @param map
	 * @return
	 */
	public int updateMlike(Map map);
	/**
	 * 보관함 내용 변경
	 * @param map
	 * @return
	 */
	public int updateInven(Map map);
	/**
	 * 보관함 이름 변경
	 * @param map
	 * @return
	 */
	public int updateInvenTitle(Map map);
	/**
	 * 보관 목록 삭제
	 * @param map
	 * @return
	 */
	public int deleteInven(Map map);
	/**
	 * 각 보관 목록 읽기
	 * @param map
	 * @return
	 */
	public String readInven(Map map);
	/**
	 * 보관함 이름 읽기
	 * @param map
	 * @return
	 */
	public String readInvenTitle(Map map);
	/**
	 * 한곡 재생을 위한 해당 곡 정보 읽기
	 * @param weekid
	 * @return
	 */
	public ChartDTO readSong(String period);
	/**
	 * <select>에 주간차트 날짜 넣어줄 때
	 * @return
	 */
	public List<Integer> scroll_week(String chartType);
	/**
	 * 차트생성
	 * @param dto
	 * @return
	 */
	public boolean create(ChartDTO dto);
	/**
	 * 보관 각 목록
	 * @param id
	 * @return
	 */
	public List<ChartDTO> invenList(String id);
	/**
	 * 해당곡의 url
	 * @param weekid
	 * @return
	 */
	public String url(String weekid);
	public Object read(String str);
}
