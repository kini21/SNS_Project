package com.sns.check.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.UserService;

@CrossOrigin(origins="*")
@RestController
public class UserCheckController {
	
	@Autowired
	private UserService userService;
	
   @RequestMapping(value="/user/loginIdCheck.do", method = {RequestMethod.GET,RequestMethod.POST}, produces="application/json")
   public @ResponseBody Map<String, String> loginIdCheck(@RequestParam("loginid")String loginid){

       Map<String, String> map = new HashMap<String,String>();
       int r = userService.getExistUserId(loginid);

       map.put("ret", "y");
       if(r<=0){
           map.put("ret", "n");
       }
       return map;
   }
}
