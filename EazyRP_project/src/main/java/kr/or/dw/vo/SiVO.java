package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SiVO {
	
	private String si_no;
	private Date sys_regdate;
	private int emp_no;
	private Date shipdate;
	private String progress;
	private String enabled;
	private String wh_no;
	private int quantity;
	private String files;
	private String fc_no;
	private String sys_up;
	private Date sys_updatedate;
	
	
	public SiVO(String si_no, Date sys_regdate, int emp_no, Date shipdate, String progress, String enabled,
			String wh_no, int quantity, String files, String fc_no, String sys_up, Date sys_updatedate) {
		super();
		this.si_no = si_no;
		this.sys_regdate = sys_regdate;
		this.emp_no = emp_no;
		this.shipdate = shipdate;
		this.progress = progress;
		this.enabled = enabled;
		this.wh_no = wh_no;
		this.quantity = quantity;
		this.files = files;
		this.fc_no = fc_no;
		this.sys_up = sys_up;
		this.sys_updatedate = sys_updatedate;
	}
	
	
}
