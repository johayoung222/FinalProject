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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.service.ThingService;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.Order;
import com.kh.spring.thing.model.vo.Product;

@Controller
public class AuctionController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	ThingService thingService;
	
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
		auc.setSeqMemberNo(m.getSeqMemberNo());
		auc.setAuctionPhone(m.getMemberPhone());
		String auctionTitle = auc.getAuctionTitle();
		// auc.setAuctionTitle(new String(auctionTitle.getBytes("8859_1"),"utf-8"));
		auc.setAuctionTitle(auctionTitle);
		
		String auctionDetail = auc.getAuctiondetail();
		// auc.setAuctiondetail(new String(auctionDetail.getBytes("8859_1"),"utf-8"));
		auc.setAuctiondetail(auctionDetail);
				
		MultipartFile file;
		String filePath = "";
		int cnt = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();

		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");

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

				filename += addTime + file.getOriginalFilename() + "/";		
			}
		}

		String[] filelist = filename.split("/");		
		
		for(int i=0;i<filelist.length;i++){
			if(i==0){
				// auc.setAuctionImageMain(new String(filelist[i].getBytes("8859_1"),"utf-8"));
				auc.setAuctionImageMain(filelist[i]);
			}else if(i==1){
				// auc.setAuctionImageSub1(new String(filelist[i].getBytes("8859_1"),"utf-8"));
				auc.setAuctionImageSub1(filelist[i]);
			}else if(i==2){
				// auc.setAuctionImageSub2(new String(filelist[i].getBytes("8859_1"),"utf-8"));
				auc.setAuctionImageSub2(filelist[i]);
			}else{
				// auc.setAuctionImageSub3(new String(filelist[i].getBytes("8859_1"),"utf-8"));
				auc.setAuctionImageSub3(filelist[i]);
			}
		}
		
		String[] dr = auc.getDateRange().split(" ~ ");

		try {
			SimpleDateFormat org_frm = new SimpleDateFormat("yyyy-MM-dd HH:mm a", Locale.US);
			SimpleDateFormat new_frm = new SimpleDateFormat("yyyy-MM-dd HH:mm");

			System.out.println(dr[1]);

			Date std = org_frm.parse(dr[0]);
			Date end = org_frm.parse(dr[1]);

			System.out.println(dr[0]);

			String new_std = new_frm.format(std);
			String new_end = new_frm.format(end);

			
			// 테스트를 하기위한 시간설정이 필요하다.
			auc.setSdate(new_std);
			auc.setEdate(new_end);
			System.out.println("std = "+new_std+"  end = "+new_end);
			// 지금 테스트를 하기위해 설정을 해보도록 하겠다. 
			
			

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
	
	@RequestMapping("/auctionDetail.do")
	public String auctionDetail(Model model , HttpSession session , @RequestParam(value="auctionNo") int auctionNo) {
		System.out.println("auctionNo = "+auctionNo);
		List<Map<String,String>> auction = auctionService.selectAuction(auctionNo);
		String ctgMacroName = auctionService.selectCtgMacroName(auction.get(0).get("AUCTION_CATEGORY_MACRO"));
		
		String auctionCtgMicro = auction.get(0).get("AUCTION_CATEGORY_MICRO");
		
		if(auctionCtgMicro.length() == 1) {
			auctionCtgMicro = "0"+auctionCtgMicro;
		}
		
		Map<String , Object> ctg = new HashMap<>();
		ctg.put("MICRO", auctionCtgMicro);
		ctg.put("MACRO", auction.get(0).get("AUCTION_CATEGORY_MACRO"));
		
		String ctgMicroName = auctionService.selectCtgMicroName(ctg);
		
		System.out.println("ctgMacroName = "+ctgMacroName+"/ ctgMicroName = "+ctgMicroName);
		
		// 현재 입찰가를 뿌려주기위하여 DB다녀와야 한다.
		Map<String , Object> history = auctionService.selectAuctionHistory(String.valueOf(auction.get(0).get("AUCTION_NO")));
		System.out.println("history = "+history);
		
		// 본인이 현재 입찰중인가에 대해 뿌려주기 위하여 DB다녀와야 한다.
		Map<String , Object> temp = new HashMap<>();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		Map<String , String> myHistory = new HashMap<>();
		
		if(m != null) {
			temp.put("MemberNo" , m.getSeqMemberNo());
			temp.put("AuctionNo" , auction.get(0).get("AUCTION_NO"));
			
			myHistory = auctionService.selectMyHistory(temp);			
			System.out.println("myHistory = "+myHistory);
		}

		Map<String , String> bidCheck = new HashMap<>();
		if(m != null) {
			if(myHistory != null) {
				// 현재 그 글에대해서 입찰 중인데 그가격이 최대라면 입찰 하지 못하게 끔 하는 쿼리
				bidCheck.put("check" , "N");
				if(String.valueOf(myHistory.get("MEMBER_NO")).equals(String.valueOf(m.getSeqMemberNo()))) {
					bidCheck.put("check" , "Y");
					System.out.println("니가 최대 입찰자야");
				}				
			}
		}
		
		model.addAttribute("bidCheck" , bidCheck);
		model.addAttribute("myHistory" , myHistory);
		model.addAttribute("history" , history);
		model.addAttribute("ctgMacroName" , ctgMacroName);
		model.addAttribute("ctgMicroName" , ctgMicroName);
		model.addAttribute("auction" , auction);
		return "auction/auctionDetail";
	}
	
	@RequestMapping (value = "/auctionHistoryInsert")
	@ResponseBody public Map<String, Object> auctionHistoryInsert(@RequestParam(value="MemberNo" , required=false) int MemberNo ,
																@RequestParam(value="auctionUnq") int AuctionNo ,
																@RequestParam(value="bidPrice") int price  , 
																HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<>();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		if(m != null) {
			map.put("memberId",m.getMemberId());
			map.put("memberNo",m.getSeqMemberNo());
			map.put("price",price);
			map.put("AuctionNo",AuctionNo);
		}
		
		try {
			int r = auctionService.auctionHistoryInsert(map);
			result.put("Result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("Result", "fail");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/auctionBid.do")
	@ResponseBody
	public Map<String, Object> auctionBid(@RequestParam(value="auctionNo" , required=false) int auctionNo , 
			HttpServletResponse response, Model model, HttpServletRequest request,HttpSession session ) {
		Map<String, Object> map = new HashMap<String, Object>();	// 결과 값 넘길 맵
		
		System.out.println("여기 안오죠????????????????????????");
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		Map<String , Object> temp = new HashMap<>();
		temp.put("auctionNo", auctionNo);
		temp.put("memberId", m.getMemberId());
		temp.put("memberNo", m.getSeqMemberNo());
		
		Map<String , String > resultMap = auctionService.selectAuctionBid(temp);
		// auction_history 테이블에서 auction_no 로 조회한 가격이 가장큰행을 뽑았다.
		// 그 행의 seqMemberNo와 로그인한 회원의 memberNo를 비교하고 맞으면 true값을 넘겨준다.
		if(resultMap != null) {
			String memberNo = resultMap.get("MEMBER_ID");
			
			if(m.getMemberId().equals(memberNo)) {
				
				if(resultMap.get("WINNING_BID").equals("Y")) {
					map.put("cnt" , 2);
				} else {
					map.put("cnt" , 1);					
				}
			}
		} else {
			map.put("cnt" , 0);
		}

		return map;
	}
	
	@RequestMapping(value="/auction/auctionPerchase/{auctionNo}", method=RequestMethod.GET)
	public ModelAndView movePerchase(@PathVariable("auctionNo") int auctionNo,
							ModelAndView mav,HttpSession session) {
		
		Member m = (Member) session.getAttribute("memberLoggedIn");
		
		// 넘겨줄 값이 시퀀스 번호 , 이름 , 가격
		Map<String , Object > auction = auctionService.selectAuctionHistory(String.valueOf(auctionNo));
		
		String auctionTitle = auctionService.selectAuctionTitle(auctionNo);
		
		Map<String , String> result = new HashMap<>();
		String mainImg = auctionService.selectMainImg(auctionNo);
		result.put("auctionNo", String.valueOf(auctionNo));
		result.put("auctionTitle", auctionTitle);
		result.put("auctionPrice", String.valueOf(auction.get("PRICE")));
		result.put("auctionMainImg", mainImg);
		
		mav.addObject("member", m);
		mav.addObject("auction",result);
		mav.setViewName("auction/auctionPerchase");
		
		return mav;
	}
	
	
	 	@RequestMapping(value="/auction/perchase/complete")
	public ModelAndView paymentComplete(ModelAndView mav, @RequestBody Order order , HttpSession session) {
		
		int nProductNo = order.getSeqProductNo(); 
		int auctionPrice = order.getOrderPrice();
		Member m = (Member)session.getAttribute("memberLoggedIn");
		String coupon = order.getOrderCoupon();
		Map<String , Object> temp = new HashMap<>();
		temp.put("nProductNo" , nProductNo);
		temp.put("auctionPrice" , auctionPrice);
		int couponL = 0;
		if("0.05".equals(coupon)) {
			couponL = 1;
		}else if("0.1".equals(coupon)) {
			couponL = 2;
		}else if("0.15".equals(coupon)) {
			couponL = 3;
		}
		
		thingService.insertOrder(order);
		// 결제 되었을시에 
		// auction 테이블의 auction_check컬럼의 값을 Y로 바꾼다.
		// auction_history테이블의 winning_bid컬럼의 값을 Y로 바꾼다.
		
		// thingService.updateOnSale(nProductNo);

		Map<String , Object> temp1 = new HashMap<>();
		temp1.put("memberNo", m.getSeqMemberNo());
		temp1.put("auctionNo", nProductNo);
		temp1.put("couponL", couponL);
		auctionService.updateAuctionCheck(nProductNo);
		auctionService.updateWinningBid(temp);
		auctionService.updateBuyerNo(temp1);
		
		mav.addObject("order", order);
		mav.setViewName("redirect:/auctionDetail.do?auctionNo="+nProductNo);
		
		return mav;
	}
	 	
	@RequestMapping("/auction/brandNew")
	public ModelAndView brandNew(ModelAndView mav , HttpSession session) {
		


		Member m = (Member) session.getAttribute("memberLoggedIn");
		
		List<Map<String,String>> auctionList = auctionService.selectAuctionList();
		System.out.println("경매물품리스트"+auctionList);
		List<Map<String , String>> list = auctionService.selectAuctionAllList();
		String auctionNo = "";
		Map<String , Object> temp = new HashMap<>();
		Map<String , String > result = new HashMap<>();
		Map<String , String > resultTemp = new HashMap<>();
		Map<String , String > resultPrice = new HashMap<>();
		
		int auctionCount = auctionService.auctionCount();
		
		if(m != null) {
			String memberId = m.getMemberId();
			// index에 내가 그 경매 상품에 입찰을 진행중인지 뛰우기 위한 소스코드 작성
			// 글번호와 현재 session아이디를 가져가서 조회해서 그 값이 있으면 입찰중이다.
			// 그리고 최근 것이 1번으로 되는거임 for문안에서
			for(int i = 1;i <= auctionCount;i++) {
				auctionNo = String.valueOf(list.get(i-1).get("AUCTION_NO"));
				temp.put("memberId" , memberId);
				temp.put("auctionNo" , auctionNo);
				List<Map<String,String>> checkList = auctionService.checkHistory(temp);

				
				
				
				if(checkList.size() == 0) {
					result.put(String.valueOf("check"+i), "N");
				} else {
					result.put(String.valueOf("check"+i), "Y");
				}
				
			}	
		} else {
			for(int i = 1;i <= auctionCount;i++) {
				result.put(String.valueOf("check"+i), "F");
			}
		}
		
		for(int i = 1;i <= auctionCount;i++) {
			resultPrice.put("bidCheck"+i, "Y");
			auctionNo = String.valueOf(list.get(i-1).get("AUCTION_NO"));
			temp.put("auctionNo" , auctionNo);
			resultTemp = auctionService.selectAuctionBid(temp);
			String price = "";
			if(resultTemp == null) {
				price = String.valueOf(list.get(i-1).get("AUCTION_PRICE"));
				resultPrice.put("bidCheck"+i, "N");
			} else {
				price = String.valueOf(resultTemp.get("PRICE"));
			}
			
			System.out.println("priceeeeeeeeeee"+price);
			resultPrice.put(String.valueOf("Price"+i), price);
		}
		
		

		
		String brandNew = "Y";

		mav.addObject("resultPrice" , resultPrice);
		mav.addObject("result" , result);
		mav.addObject("auctionList" , list);
		
		
		
		mav.addObject("brandNew", brandNew);
		mav.setViewName("auction/auctionItem");
		
		return mav;
	} 	
	 
	
}
