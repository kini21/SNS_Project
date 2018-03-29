package com.sns.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sns.follow.FollowService;
import com.sns.follow.FollowVO;
import com.sns.user.UserService;
import com.sns.user.UserVO;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired private UserService userService;
	@Autowired private FollowService followService;
	@Autowired private JavaMailSender mailSender;
	@Autowired BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value="index.do")
	public String index(@RequestParam(value="welcomeMsg", required=false) boolean welcomeMsg, Model model, HttpSession session) {
		model.addAttribute("welcomeMsg", welcomeMsg);
		
		UserVO user = (UserVO) session.getAttribute("user");
		FollowVO fvo = new FollowVO();
		fvo.setFrom_uid(user.getUid());
		session.setAttribute("follow", followService.countFollow(fvo));
	 	return "index";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println("로그인 화면으로 이동");
		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest req, HttpSession session) {		
		
		String loginid = req.getParameter("loginid");
		   
		UserVO vo = new UserVO();
		vo.setLoginid(loginid); 
		
		UserVO user = userService.getUser(vo);
		
		System.out.println("로그인 처리");
		session.setAttribute("user", user);
		
		return "redirect:index.do";
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");
		session.invalidate();
		return "login";
	}
	
    // 회원가입 
    @RequestMapping(value="insertUser.do")
    public String insertUser(UserVO vo, RedirectAttributes rttr /*Model model*/, HttpSession session) throws IOException {    		
    		System.out.println("회원가입 처리");
    		/*model.addAttribute("welcomeMsg",true);*/
    		rttr.addFlashAttribute("welcomeMsg", true);
    		
    		String pw = vo.getPassword();
    		String encryptPW = passwordEncoder.encode(pw);
    		
    		vo.setPassword(encryptPW);
    		
    		userService.insertUser(vo);
    		
    		UserVO user = userService.getUser(vo);
    		session.setAttribute("user", user);
    		
    		return "redirect:index.do";
    	}
    

       // 회원정보 수정
       @RequestMapping(value="updateUser.do")
       public String updateUser(UserVO vo, Model model, HttpSession session) throws IOException {    		
       		System.out.println("회원정보 수정 처리");
       		model.addAttribute("updateCompleteMsg",true);

       		userService.updateUser(vo);
       		
       		UserVO user = userService.getUser(vo);
       		session.setAttribute("user", user);
       		
       		return "index";
       }
       
    // 회원정보 수정(비밀번호)
       @RequestMapping(value="updateUserPW.do")
       public String updateUserPW(UserVO vo, Model model, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws IOException {    		
       		System.out.println("회원정보 수정(비밀번호) 처리");
       		model.addAttribute("updateCompleteMsg2",true);
       		
       		String curruntPw = req.getParameter("curruntPassword");
       		String newPw = req.getParameter("newPassword");
       		
       		UserVO chkUser = (UserVO) session.getAttribute("user");
       		
       		if(passwordEncoder.matches(curruntPw, chkUser.getPassword())) {         	    
       			String encryptPW = passwordEncoder.encode(newPw);
       			vo.setPassword(encryptPW);
       			userService.updateUser(vo);
       			
       			UserVO user = userService.getUser(vo);
           		session.setAttribute("user", user);
            } else {
            	res.setContentType("text/html; charset=UTF-8");
                PrintWriter out = res.getWriter();
                out.println("<script>alert('현재 비밀번호와 일치하지 않습니다.');</script>");
                out.flush();
            }
	
       		return "index";
       }
    
    // 회원정보 삭제  user_del 컬럼을 Y로 변경
    @RequestMapping(value="deleteUser.do")
    public String deleteUser(UserVO vo, Model model, HttpSession session) throws IOException {    		
    		System.out.println("회원정보 삭제 처리");
    		
    		userService.deleteUser(vo);
    		session.invalidate();
    		
    		model.addAttribute("userDelete",1);
    		
    		return "login";
    }
   
   @RequestMapping(value="getUserList.do", method=RequestMethod.GET) 
   public ModelAndView getUserList(@RequestParam("searchKeyword") String searchKeyword, ModelAndView mav) {
    	System.out.println("유저 목록 검색 처리");
    	    	
    	List<UserVO> vo = userService.getUserList(searchKeyword);
    	mav.addObject("userlist", vo);
    	mav.setViewName("jsonView");
    	return mav;
    }
    
	@RequestMapping(value="findidpw.do")
	public String findidpw() {	
	 	return "findidpw";
	}
	
	// mailSending 코드
   @RequestMapping(value="sendidpw.do")
   public String mailSending(UserVO vo, HttpServletResponse res) {
     
     UserVO user = userService.getFindIDPW(vo);
     
     System.out.println(user.getEmail());
     System.out.println(user.getLoginid());
     String setfrom = "bigchoong@gmail.com";         
     String tomail  = user.getEmail();     // 받는 사람 이메일
     String title   = user.getNick() + "님의 아이디와 비밀번호 입니다.";      // 제목
     String content = user.getNick() + "님의 아이디는 " 
                         + user.getLoginid()
                         + " 비밀번호는 "
                         + user.getPassword()
                         + " 입니다.";    // 내용
    
     try {
       MimeMessage message = mailSender.createMimeMessage();
       MimeMessageHelper messageHelper  = new MimeMessageHelper(message, true, "UTF-8"); //두번째 인자 true여야 파일첨부 가능.
  
       messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
       messageHelper.setTo(tomail);     // 받는사람 이메일
       messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
       messageHelper.setText(content);  // 메일 내용
      
       mailSender.send(message);
       
       res.setContentType("text/html; charset=UTF-8");
       PrintWriter out = res.getWriter();
       out.println("<script>alert('성공적으로 메일을 발송했습니다.');</script>");
       out.flush();

     } catch(Exception e){
       System.out.println(e);
     }
    
     return "login";
   }
   
}