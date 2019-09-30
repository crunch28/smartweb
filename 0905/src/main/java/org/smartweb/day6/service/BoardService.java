package org.smartweb.day6.service;

import java.util.List;

import org.smartweb.day6.domain.BoardVO;
import org.smartweb.day6.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

//	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
}
