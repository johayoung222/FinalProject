package com.kh.spring.thing.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductIo {
	private int seqProductNo;
	private String productName;
	private int productIoPrice;
	private String productIoAuction;
	private String productIoManuFacturer;
	private int productIoAmount;
	private String productIoImage;
	private String productIoRealImage;
	private int productIoMilege;
	private String productIoDescription;
	private Date productIoDate;
	private String productKinds;
	private String categoryMicro;
	private String categoryMacro;
	private String productAdminDescription;
	
}
