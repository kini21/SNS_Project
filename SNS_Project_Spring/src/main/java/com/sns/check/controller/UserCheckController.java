package com.sns.check.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.UserService;
import com.sns.user.UserVO;

@CrossOrigin(origins="*")
@RestController
public class UserCheckController {
	
   @Autowired
   private UserService userService;
	
   @RequestMapping(value="/user/existloginIdCheck.do", method = {RequestMethod.GET,RequestMethod.POST}, produces="application/json")
   public @ResponseBody Map<String, String> existloginIdCheck(@RequestParam("loginid")String loginid){

       Map<String, String> map = new HashMap<String,String>();
       int r = userService.getExistUserId(loginid);

       map.put("idcheck", "yes");
       if(r<=0){
           map.put("idcheck", "no");
       }
       return map;
   }
   
   @RequestMapping(value="/user/loginIdPwCheck.do", method = {RequestMethod.GET,RequestMethod.POST}, produces="application/json")
   public @ResponseBody Map<String, String> loginIdPwCheck(HttpServletRequest req){
	   
	   String loginid = req.getParameter("login_id");
	   String password = req.getParameter("pass_word");
	   
	   UserVO vo = new UserVO();
	   vo.setLoginid(loginid);
	   vo.setPassword(password);
	   
       UserVO user = userService.getUser(vo);
       
       Map<String, String> map = new HashMap<>();
       map.put("idpwcheck", "yes");
       if(user != null){
           map.put("idpwcheck", "no");
       }
       return map;
   }
   
   @RequestMapping(value="/user/loginEmailCheck.do", method = {RequestMethod.GET,RequestMethod.POST}, produces="application/json")
   public @ResponseBody Map<String, String> loginEmailCheck(@RequestParam("email")String email){

       Map<String, String> map = new HashMap<String,String>();
       int r = userService.getExistUserEmail(email);

       map.put("emailcheck", "yes");
       if(r<=0){
           map.put("emailcheck", "no");
       }
       return map;
   }
}
