package com.kh.spring.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {

	public static String getPageBar(int totalContent , int cPage , int numPerPage , String pageName) {
		int totalPage = (totalContent / numPerPage) + (totalContent % numPerPage == 0 ? 0 : 1);
		
		String pageBar = "";
		int pageBarSize = 5;
				
		
		int startPage = ((cPage-1)/pageBarSize) * pageBarSize + 1;
		int endPage = startPage + pageBarSize - 1;
						
		pageBar += "<nav aria-label='Page navigation example' ><ul class='pagination justify-content-center'>";
		// 증감변수 pageNo
		int pageNo = startPage;
		// [이전] section
		if(pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class = 'page-link' href='"+pageName+"?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[이전]</a></li>";
		}
		else {
			pageBar += "<li class='page-item'><a class = 'page-link' href='"+pageName+"?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a></li>";
		}
		
		// [페이지] section
//		while(!(pageNo > pageEnd || pageNo > totalPage)) 아래와 같은 조건
		while(pageNo<=endPage && pageNo<=totalPage) {
			if(cPage==pageNo) {
				pageBar += " <li class='page-item active'><span class ='page-link' href=#>"+pageNo+"</span></li>";
			}
			else {
				pageBar += "<li class='page-item'><a class = 'page-link' href='"+pageName+"?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		// [다음] section
		if(pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class = 'page-link' href='"+pageName+"?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a></li>";
		}
		else {
			pageBar += "<li class='page-item'><a class = 'page-link' href='"+pageName+"?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a></li></ul></nav>";
		}
		
		
		return pageBar;
	}

	public static String getRenamedFileName(String fname) {
		//확장자 분리
		String ext = fname.substring(fname.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rndNum = (int)(Math.random()*1000);
		return sdf.format(new Date())+"_"+rndNum+"."+ext;
		
	}
}
