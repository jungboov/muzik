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

import spring.model.bbsReply.BbsReplyDAO;
import spring.model.bbsReply.BbsReplyDTO;

public class BbsReplyDAOTest {
	
	private static BbsReplyDAO rdao;
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
		rdao = (BbsReplyDAO) beans.getBean("rdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testRcount() {
		fail("Not yet implemented");
	}

	@Test @Ignore //완료
	public void testBdelete() {
		int bbsid = 3;
		assertEquals(rdao.bdelete(bbsid), 1);
	}

	@Test @Ignore//완료
	public void testCreate() {
		BbsReplyDTO dto = new BbsReplyDTO();
		dto.setBbsid(3);
		dto.setContent("TEST");
		dto.setId("CR7");
		assertTrue(rdao.create(dto));
	}

	@Test @Ignore //완료
	public void testList() {
		Map map  = new HashMap();
		map.put("bbsid", 3);
		map.put("sno", 1);
		map.put("eno", 2);
		List<BbsReplyDTO> list = rdao.list(map);
		assertEquals(list.size(), 1);
	}

	@Test @Ignore //완료
	public void testRead() {
		BbsReplyDTO dto = rdao.read(1);
		assertNotNull(dto);
	}

	@Test @Ignore//완료
	public void testUpdate() {
		BbsReplyDTO dto = new BbsReplyDTO();
		dto.setRbbsid(2);
		dto.setContent("updste");
		assertTrue(rdao.update(dto));
	}

	@Test @Ignore//완료
	public void testDelete() {
		int rbbsid = 1;
		assertTrue(rdao.delete(rbbsid));
	}

	@Test @Ignore //완료
	public void testTotal() {
		int bbsid = 3;
		int cnt = rdao.total(bbsid);
		assertEquals(cnt, 3);
	}

}
