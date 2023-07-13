package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.CalendarVO;

@Mapper
public interface CalendarDAO {
//	@Autowired
//	private SqlSession sqlSession;
//	
//	public List<CalendarVO> getCalendar() throws Exception {
//		List<CalendarVO> calendar = null;
//		calendar = sqlSession.selectList("Calendar.calendarList");
//		return calendar;
//		
//	}
	
	List<CalendarVO> getCalendar() throws SQLException;
	
}