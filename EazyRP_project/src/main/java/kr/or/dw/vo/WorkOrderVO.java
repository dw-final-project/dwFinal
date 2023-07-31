package kr.or.dw.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WorkOrderVO {
	private int wo_no;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sys_regdate;
	private int emp_no;
	private String progress;
	private String enabled;
	private String wh_no;
	private int quantity;
	private String files;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deliverydate;
	private String sys_up;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sys_updatedate;
	private String sys_reg;
	private String supplier;
	private String wo_name;
	
	private String e_name;
}
