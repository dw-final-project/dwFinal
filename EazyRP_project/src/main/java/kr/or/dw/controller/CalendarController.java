package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.CalendarService;
import kr.or.dw.vo.CalendarVO;

//일정보기
@Controller
@RequestMapping("/erp4")
public class CalendarController {

	@Autowired
	private CalendarService calendarService;

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView getCalendarList(ModelAndView mnv, HttpServletRequest request) {
			
			System.out.println("컨트롤러 진입");
			String url = "process/calendar.open";
			
			List<CalendarVO> calendarList = null;
			try {
				calendarList = calendarService.getCalendar();
				request.setAttribute("calendarList", calendarList);
				mnv.setViewName(url);
				System.out.println("1" + calendarList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("2" + calendarList);
			return mnv;
		}
	}