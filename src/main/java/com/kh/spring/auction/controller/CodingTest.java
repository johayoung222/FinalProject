package com.kh.spring.auction.controller;

public class CodingTest {

	public static void main(String[] args) {
		
		int[][] base = {{1,2,3,4} ,
						{5,6,7,8} ,
						{9,10,11,12} ,
						{13,14,15,16}};

		for(int i = 0;i < base.length;i++) {
			for(int j = 0;j < base[i].length;j++) {
				System.out.print("["+base[i][j] + "]\t");
			}
			System.out.println();
		}
		
	}

}
