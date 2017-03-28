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

public class GuestDAOTest {

	private static BeanFactory beans;
	private GuestDAO gdao;

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
		gdao = (GuestDAO) beans.getBean("gdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Ignore
	public void testCreate() {
		GuestDTO dto = new GuestDTO();
		dto.setId("CR7");
		dto.setContent("제이유닛4에서 create 테스트를 한 글입니다.");
		try {
			boolean flag = gdao.create(dto);
			assertTrue(flag);
			System.out.println("@Test : testCreate()");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "CR7");
		map.put("sno", 1);
		map.put("eno", 10);
		List<GuestDTO> list;
		try {
			list = gdao.list(map);
			assertEquals(list.size(), 4); // 조건에 맞는 갯수
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testRead() {
		GuestDTO dto = new GuestDTO();
		try {
			dto = (GuestDTO) gdao.read(5);
			assertNotNull(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testUpdate() {
		GuestDTO dto = new GuestDTO();
		try {
			dto.setGuestid(1);
			dto.setContent("update by junit4 ! ! ! !");
			assertTrue(gdao.update(dto));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testDelete() {
		try {
			assertTrue(gdao.delete(2));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "content");
		map.put("word", "4");
		try {
			assertEquals(gdao.total(map), 2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	@Ignore
	public void testCheckRefno() {
		int guestid = 7;
		assertTrue(gdao.checkRefno(guestid));
		}

}
