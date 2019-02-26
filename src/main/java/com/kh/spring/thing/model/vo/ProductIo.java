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
	private int productIoAmount;
	private String productBuyer;
	private String productCategory;
	private String productOrderNo;
}
