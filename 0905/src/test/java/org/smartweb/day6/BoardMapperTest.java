package org.smartweb.day6;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.smartweb.day6.domain.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	@Test
	public void test() {
		log.info("getlist");
//		log.info(boardMapper.getlist());

//		BoardVO board = new BoardVO();
//		board.setTitle("test");
//		board.setContent("content");
//		board.setWriter("ggg");
//
//		boardMapper.insert(board);
//		log.info(board);
//
//		BoardVO board = boardMapper.read(1L);

//		boardMapper.delete(2L);

		BoardVO board = new BoardVO();
		board.setBno(3);
		board.setTitle("수정내용");
		board.setContent("수정content");
		board.setWriter("수정ggg");

		int cnt = boardMapper.update(board);
		log.info("update :" + cnt);
	}
}
