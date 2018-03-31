package com.sns.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sns.follow.FollowService;
import com.sns.follow.FollowVO;
import com.sns.post.PostService;
import com.sns.post.PostVO;
import com.sns.post.file.PostFileService;
import com.sns.post.file.PostFileVO;
import com.sns.reply.ReplyService;
import com.sns.reply.ReplyVO;
import com.sns.reply.file.ReplyFileService;
import com.sns.reply.file.ReplyFileVO;
import com.sns.user.UserService;
import com.sns.user.UserVO;

@Controller
@RequestMapping("post")
public class PostController {
	
	@Autowired private UserService userService;
	@Autowired private PostService postService;
	@Autowired private PostFileService postfileService;
	@Autowired private FollowService followService;
	@Autowired private ReplyService replyService;
	@Autowired private ReplyFileService replyfileService;
	
//	timeline view.(댓글 보이도록 해야됨.)
	@RequestMapping(value="mainContent.do")
	public String mainContent(UserVO vo, Model model, HttpSession session) {
		System.out.println(vo.toString());
		List postInfoList = new ArrayList();	// view로 전달할 데이터를 저장하는 변수.

//		session을 이용해 현재 사용자의 정보를 가져온다.
		UserVO sessionInfo = (UserVO) session.getAttribute("user");
		UserVO user = null;
		List<UserVO> userList = new ArrayList<UserVO>();
		
		if(vo.getUid() == 0 || sessionInfo.getUid() == vo.getUid()) {
			
//			현재 로그인 된 사용자의 정보를 가져온다.
			user = userService.getUser(sessionInfo);
			userList.add(user);
			
//			현재 사용자가 팔로우한 다른 사용자들의 정보를 가져온다.
			FollowVO followVO = new FollowVO();
			followVO.setFrom_uid(user.getUid());
			List<UserVO> followList = followService.getFollowList(followVO);
			
			for(UserVO follow : followList) {
				userList.add(follow);
			}
			
		} else {
			
//			팔로우 된 사용자의 정보를 가져온다.
			user = userService.getUser(vo);
			userList.add(user);
		}
		
		for(int i=0; i<userList.size(); i++) {
			
//		사용자의 포스트 게시판을 가져온다.
			PostVO selectpost = new PostVO();
			selectpost.setUser_uid(userList.get(i).getUid());
			
			List<PostVO> postList = postService.getUserPostList(selectpost);
			System.out.println("postList("+i+") >> "+postList.toString());
			for(int j=0; j<postList.size(); j++) {
				
				Map postInfo = new HashMap();	// postInfoList에 값을 순차적으로 저장하기 위한 변수 선언.
				
//			사용자 정보 중 view에 출력하기 위한 정보 저장.
				postInfo.put("nick", userList.get(i).getNick());	// 닉네임.
				postInfo.put("loginid", userList.get(i).getLoginid());		// ID.
				
//			포스트 게시판을 출력하기 위해 필요한 정보 저장.
				postInfo.put("pid", postList.get(j).getPid());			// post ID
				postInfo.put("contents", postList.get(j).getContents());	// 본문
				
//			날짜를 양식에 맞춰서 저장한다.
				String pdate = postList.get(j).getPdate();
				String[] datetime = pdate.split("\\s+");
				String[] date = datetime[0].split("-");
				String[] time = datetime[1].split(":");
				String ampm = (Integer.parseInt(time[0]) >= 12 && Integer.parseInt(time[0]) < 24) ?  "오후 " : "오전 ";
				String hour = null;
				if(Integer.parseInt(time[0]) > 12 && Integer.parseInt(time[0]) < 24) {
					hour = Integer.toString(Integer.parseInt(time[0])-12);
				} else if(Integer.parseInt(time[0]) == 24) {
					hour = "0";
				} else {
					hour = time[0];
				}
				
				postInfo.put("condition", pdate);
				postInfo.put("datetime",  ampm + hour + ":" + time[1] + " - " + date[0] + "년 " + date[1] + "월 " + date[2] + "일"); // tooltipe에 저장되는 날짜 정보.
				postInfo.put("date", date[1] + "월 " + date[2] + "일"); // view에 출력되는 날짜 정보.
				
//			게시글에 해당되는 파일을 가져온다.
				PostFileVO selectfile = new PostFileVO();
				selectfile.setPid(postList.get(j).getPid());
				
				List<PostFileVO> postFile = postfileService.getPostFile(selectfile);
				
//			view에서 보여질 이미지(메인/첫번째/세부)를 저장한다.
				List mainImage = new ArrayList();
				List firstImage = new ArrayList();
				List detailImage = new ArrayList();
				
				for(int k=0; k<postFile.size(); k++) {
					String image_path = File.separator + "common" + File.separator + "post" + File.separator + postFile.get(k).getFile_name() + "." + postFile.get(k).getFile_type();
					Map image = new HashMap();
					image.put("image", image_path);
					if(k==0) {
						mainImage.add(image);
						firstImage.add(image);
					} else if(k < 4) {
						mainImage.add(image);
						detailImage.add(image);
					} else {
						detailImage.add(image);
					}
					
				}
				postInfo.put("mainImage", mainImage);
				postInfo.put("firstImage", firstImage);
				postInfo.put("detailImage", detailImage);
				
//				댓글에 대한 정보를 가져온다.
				ReplyVO replyvo = new ReplyVO();
				replyvo.setPost_pid(postList.get(j).getPid());
				
				List<ReplyVO> replyList = replyService.getPostReplyList(replyvo);
				int replyCount = replyService.getReplyCount(replyvo);
				
				List replyInfo = new ArrayList();
				for(int k=0; k<replyList.size(); k++) {
//					닉네임을 찾아온다.
					UserVO nickvo = new UserVO();
					nickvo.setUid(replyList.get(k).getRp_user_uid());
					UserVO replyUser = userService.getUser(nickvo);
					
//					댓글의 정보를 입력한다.
					Map reply = new HashMap();
					reply.put("nick", replyUser.getNick());
					reply.put("rid", replyList.get(k).getRid());
					reply.put("post_pid", replyList.get(k).getPost_pid());
					reply.put("rp_user_uid", replyList.get(k).getRp_user_uid());
					reply.put("contents", replyList.get(k).getContents());
					reply.put("rdate", replyList.get(k).getRdate());
					
//					댓글에 입력된 이미지 정보를 가져온다.					
					ReplyFileVO replyfilevo = new ReplyFileVO();
					replyfilevo.setRid(replyList.get(k).getRid());
					
					List<ReplyFileVO> replyfileList = replyfileService.getReplyFile(replyfilevo);
					
					if(replyfileList.size() > 0) {
						String reply_image_path = File.separator + "common" + File.separator + "reply" + File.separator + replyfileList.get(0).getFile_name() + "." + replyfileList.get(0).getFile_type();
						reply.put("image", reply_image_path);
					}
					
					replyInfo.add(reply);
				}
				System.out.println("replyInfo ::: " + replyInfo.toString());
				postInfo.put("replyInfo", replyInfo);
				postInfo.put("replyCount", replyCount);
				
//			postInfo를 순차적으로 postInfoList에 저장한다.
				postInfoList.add(postInfo);
			}
		}
		
//		postInfoList를 입력시간별로 내림차순 정렬한다.
		Collections.sort(postInfoList, new Comparator<Map>() {
			@Override
			public int compare(Map m1, Map m2) {
				return m2.get("condition").toString().compareTo(m1.get("condition").toString());
			}
		});
		System.out.println(postInfoList.toString());
		
//		view로 postInfoList를 전달한다.
		model.addAttribute("postInfoList", postInfoList);
		
		return "mainContent";
	}
	
	@RequestMapping(value="writePost.do", method=RequestMethod.POST)
	public ModelAndView writePost(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) {
		
		UserVO sessionInfo = (UserVO) session.getAttribute("user");
		
//		1. post table value insert.
		PostVO post = new PostVO();
		post.setContents(req.getParameter("status"));
		post.setUser_uid(sessionInfo.getUid());
		
		postService.insertPost(post);
		
//		2. post list select.
		List<PostVO> postList = postService.getPostList();
		
//		3. file value insert.
		try {
			Iterator<String> itr = req.getFileNames();
			MultipartFile mpf = null;
			int sfilekey = 0;
			String sGroupKey = postfileService.getGroupKey();
			String sPath = 	req.getSession().getServletContext().getRealPath("/common/post/");
			
			while(itr.hasNext()) {
//		1. 파일키를 생성하고 파일의 정보를 추출한다.
			sfilekey++;
			mpf = req.getFile(itr.next());
			if(mpf.isEmpty()) continue;
            
//			2. 파일관리 테이블에 데이터를 insert한다.
			
			String type = mpf.getContentType();
			String[] file_type = type.split("/");
			
			PostFileVO file = new PostFileVO();
			file.setPid(postList.get(postList.size()-1).getPid());
			file.setGroup_key(sGroupKey);
			file.setFile_key(sfilekey);
			file.setFile_path(sPath);
			file.setFile_realname(mpf.getOriginalFilename());
			file.setFile_name(Long.toString(Calendar.getInstance().getTimeInMillis()));
			file.setFile_length(mpf.getBytes().length);
			file.setFile_type(file_type[1]);
			file.setReg_id(sessionInfo.getLoginid());
			
			postfileService.insertPostFile(file);
			
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
		
//		4. result message.
		Map message = new HashMap();
		message.put("success", true);
		
		return new ModelAndView("jsonView", message);
	}
	
//	포스트 수정 페이지 출력.
	@RequestMapping("contentUpdate.do")
	public String contentUpdate(@RequestParam int pid, Model model) {
		PostVO postvo = new PostVO();
		postvo.setPid(pid);
		
		PostVO post = postService.getPost(postvo);
		
		PostFileVO postfilevo = new PostFileVO();
		postfilevo.setPid(pid);
		List<PostFileVO> postfileList = postfileService.getPostFile(postfilevo);
		
		model.addAttribute("post", post);
		model.addAttribute("postfileList", postfileList);
		
		return "contentUpdate";
	}
	
//	게시글 수정 실행.
	@RequestMapping(value="updatePost.do", method=RequestMethod.POST)
	public ModelAndView updatePost(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) {
		UserVO sessionInfo = (UserVO) session.getAttribute("user");
		int sfilekey = 1;
		String sGroupKey = null;
		
//		포스트 된 게시글 수정.
		PostVO postvo = new PostVO();
		postvo.setPid(Integer.parseInt(req.getParameter("pid")));
		postvo.setContents(req.getParameter("status"));
		postvo.setUser_uid(sessionInfo.getUid());
		System.out.println(postvo.toString());
		postService.updatePost(postvo);
		
//		기존 이미지 중 삭제되지 않은 이미지의 파일키.
		List<Integer> old_file_key = new ArrayList<>();
		for(int i=0; req.getParameter("oldFile-"+i) != null; i++) {
			old_file_key.add(i, Integer.parseInt(req.getParameter("oldFile-"+i)));
			sfilekey = Integer.parseInt(req.getParameter("oldFile-"+i));
		}
		
//		파일키 오름차순 정렬.
		Collections.sort(old_file_key, new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				// TODO Auto-generated method stub
				return o1.compareTo(o2);
			}
		});
		System.out.println("view에서 전달받은 파일키 ::::: " + old_file_key.toString());
		
//		테이블에 저장되어 있는 이미지의 파일키.
		PostFileVO postfilevo = new PostFileVO();
		postfilevo.setPid(Integer.parseInt(req.getParameter("pid")));
		List<PostFileVO> postfileList = postfileService.getPostFile(postfilevo);
		
		List<Integer> table_file_key = new ArrayList<>();
		for(int j=0; j<postfileList.size(); j++) {
			table_file_key.add(j, postfileList.get(j).getFile_key());
			sGroupKey = postfileList.get(j).getGroup_key();
		}
		System.out.println("테이블에 저장된 파일키 ::::: " + table_file_key.toString());
		
//		테이블에서 삭제되지 말아야 할 데이터를 추출한다.
		List<Integer> toRemove = new ArrayList<>();
		for(int oldFile : old_file_key) {
			for(int tableFile : table_file_key) {
				if(Integer.toString(tableFile).equalsIgnoreCase(Integer.toString(oldFile))) {
					toRemove.add(tableFile);
				}
			}
		}
		System.out.println("테이블에서 삭제하지 말아야할 파일키 ::::: " + toRemove.toString());
		
//		테이블에서 삭제되지 말아야 할 데이터를 변수에서 삭제한다.
		table_file_key.removeAll(toRemove);
		System.out.println("테이블에서 삭제해야 할 파일키 ::::: " + table_file_key.toString());
		
//		테이블 데이터 삭제.
		for(int k=0; k<table_file_key.size(); k++) {
			PostFileVO deletevo = new PostFileVO();
			deletevo.setFile_key(table_file_key.get(k));
			
			postfileService.deletePostFile(deletevo);
		}
		
//		새로 추가되는 이미지.
		try {
			Iterator<String> itr = req.getFileNames();
			MultipartFile mpf = null;
			String sPath = 	req.getSession().getServletContext().getRealPath("/common/post/");
			if(sGroupKey == null) {
				sGroupKey = postfileService.getGroupKey();
			}
			
			while(itr.hasNext()) {
//			1. 파일키를 생성하고 파일의 정보를 추출한다.
			sfilekey++;
			mpf = req.getFile(itr.next());
			if(mpf.isEmpty()) continue;
            
//			2. 파일관리 테이블에 데이터를 insert한다.
			
			String type = mpf.getContentType();
			String[] file_type = type.split("/");
			
			PostFileVO file = new PostFileVO();
			file.setPid(Integer.parseInt(req.getParameter("pid")));
			file.setGroup_key(sGroupKey);
			file.setFile_key(sfilekey);
			file.setFile_path(sPath);
			file.setFile_realname(mpf.getOriginalFilename());
			file.setFile_name(Long.toString(Calendar.getInstance().getTimeInMillis()));
			file.setFile_length(mpf.getBytes().length);
			file.setFile_type(file_type[1]);
			file.setReg_id(sessionInfo.getLoginid());
			
			postfileService.insertPostFile(file);
			
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
	
//	타임라인에 포스트 된 정보를 삭제한다.
	@RequestMapping("postDelete.do")
	public ModelAndView postDelete(@RequestBody PostVO post) {
//		reply 테이블 조회.
		ReplyVO replyvo = new ReplyVO();
		replyvo.setPost_pid(post.getPid());
		
		List<ReplyVO> replyList = replyService.getPostReplyList(replyvo);
		
//		reply file 테이블 정보 삭제.
		for(int i=0; i<replyList.size(); i++) {
			ReplyFileVO replyfilevo = new ReplyFileVO();
			replyfilevo.setRid(replyList.get(i).getRid());
			
			replyfileService.deleteReplyFile(replyfilevo);
		}
		
//		reply 테이블 정보 삭제.
		replyService.deleteReply(replyvo);
		
//		file 테이블 정보 삭제.
		PostFileVO postfile = new PostFileVO();
		postfile.setPid(post.getPid());
		
		postfileService.deletePostFile(postfile);
		
//		post 테이블 정보 삭제.
		postService.deletePost(post);
		
		return new ModelAndView("jsonView");
	}

}
