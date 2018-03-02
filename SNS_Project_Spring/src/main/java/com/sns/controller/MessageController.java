package com.sns.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sns.message.MessageService;
import com.sns.message.MessageVO;
import com.sns.user.UserService;
import com.sns.user.UserVO;

@Controller
@RequestMapping("message")
public class MessageController {
	
	@Autowired private MessageService messageService;
	@Autowired private UserService userService;
	
	@RequestMapping(value="receiveAndSend.do", method=RequestMethod.GET)
	public ModelAndView getReceiveMessage(MessageVO vo, ModelAndView mav){
		System.out.println("받은 메시지 & 보낸 메시지 확인");
		
		List<MessageVO> msgLists;
		
		if(vo.getFrom_uid() > 0) {
			msgLists = messageService.getSendAllMessage(vo);
		} else {	
			msgLists = messageService.getReceiveAllMessage(vo);
		}
		mav.addObject("msgLists", msgLists);
    	mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="readMsg.do", method=RequestMethod.GET)
	public ModelAndView getReadMessage(MessageVO vo, ModelAndView mav){
		System.out.println("메시지 상세페이지 이동");
		
		MessageVO readMsg = messageService.readMessage(vo);

		mav.addObject("readMsg", readMsg);
    	mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="sendMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView sendMessage(ModelAndView mav, HttpServletRequest req, HttpServletResponse res) throws Exception{
		System.out.println("메시지 상세페이지 이동");
		
		MessageVO vo = new MessageVO();
		UserVO user = new UserVO();
		
		int from_uid = Integer.parseInt(req.getParameter("from_uid"));
		String loginid = req.getParameter("loginid");
		String contents = req.getParameter("contents");
		
		user.setLoginid(loginid);
		
		if(userService.getUser(user) != null) {
			vo.setFrom_uid(from_uid); vo.setLoginid(loginid); vo.setContents(contents);
			messageService.insertMessage(vo);
		} else {
			res.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = res.getWriter();
		    out.println("<script>alert('존재하지 않는 아이디이거나 잘못 입력한 아이디입니다.');</script>");
		    out.flush();
		}
		
    	mav.setViewName("jsonView");
		
		return mav;
	}
}
