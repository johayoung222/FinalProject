package com.kh.spring.auction.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.thing.model.vo.CategoryMacro;

@Controller
public class AuctionController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/auctionWriter.do")
	public String auctionWriter(Model model) {
		
		List<String> ctgList = auctionService.selectctgList();
		model.addAttribute("ctgList" , ctgList);
		return "auction/auctionWriter";
	}
	
	@RequestMapping("/selectMlist")
	@ResponseBody
	public Map<String , Object> selectMlist(@RequestParam(value="ctgcode") String ctgcode ){
		List<CategoryMacro> ctgMlist = auctionService.selectctgmlist(ctgcode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("resultMList", ctgMlist);
		return map; 
	}
	
	@RequestMapping(value="/image")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("/resources/upload/auction");
		// UUID uuid = UUID.randomUUID();
		
		System.out.println(realFolder);

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		// String str_filename = uuid.toString() + org_filename;

//		System.out.println("원본 파일명 : " + org_filename);
//		System.out.println("저장할 파일명 : " + str_filename);
		
		String filepath = realFolder + "\\" + org_filename;
//		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		file.transferTo(f);
		out.println("auction/"+org_filename);
		out.close();
	}
}
