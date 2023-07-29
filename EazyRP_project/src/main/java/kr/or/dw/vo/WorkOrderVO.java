package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WorkOrderVO {
	private int wo_no;
	private Date sys_regdate;
	private int emp_no;
	private String progress;
	private String enabled;
	private String wh_no;
	private int quantity;
	private String files;
	private Date deliverydate;
	private String sys_up;
	private Date sys_updatedate;
	private String sys_reg;
	private String supplier;
}
