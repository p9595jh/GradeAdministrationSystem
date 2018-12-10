package kr.ac.hansung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String showLogin(
			@RequestParam(value="error", required=false) String error,
			@RequestParam(value="logout", required=false) String logout,
			Model model) {
		
		if ( error != null ) {
			model.addAttribute("errorMsg", "아이디 또는 비밀번호가 잘못되었습니다.");
		}
		
		if ( logout != null ) {
			model.addAttribute("logoutMsg", "성공적으로 로그아웃 되었습니다.");
		}
		
		return "login";
	}
	
}
