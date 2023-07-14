package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
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
		
		@RequestMapping("/add")
		public void add(CalendarVO calendar, HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {
			
			System.out.println("컨트롤러 /erp4/add 진입");
		
			calendarService.registCalendar(calendar);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
//			out.println("window.opener.location.reload();");
//			out.println("location.href='detail.do?pc_code=" + process.getPc_code() + "';");
			out.println("alert('수정 되었습니다.')");
			out.println("</script>");
		}
		
	}
