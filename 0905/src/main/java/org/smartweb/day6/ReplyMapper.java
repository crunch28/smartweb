package org.smartweb.day6;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.smartweb.day6.domain.Criteria;
import org.smartweb.day6.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);

	public ReplyVO read(Long rno);

	public int delete(Long rno);

	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("cri")Criteria cri, @Param("bno")Long bno);
}
