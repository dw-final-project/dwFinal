package kr.or.dw.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EstimateVO {
	
	private String est_no;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sys_regdate;
	private int emp_no;
	private String fc_no;
	private int amount;
	private String progress;
	private String enabled;
	private String wh_no;
	private int quantity;
	private String sys_up;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sys_updatedate;
	private String sys_reg;
	private String files;
	private String fileName;
	
	
	
	
	
}   

