package com.sns.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sns.reply.ReplyService;
import com.sns.reply.ReplyVO;
import com.sns.reply.file.ReplyFileService;
import com.sns.reply.file.ReplyFileVO;
import com.sns.user.UserVO;

@Controller
@RequestMapping("reply")
public class ReplyController {

	@Autowired private ReplyService replyService;
	@Autowired private ReplyFileService replyfileService;
	
	
	@RequestMapping("writeReply")
	public ModelAndView writeReply(MultipartHttpServletRequest req, HttpServletRequest res, HttpSession session) {
		
//		세션에서 현재 사용자 정보를 가져온다.
		UserVO sessionInfo = (UserVO) session.getAttribute("user");
		
//		사용자가 작성한 댓글을 테이블에 저장한다.
		ReplyVO replyvo = new ReplyVO();
		replyvo.setPost_pid(Integer.parseInt(req.getParameter("pid")));
		replyvo.setRp_user_uid(sessionInfo.getUid());
		replyvo.setContents(req.getParameter("reply_status"));
		
		replyService.insertReply(replyvo);
		
//		댓글 테이블의 정보를 조회한다.
		List<ReplyVO> replyList = replyService.getReplyList();
		
//		댓글과 함께 입력된 파일을 테이블에 저장한다.
		try {
			Iterator<String> itr = req.getFileNames();
			MultipartFile mpf = null;
			int sfilekey = 0;
			String sGroupKey = replyfileService.getGroupKey();
			String sPath = 	req.getSession().getServletContext().getRealPath("/common/reply/");
			
			while(itr.hasNext()) {
//			1. 파일키를 생성하고 파일의 정보를 추출한다.
			sfilekey++;
			mpf = req.getFile(itr.next());
			if(mpf.isEmpty()) continue;
            
//			2. 파일관리 테이블에 데이터를 insert한다.
			
			String type = mpf.getContentType();
			String[] file_type = type.split("/");
			
			ReplyFileVO file = new ReplyFileVO();
			file.setRid(replyList.get(replyList.size()-1).getRid());
			file.setGroup_key(sGroupKey);
			file.setFile_key(sfilekey);
			file.setFile_path(sPath);
			file.setFile_realname(mpf.getOriginalFilename());
			file.setFile_name(Long.toString(Calendar.getInstance().getTimeInMillis()));
			file.setFile_length(mpf.getBytes().length);
			file.setFile_type(file_type[1]);
			file.setReg_id(sessionInfo.getLoginid());
			
			replyfileService.insertReplyFile(file);
			
//			3. 지정된 위치가 존재하는지 확인하고 없으면 경로를 생성한다.
			File chkDir = new File(sPath);
			if(!chkDir.isDirectory()) {
				chkDir.mkdirs();
			}
            
//			4. 지정된 위치에 파일을 복사한다.
			FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(sPath + File.separator + file.getFile_name() + "." + file.getFile_type()));
			
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		Map message = new HashMap();
		message.put("success", true);
		
		return new ModelAndView("jsonView", message);
	}
	
	@RequestMapping("replyDelete.do")
	public ModelAndView replyDelete(@RequestBody ReplyVO replyvo) {
		ReplyFileVO replyfilevo = new ReplyFileVO();
		replyfilevo.setRid(replyvo.getRid());
		
		replyfileService.deleteReplyFile(replyfilevo);
		replyService.deleteReply(replyvo);
		
		Map message = new HashMap();
		message.put("success", true);
		
		return new ModelAndView("jsonView", message);
	}
}
