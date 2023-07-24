package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MerchandiseVO {
	private String sp_no;
	private String s_no;
	private String pr_no;
	private int sp_q;
	private int price;
	private String status;
	private Date startperiod;
	private Date endperiod;

	public MerchandiseVO() {}

	public MerchandiseVO(String sp_no, String s_no, String pr_no, int sp_q, int price, String status, Date startperiod,
			Date endperiod) {
		super();
		this.sp_no = sp_no;
		this.s_no = s_no;
		this.pr_no = pr_no;
		this.sp_q = sp_q;
		this.price = price;
		this.status = status;
		this.startperiod = startperiod;
		this.endperiod = endperiod;
	};
	

}
