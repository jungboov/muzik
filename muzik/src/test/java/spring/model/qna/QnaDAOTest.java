package spring.model.qna;

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

public class QnaDAOTest {
	
	private static BeanFactory beans;
	private static QnaDAO qdao;

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
		qdao = (QnaDAO) beans.getBean("qdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCreate() {
		QnaDTO dto = new QnaDTO();
		dto.setTitle("JUnit Test 제목");
		dto.setContent("JUnit4 Test 내용");
		dto.setNickname("guest");
		
		try {
			assertTrue(qdao.create(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testList() throws Exception {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<QnaDTO> list = qdao.list(map);
		
		assertEquals(list.size(), 5);
	}

	@Test @Ignore
	public void testRead() throws Exception {
		QnaDTO dto = qdao.read(1);
		
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpdate() {
		QnaDTO dto = new QnaDTO();
		dto.setQnaid(1);
		dto.setTitle("JUnit4 제목변경");
		dto.setContent("JUnit4 내용변경");
		
		try {
			assertTrue(qdao.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testDelete() {
		int qnaid = 10;
		
		try {
			assertTrue(qdao.delete(qnaid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("title", "JUnit");
		
		try {
			assertEquals(qdao.total(map), 3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testCreateReply() throws Exception {
		QnaDTO dto = qdao.read(1);
		dto.setTitle("JUnit4 Reply Test");
		dto.setContent("JUnit4 Reply Test");
		dto.setNickname("CR7");
		
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		qdao.upAnsnum(map);
		
		assertTrue(qdao.createReply(dto));
	}

	@Test @Ignore
	public void testReadReply() throws Exception {
		QnaDTO dto = (QnaDTO) qdao.readReply(1);
		
		assertEquals(dto.getGrpno(), 1);
		assertEquals(dto.getIndent(), 0);
		assertEquals(dto.getAnsnum(), 0);
		assertEquals(dto.getTitle(), 0);
	}

}
