package spring.model.notice;

import static org.junit.Assert.*;

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


public class NoticeDAOTest {
	private static BeanFactory beans;
	private static NoticeDAO nodao;

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
		
		nodao = (NoticeDAO)beans.getBean("nodao");
	}

	@After 
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCreate() {
		NoticeDTO dto = new NoticeDTO();
		dto.setNoticeid(4);
		dto.setTitle("테스트4");
		dto.setContent("내용테스트4");
		try {
			assertTrue(nodao.create(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("sno", "1");
		map.put("eno", "5");
		List<NoticeDTO> list;
		try {
			list = nodao.list(map);
			//assertEquals(list.size(), 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test @Ignore
	public void testRead() {
//		nodao.upViewcnt(3);
		Object dto;
		try {
			dto = nodao.read(3);
			assertNotNull(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testUpdate() {
		NoticeDTO dto = new NoticeDTO();
		dto.setNoticeid(2);
		dto.setTitle("제목변경완료");
		dto.setContent("내용변경 완료");
		
		try {
			assertTrue(nodao.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDelete() {
		try {
			assertTrue(nodao.delete(4));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testPassCheck() {
		fail("Not yet implemented");
	}

}
