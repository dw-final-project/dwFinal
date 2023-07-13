package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.CalendarVO;

public interface CalendarService {
	
	List<CalendarVO> getCalendar() throws SQLException;
	
}
