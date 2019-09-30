package org.smartweb.day6;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.smartweb.day6.domain.Criteria;
import org.smartweb.day6.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	@Test
	public void test() {
		service.getList(new Criteria(1,10)).forEach(board -> log.info(board));
	//log.info(service.get(3L));
	}
}
