package org.smartweb.day6.service;

import java.util.List;

import org.smartweb.day6.domain.Criteria;
import org.smartweb.day6.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int modify(ReplyVO vo);

	public int remove(Long rno);

	public List<ReplyVO> getList(Criteria cri, Long bno);
}
