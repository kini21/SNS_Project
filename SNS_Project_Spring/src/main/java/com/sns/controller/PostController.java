package com.sns.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sns.post.PostService;
import com.sns.post.PostVO;
import com.sns.post.file.PostFileService;
import com.sns.post.file.PostFileVO;

@Controller
@RequestMapping("post")
public class PostController {
	
	@Autowired private PostService postService;
	@Autowired private PostFileService postfileService;
	
	@RequestMapping(value="writePost.do", method=RequestMethod.POST)
	public ModelAndView writePost(MultipartHttpServletRequest req, HttpServletResponse res) {
		
//		1. post table value insert.
		PostVO post = new PostVO();
		post.setContents(req.getParameter("status"));
		post.setUser_uid(1);
		
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
			file.setReg_id("admin");
			
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

}
