package com.kh.spring.member.model.vo;

import java.io.Serializable;
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
public class Member implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int seq_member_no;
	private String memberId;
	private String password;
	private String memberName;
	private String gender;
	private String memberBirth;
	private String address;	
	private String phone;
	private String interest;
	private String alarm;
	private String milage;
	private String mailNo;
	private String email;
	private String isAdmin;
	private String seller;
	private String snsAccount;
	private String report;
	private String status;
	private Date enrollDate;
	
}
