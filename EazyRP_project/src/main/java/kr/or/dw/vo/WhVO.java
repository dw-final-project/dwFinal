package kr.or.dw.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WhVO {
	private String wh_no;			// 생산입고코드
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sys_regdate;		// 등록일자
	private int emp_no;				// 사원번호
	private String enabled;			// 사용구분
	private String wh_no2;			// 창고코드(제품+업체)
	private int quantity;			// 수량
	private String files;			// 첨부파일
	private String outprice;		// 외주비단가
	private int wo_no;				// 작업지시서 번호
	private String sys_up;			// 수정자
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sys_updatedate;	// 수정일
	private String sys_reg;			// 최초등록자
}
