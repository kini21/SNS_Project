package com.sns.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sns.follow.FollowService;
import com.sns.follow.FollowVO;
import com.sns.user.UserService;
import com.sns.user.UserVO;

@Controller
@RequestMapping("follow")
public class FollowController {
	   
	   @Autowired private FollowService followService;	   
	   @Autowired private UserService userService;

		
	   @RequestMapping(value="insertFollow.do", method = RequestMethod.POST)
	   public ModelAndView insertFollow(FollowVO vo, ModelAndView mav){
		   System.out.println("팔로우 기능 처리");
	       
	       followService.insertFollow(vo);
	       mav.setViewName("jsonview");
	       return mav;
	   }
	   
	   @RequestMapping(value="deleteFollow.do", method = RequestMethod.POST)
	   public ModelAndView deleteFollow(FollowVO vo, ModelAndView mav){
		   System.out.println("팔로우 삭제 기능 처리");
	       
	       followService.deleteFollow(vo);
	       mav.setViewName("jsonview");
	       return mav;
	   }
	   
	   @RequestMapping(value="getOtherUser.do")
	   public String getOtherUser(UserVO vo, Model model, HttpSession session) {
			System.out.println("다른 유저 조회와 팔로우 여부 조회처리");
	        model.addAttribute("otherUser", userService.getUser(vo));
	        
	        FollowVO fvo = new FollowVO();
			UserVO from_uid = (UserVO) session.getAttribute("user");
						
			fvo.setFrom_uid(from_uid.getUid());
			fvo.setTo_uid(vo.getUid());
		    int r = followService.checkFollow(fvo);
		       
		    if(r==1){
		    	model.addAttribute("checkFollow",true);
		    }
		    
		    int temp = fvo.getTo_uid();
		    fvo.setFrom_uid(temp);
		    
		    model.addAttribute("otherFollow", followService.countFollow(fvo));
			
		 	return "index";
		}
	 
	   @RequestMapping(value="getFollowList.do", method=RequestMethod.GET) 
	   public ModelAndView getUserList(ModelAndView mav, HttpServletRequest req) {
	    	System.out.println("유저 목록 검색 처리");
	    	
	    	int from_uid = Integer.parseInt(req.getParameter("from_uid"));
	    	FollowVO vo = new FollowVO();
	    	vo.setFrom_uid(from_uid);
	    	
	    	List<UserVO> user = followService.getFollowList(vo);
	    	mav.addObject("followlist", user);
	    	mav.setViewName("jsonView");
	    	return mav;
	    }
}
