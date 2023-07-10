package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EstimateVO {
	
	private String est_no;
	private Date sys_regdate;
	private int emp_no;
	private String fc_no;
	private int amount;
	private String progress;
	private String enabled;
	private String wh_no;
	private int quantity;
	private String sys_up;
	private Date sys_updatedate;
	private String sys_reg;
	private String files;
	
	
	public EstimateVO(String est_no, Date sys_regdate, int emp_no, String fc_no, int amount, String progress,
			String enabled, String wh_no, int quantity, String sys_up, Date sys_updatedate, String sys_reg,
			String files) {
		super();
		this.est_no = est_no;
		this.sys_regdate = sys_regdate;
		this.emp_no = emp_no;
		this.fc_no = fc_no;
		this.amount = amount;
		this.progress = progress;
		this.enabled = enabled;
		this.wh_no = wh_no;
		this.quantity = quantity;
		this.sys_up = sys_up;
		this.sys_updatedate = sys_updatedate;
		this.sys_reg = sys_reg;
		this.files = files;
		
	}
	
	
}   

