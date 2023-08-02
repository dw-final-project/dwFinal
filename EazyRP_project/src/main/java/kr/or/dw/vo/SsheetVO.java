package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;
@Data
public class SsheetVO {
	

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
	
}
