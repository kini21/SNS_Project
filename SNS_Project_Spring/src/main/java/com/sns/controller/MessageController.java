package com.sns.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sns.message.MessageService;
import com.sns.message.MessageVO;
import com.sns.user.UserService;
import com.sns.user.UserVO;
import com.sns.util.Criteria;
import com.sns.util.PageMaker;

@Controller
@RequestMapping("message")
public class MessageController {
	
	@Autowired private MessageService messageService;
	@Autowired private UserService userService;
	
	@RequestMapping(value="receiveAndSend.do", method=RequestMethod.GET)
	public ModelAndView getReceiveMessage(MessageVO vo, @RequestParam("pageNum") int pageNum, ModelAndView mav){
		System.out.println("받은 쪽지 & 보낸 쪽지 확인, 페이징 처리");
		
		List<MessageVO> msgLists;
		
		Criteria cri = new Criteria();
		cri.setPage(pageNum);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cri", cri);
		
		if(vo.getFrom_uid() > 0) {
			paramMap.put("from_uid", vo.getFrom_uid());
			msgLists = messageService.getSendAllMessage(paramMap);
		} else {
			paramMap.put("to_uid", vo.getTo_uid());
			msgLists = messageService.getReceiveAllMessage(paramMap);
		}
		
		int msgCount = messageService.getMsgCount(vo);
		pageMaker.setTotalCount(msgCount);
				
		mav.addObject("msgLists", msgLists);
		mav.addObject("pageMaker", pageMaker);
    	mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="readMsg.do", method=RequestMethod.GET)
	public ModelAndView getReadMessage(MessageVO vo, ModelAndView mav){
		System.out.println("쪽지 상세페이지 이동");
		
		MessageVO readMsg = messageService.readMessage(vo);

		mav.addObject("readMsg", readMsg);
    	mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="sendMsg.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView sendMessage(ModelAndView mav, HttpServletRequest req, HttpServletResponse res) throws Exception{
		System.out.println("쪽지 전송 기능");
		
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
	
	@RequestMapping(value="deleteMsg.do", method=RequestMethod.POST)
	public ModelAndView deleteMessage(ModelAndView mav, MessageVO vo){
		System.out.println("쪽지 삭제 기능");
		
		List<MessageVO> delLists;
		
		if(vo.getFrom_del() != null) {
			messageService.delUpdateMessage(vo);
			delLists = messageService.getDelCheck(vo);
			if(delLists != null) {
				for(MessageVO delList : delLists) {
					messageService.deleteMessage(delList);
				}
			}
		} else if(vo.getTo_del() != null) {
			messageService.delUpdateMessage(vo);
			delLists = messageService.getDelCheck(vo);
			if(delLists != null) {
				for(MessageVO delList : delLists) {
					messageService.deleteMessage(delList);
				}
			}
		}
		
		mav.setViewName("jsonView");
		
		return mav;
	}
}
