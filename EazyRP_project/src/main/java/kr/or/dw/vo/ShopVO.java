package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ShopVO {
	private String s_no;
	private String s_name;
	
	public ShopVO() {}
	
	public ShopVO(String s_no, String s_name) {
		super();
		this.s_no = s_no;
		this.s_name = s_name;
	}
	
	
}
