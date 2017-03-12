package spring.model.faq;

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


public class FaqDAOTest {
	
	private static BeanFactory beans;
	private static FaqDAO fdao;

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
		fdao = (FaqDAO) beans.getBean("fdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCreate() {
		FaqDTO dto = new FaqDTO();
		dto.setTitle("JUnit Title Test");
		dto.setContent("JUnit Content Test");
		
		try {
			assertTrue(fdao.create(dto));
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
		
		List<FaqDTO> list = fdao.list(map);
		
		assertEquals(list.size(), 5);		
	}

	@Test @Ignore
	public void testRead() throws Exception {
		Object dto = fdao.read(5);
		
		assertNotNull(dto);	
	}

	@Test
	public void testUpdate() {
		FaqDTO dto = new FaqDTO();
		dto.setFaqid(2);
		dto.setTitle("JUnit4 제목변경");
		dto.setContent("JUnit4 내용변경");
		
		try {
			assertTrue(fdao.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testDelete() {
		int faqid = 5;
		
		try {
			assertTrue(fdao.delete(faqid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

}
