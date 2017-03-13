package spring.model.bbs;

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

public class BbsDAOTest {
	
	private static BbsDAO bdao;
	private static BeanFactory beans;

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
		bdao = (BbsDAO)beans.getBean("bdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Ignore //완료
	public void testCreate() throws Exception {
		BbsDTO dto = new BbsDTO();
		dto.setTitle("1Create");
		dto.setContent("1Create");
		dto.setId("CR7");
		dto.setFilename("1Create.jpg");
		dto.setFilesize(50);
		assertTrue(bdao.create(dto));

	}

	@Ignore //완료
	public void testList() throws Exception {
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "");
		map.put("word", "");
		List<BbsDTO> list = bdao.list(map);
		assertEquals(list.size(), 4);
	}

	@Test //완료
	public void testRead() throws Exception {
		bdao.upViewcnt(3);
		Object dto = bdao.read(3);
		assertNotNull(dto);
	}

	@Ignore //완료
	public void testUpdate() {
		BbsDTO dto = new BbsDTO();
		dto.setBbsid(3);
		dto.setTitle("update");
		dto.setContent("update");
		dto.setFilename("update");
		dto.setFilesize(100);
		try {
			assertTrue(bdao.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore //완료
	public void testDelete() {
		try {
			assertTrue(bdao.delete(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore //완료
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "CR7");
		try {
			assertEquals(bdao.total(map),4);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore
	public void testUpViewcnt() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testPageRead() {
		fail("Not yet implemented");
	}

}
