package spring.model.guestbook;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class GuestReplyDAOTest {

	private static BeanFactory beans;
	private GuestReplyDAO grdao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("junit/muzik.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		grdao = (GuestReplyDAO) beans.getBean("grdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Ignore
	public void testUpAnsnum() {
		// 리턴형이 없어서 테스트하기 힘듬.
		// create에서 같이 테스트 해야한다.
	}

	@Test
	@Ignore
	public void testCreate() {
		GuestReplyDTO dto = new GuestReplyDTO();
		dto.setId("KingSung9");
		dto.setContent("indent 1 짜리 댓글입니다. upansnum 동작후 create 됩니다.");
		dto.setGuestid(4);
		System.out.println(dto.getId());
		System.out.println(dto.getContent());
		System.out.println(dto.getGuestid());
		System.out.println("map 전");
		Map map = new HashMap();
		map.put("guestid", 4);
		map.put("ansnum", 0);
		grdao.upAnsnum(map);
		System.out.println("upansnum 완료");
		boolean flag = grdao.create(dto);
		System.out.println("createreply 완료");
		assertTrue(flag);
	}

	@Test
	@Ignore
	public void testCreateReReply() {
		GuestReplyDTO dto = new GuestReplyDTO();

		dto.setId("CR7");
		dto.setContent("indent 1 보다 큰 댓글입니다. upansnum 동작후 createReReply 됩니다.");
		dto.setGuestid(4);
		dto.setGuestrid(7);
		dto.setIndent(0);
		dto.setAnsnum(1);

		System.out.println(dto.getId());
		System.out.println(dto.getContent());
		System.out.println(dto.getGuestid());
		System.out.println(dto.getGuestrid());
		System.out.println(dto.getIndent());
		System.out.println(dto.getAnsnum());
		System.out.println("map 전");

		Map map = new HashMap();
		map.put("guestid", dto.getGuestid());
		map.put("ansnum", dto.getAnsnum());
		grdao.upAnsnum(map);
		System.out.println("upansnum 완료");

		boolean flag = grdao.createReReply(dto);
		System.out.println("createreply 완료");

		assertTrue(flag);
	}

	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("guestid", 4);
		map.put("sno", 1);
		map.put("eno", 10);
		try {
			List<GuestReplyDTO> list = grdao.list(map);
			assertEquals(list.size(), 8); // 조건에 맞는 갯수
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testRcount() {
		int guestid = 4;
		try {
			assertEquals(grdao.rcount(guestid), 8);
			// 뒤에 4가 적힌 자리는 guestid에 해당하는 댓글의 갯수
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testRead() {
		GuestReplyDTO dto;
		try {
			dto = (GuestReplyDTO) grdao.read(11);
			assertNotNull(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testUpdate() {
		GuestReplyDTO dto = new GuestReplyDTO();
		dto.setContent("J유닛4에서 수정함.");
		dto.setGuestrid(10);
		try {
			assertTrue(grdao.update(dto));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testDelete() {
		try {
			Map map = new HashMap();
			map.put("guestid", 4);
			map.put("ansnum", 6);
			grdao.downAnsnum(map);
			// 삭제할 댓글의 번호(guestrid)
			assertTrue(grdao.delete(9));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("guestid", 4);
		try {
			assertEquals(grdao.total(map), 7);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testCheckRefno() {
		// 댓글이 있는지 확인할 댓글번호 (guestrid)
		assertTrue(grdao.checkRefno(8));
	}
}
