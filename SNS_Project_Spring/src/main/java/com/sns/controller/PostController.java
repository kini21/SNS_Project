package com.sns.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sns.service.PostService;

@Controller
@RequestMapping("post")
public class PostController {
	
	@Autowired
	private PostService service;
	
	@RequestMapping(value="writePost.html", method=RequestMethod.POST)
	public ModelAndView writePost(MultipartHttpServletRequest req, HttpServletResponse res) {
		
//		1. post table value insert.
		Map postMap = new HashMap();
		postMap.put("contents", req.getParameter("status"));
		postMap.put("user_uid", 1);
		postMap.put("pid", 1);
		
		int rc = service.postInsert(postMap);
		
//		2. post list select.
		List<Map<String, Object>> postList = service.postList();
		
//		3. file value insert.
		int frc = service.postFileInsert(req, postList.get(postList.size()-1).get("pid").toString());
		
//		4. result message.
		Map message = new HashMap();
		if(rc > 0) {
			message.put("success", true);
		}
		
		return new ModelAndView("jsonView", message);
	}

}
