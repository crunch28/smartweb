package org.smartweb.day6;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("SELECT now() FROM dual")
	public String getTime();
	
	public String getTime1();
}
