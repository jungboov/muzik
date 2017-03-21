package spring.model.music;

import static org.junit.Assert.*;

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

import spring.model.music.ChartDAO;

public class ChartDAOTest {
	private static BeanFactory beans;
	private static ChartDAO cdao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource=new ClassPathResource("junit/muzik.xml");
		beans=new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		cdao=(ChartDAO)beans.getBean("cdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Ignore
	public void testCreateObject() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testList() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testReadObject() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

	@Test
	public void testWeekList() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testMonthList() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testYearList() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testCheckedLike() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testUrlList() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testAddSelect() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testLatest() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testMlike() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testLikeUser() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testUpdateMlike() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testUpdateInven() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testUpdateInvenTitle() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testDeleteInven() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testReadInven() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testReadInvenTitle() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testReadString() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testReadSong() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testScroll_week() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testCreateChartDTO() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testInvenList() {
		fail("Not yet implemented");
	}

	@Ignore
	public void testUrl() {
		fail("Not yet implemented");
	}

}
