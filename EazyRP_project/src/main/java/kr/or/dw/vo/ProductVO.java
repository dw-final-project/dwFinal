package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private String pr_no;
	private String pr_name;
	private String c_no;
	private String pr_gr;
	private String pr_st;
	private int pr_inprice;
	private int pr_exprice;
	private String pr_class;
	private String img;
	private Date exdate;
	private String sp_no;
	private int quantity;
	private String wh_no;
	private String c_name;

	public ProductVO() {};
	
	public ProductVO(String pr_no, String pr_name, String c_no, String pr_gr, String pr_st, int pr_inprice,
			int pr_exprice, String pr_class, String img, Date exdate, String sp_no, int quantity, String wh_no) {
		this.pr_no = pr_no;
		this.pr_name = pr_name;
		this.c_no = c_no;
		this.pr_gr = pr_gr;
		this.pr_st = pr_st;
		this.pr_inprice = pr_inprice;
		this.pr_exprice = pr_exprice;
		this.pr_class = pr_class;
		this.img = img;
		this.exdate = exdate;
		this.sp_no = sp_no;
		this.quantity = quantity;
		this.wh_no = wh_no;
	}
}
