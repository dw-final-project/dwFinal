package kr.or.dw.vo;

import lombok.Data;

@Data
public class CalendarVO {
	private int calendarNo;
	private String calendarTitle;
	private String calendarMemo;
	private String calendarStart;
	private String calendarEnd;
}