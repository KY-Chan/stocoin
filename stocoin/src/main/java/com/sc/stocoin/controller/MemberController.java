package com.sc.stocoin.controller;

import java.io.IOException;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.stocoin.model.Member;
import com.sc.stocoin.service.MemberService;

@Controller
public class MemberController{
    @Autowired
    private MemberService ms;
    
    private String url;
    
    @RequestMapping("login2")
    @ResponseBody
    public String login2(String curUrl) {
    	this.url = curUrl;
    	return curUrl;
    }
    
    @RequestMapping("login")
    public String login(@RequestParam(value = "code", required = false) String code, HttpSession session, Model model) throws Exception{
    	// 사용자 토큰, 정보 가져오기
    	String access_Token = ms.getAccessToken(code);
    	HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
    	// 아이디 설정
    	String id = (String) userInfo.get("id");
    	// 닉네임 설정
    	String nick = (String) userInfo.get("nick");
    	// 회원가입 유무 판별
    	Member member = ms.select(id);
    	int mno = -1;
    	if (member == null) { // 처음 회원 가입 일 때
    		ms.insert(userInfo);
    	} else {
    		if (member.getDel().equals("y")) { // 두 번째(이상) 회원 가입 일 때
    			ms.updateDel(userInfo);
    		}
    		mno = member.getMno();
    	} 
    	
    	session.setAttribute("mno", mno);
    	session.setAttribute("id", id);
    	session.setAttribute("access_Token", access_Token);
    	session.setAttribute("nick", nick);

    	// 이전 주소 가져오기
    	String prevUrl = url;
    	model.addAttribute("prevUrl", prevUrl);
    	
        return "member/login";
    }
    
    @RequestMapping("delete")
    public String logout(HttpSession session) throws IOException {
    	String access_Token = (String) session.getAttribute("access_Token");
    	String id = (String) session.getAttribute("id");
        ms.delete(access_Token, id);
        session.invalidate();
        return "member/delete";
    }
    
    @RequestMapping("logout")
    public String delete(HttpSession session) {
    	session.invalidate();
        return "member/logout";
    }
    
    @RequestMapping("/member/updateForm")
    public String updateForm(HttpSession session, Model model) {
    	String id = (String) session.getAttribute("id");
    	Member member = ms.select(id);
    	model.addAttribute("member", member);
    	return "member/updateForm";
    }

    @RequestMapping("/member/update")
    public String update(Member member, Model model) {
    	int result = ms.update(member);
    	model.addAttribute("result", result);
    	return "member/update";
    }
}