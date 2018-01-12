package com.sns.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sns.user.UserService;
import com.sns.user.UserVO;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="index.do")
	public String index() {	
	 	return "index";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println("로그인 화면으로 이동");
		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {		
		UserVO user = userService.getUser(vo);
		
		if(user != null) {
			System.out.println("로그인 처리");
			session.setAttribute("user", user);
			return "index";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");
		session.invalidate();
		return "login";
	}
	
    // 회원가입 
    @RequestMapping(value="insertUser.do")
    public String insertUser(UserVO vo, Model model, HttpSession session) throws IOException {    		
    		System.out.println("회원가입 처리");
    		model.addAttribute("welcomeMsg",true);
    		userService.insertUser(vo);
    		session.setAttribute("user", userService.getUser(vo));
    		return "index";
    	}
    
 // 회원정보 수정
    @RequestMapping(value="updateUser.do")
    public String updateUser(UserVO vo, Model model, HttpSession session) throws IOException {    		
    		System.out.println("회원정보 수정 처리");
    		userService.updateUser(vo);
    		session.setAttribute("user", userService.getUser(vo));
    		return "index";
    	}
   
   @RequestMapping(value="getUserList.do", method=RequestMethod.GET) 
   public ModelAndView getUserList(@RequestParam("searchKeyword") String searchKeyword, ModelAndView mav) {
    	System.out.println("유저 목록 검색 처리");
    	    	
    	List<UserVO> vo = userService.getUserList(searchKeyword);
    	mav.addObject("userlist", vo);
    	mav.setViewName("jsonView");
    	return mav;
    }
    
}