package org.smartweb.day6;

import java.util.List;

import org.smartweb.day6.domain.BoardVO;
import org.smartweb.day6.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getlist();

	public void insert(BoardVO board);

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public List<BoardVO> getListWithPaging(Criteria cri);

	public Integer insertSelectKey(BoardVO board);

	public int getTotalCount(Criteria cri);
}
