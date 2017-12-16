package com.sns.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.service.testService;

@Controller
@RequestMapping("page")
public class PageController {
	
	@Autowired
	private testService service;
	
	@RequestMapping("index.html")
	public String index(@RequestParam Map map, Model model, HttpSession session) {	
		return "index";
	}
	
	@RequestMapping("login.html")
	public String login(Model model, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("test :: " + service.test().toString());
		return "login";
	}
}
