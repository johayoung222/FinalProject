package com.kh.spring.basket.controller;


import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.basket.model.service.BasketService;
import com.kh.spring.basket.model.vo.Basket;

@Controller
public class BasketContoller {
	
	Logger logger = Logger.getLogger(getClass());

	@Autowired
	BasketService basketService;

	  @RequestMapping("/item/basket.do")
       public ModelAndView selectBasketList(ModelAndView mav, HttpServletRequest request) {
		  
		      int memberNo =Integer.parseInt((request.getParameter("memberNo")));
		      System.out.println("memberNo:"+memberNo);
		      
	
		      Basket b = new Basket(); 
		      b.setSeqMemberNo(memberNo);
		      
		     List<Map<String, String>> list = basketService.selectProductList(b);
		     System.out.println(list != null?"갖고오기성공":"갖고오기실패");

		   //  List<Map<String, String>> sumList= basketService.selectSumProduct(b);
		     int sum = 0;
		     
		     for(Map<String,String> map : list) {
		    	 sum += Integer.parseInt(String.valueOf(map.get("PRODUCT_PRICE")));
		     }
		     
		    
		    
		 
		      mav.addObject("sum", sum);

	          mav.addObject("list",list);
		      mav.setViewName("item/basket"); 
	          return mav;
	  }
	 
	
  
	  
    @RequestMapping("/item/insertbasket.do")
	public ModelAndView insertBasket(ModelAndView mav,@RequestParam("seqMemberNo") int seqMemberNo 
			,@RequestParam("seqProductNo") int seqProductNo ) {
    	
    	
    	    System.out.println("지금들어온 사람의  시퀀스 넘버:"+seqMemberNo);
    	    System.out.println("지금 관심 상품의 넘버:"+seqProductNo);
    	   
    	    Basket b = new Basket();
    	    b.setSeqMemberNo(seqMemberNo);
    	    b.setSeqProductNo(seqProductNo);
    	
    	    basketService.insertBasket(b);
		    mav.setViewName("redirect:/");
		    	
    	    return mav;
    }
   
            @RequestMapping("/item/deleteBasket.do")
            public ModelAndView deleteBasket(ModelAndView mav,@RequestParam("no") int no){
            	
            
            	System.out.println("삭제할 장바구니no는:"+no);
            	
            	
            	Basket b = new Basket();
            	b.setSeqBasketNo(no);
         	   
            	
         	     int result = basketService.deleteBasket(b);
         	     System.out.println(result>0?"삭제성공":"삭제실패");
         	     mav.setViewName("/item/basket"); 
				 return mav;
            	

            }
    
	 

}
