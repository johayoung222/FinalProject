package com.kh.spring.auction.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.member.model.vo.Member;
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
	
	

	@RequestMapping(value = "/uploadFileSave")
	@ResponseBody
	public Map<String, Object> multipartProcess(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response, Auction auc, Model model, HttpServletRequest request,HttpSession session ) throws IllegalStateException, IOException {
		
		System.out.println("받아온 초기값 : "+auc);
		
		//사진 이름에 붙이기 위해 현재시간 가져옴
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		String addTime = dateFormat.format(calendar.getTime());
		Member m = (Member)session.getAttribute("memberLoggedIn");
		
		auc.setAuctionMember(m.getMemberId());
		auc.setSeqMemberNo(m.getSeqmemberNo());
		auc.setAuctionPhone(m.getMemberPhone());
		String auctionTitle = auc.getAuctionTitle();
		auc.setAuctionTitle(new String(auctionTitle.getBytes("8859_1"),"utf-8"));

		String auctionDetail = auc.getAuctiondetail();
		auc.setAuctiondetail(new String(auctionDetail.getBytes("8859_1"),"utf-8"));
		
		MultipartFile file;
		String filePath = "";
		int cnt = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();

		String uploadPath = request.getSession().getServletContext().getRealPath("upload");

		// 폴더의 존재 유무 및 생성

		File saveFolder = new File(uploadPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

		/*
		 * 
		 * MultipartFile 의 주요 메소드는 String getName()파라미터 이름을 구한다. String
		 * getOriginalFilename()업로드 한 파일의 실제!! 이름을 구한다. boolean isEmpty()업로드 한
		 * 파일이 존재하지 않는 경우 true를 리턴 한다. long getSize()업로드한 파일의 크기를 구한다. byte[]
		 * getBytes() throws IOException업로드 한 파일 데이터를 구한다. --> 이걸로 파일 쓰면된다.
		 * InputStream getInputStream()InputStrem을 구한다. void transferTo(File
		 * dest)업로드 한 파일 데이터를 지정한 파일에 저장한다. --> 요고도 파일쓰는거다.
		 */

		String filename = "";

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				filePath = uploadPath + "/" + addTime + file.getOriginalFilename();
				file.transferTo(new File(filePath));

				filename += addTime + file.getOriginalFilename() + "／";		
			}
		}

		String[] filelist = filename.split("／");		
		
		for(int i=0;i<filelist.length;i++){
			if(i==0){
				auc.setAuctionImageMain(new String(filelist[i].getBytes("8859_1"),"utf-8"));
			}else if(i==1){
				auc.setAuctionImageSub1(new String(filelist[i].getBytes("8859_1"),"utf-8"));
			}else if(i==2){
				auc.setAuctionImageSub2(new String(filelist[i].getBytes("8859_1"),"utf-8"));
			}else{
				auc.setAuctionImageSub3(new String(filelist[i].getBytes("8859_1"),"utf-8"));
			}
		}
		
		String[] dr = auc.getDateRange().split(" ~ ");

		try {
			SimpleDateFormat org_frm = new SimpleDateFormat("yyyy-MM-dd H:mm a", Locale.US);
			SimpleDateFormat new_frm = new SimpleDateFormat("yyyy-MM-dd H:mm");

			System.out.println(dr[1]);

			Date std = org_frm.parse(dr[0]);
			Date end = org_frm.parse(dr[1]);

			System.out.println(dr[0]);

			String new_std = new_frm.format(std);
			String new_end = new_frm.format(end);

			auc.setSdate(new_std);
			auc.setEdate(new_end);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		int result = 0;
		System.out.println("인코딩설정 및 가져온 auc : "+auc);
		
		try {
			result = auctionService.insertAuctionRegist(auc);

		} catch (Exception e) {
			map.put("cnt", 0);
			e.printStackTrace();
			System.out.println("익셉션에 걸립니까?");
			return map;
		}
		
		
		if (result > 0) {
			cnt = cnt + 1;
		}
		

		map.put("cnt", cnt);
		
		System.out.println("제대로 리턴을 시킵니까?");
		return map;
	}

}
