package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderSaleVO {
	
	private String sheet_no;
	private Date sys_regdate;
	private int emp_no;
	private String fc_no;
	private int price;
	private String progress;
	private String enabled;
	private String files;
	private String ac_cd;
	private String sys_up;
	private String sys_updatedate;
	//
	private String	amount;
	private String	pr_no;
	private int	quantity;
	private int	s_no;
	private String	wh_no;
	
	
}
