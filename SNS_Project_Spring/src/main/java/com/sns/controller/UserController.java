package com.sns.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.repository.user.UserDAO;
import com.sns.user.UserService;
import com.sns.user.UserVO;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/*@RequestMapping("index.do")
	public String index(@RequestParam Map map, Model model, HttpSession session) {	
		return "index";
	}*/
	
	/*@RequestMapping("login.do")
	public String login(Model model, HttpServletRequest req, HttpServletResponse res) {
		return "login";
	}*/
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println("로그인 화면으로 이동");
		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(UserVO vo, UserDAO userDAO, HttpSession session) {
		System.out.println("로그인 처리");
		
		/*if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}*/
		
		UserVO user = userDAO.getUser(vo);
		if(user != null) {
			session.setAttribute("userid", user.getLoginid());
			session.setAttribute("userNick", user.getNick());
			return "index";
		} else {
			return "login";
		}
	}
	
    // 회원가입 
    @RequestMapping("insertUser.do")
    public String insertBoard(UserVO vo) throws IOException {
    	System.out.println("회원가입 처리");
        userService.insertUser(vo);
        return "index";
    }
}
