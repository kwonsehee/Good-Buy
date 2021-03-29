package com.kh.goodbuy.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginUser", "msg"})
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	// 3_2. 일반 로그인 컨트롤러 (DB select)
	 @PostMapping("/login")// 일반 로그인 post 방식
	   public String userLogin(@ModelAttribute Member m, 
			   				   Model model) { 
//		   System.out.println("m" + m);

		   Member loginUser = mService.loginMember(m);
		   
//		   System.out.println("loginUser + " + loginUser);	   
		   
		   // 일반 로그인이까 암호화 필요 o
		   if (loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {	   
			    System.out.println("loginUser : " + loginUser);
			   
			   model.addAttribute("loginUser", loginUser);
			   return "redirect:/home";
		   } else {
			   model.addAttribute("msg", "로그인에 실패하였습니다.");
			   return "redirect:/home";
		   }
	   }
	 // 회원가입 페이지로 
	   @GetMapping("/join")
	   public String goMemberJoinView() {
		   return "member/memberJoin";
	   }
	   
	
		 //회원가입(DB insert)
		 @PostMapping("/join")
		 public String memberJoin(@ModelAttribute Member m,
				 				  Model model,
				 				  RedirectAttributes rd) {
//			 m.setAddress(town1+","+town2+","+town3);
			 
			 String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
			 m.setUser_pwd(encPwd);
			 System.out.println("회원가입 넘어온 값 : "+m);
				
			 int result = mService.insertMember(m);
			 System.out.println("회원가입 넘어온 값2 : "+result);
			 if(result>0) {
				
				 //* RedirectAttributes : Redirect시 데이터를 전달할 수 있는 객체
				 rd.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요.");
				 // redirect직전 모든 Flash 속성을 세션에 복사 -> redirect 직후 세션에서 다시 모델로 이동
				 
				 return "redirect:/home";
					
			 }else {
				 model.addAttribute("msg", "회원가입에 실패하였습니다.");
				 return "common/errorpage";
			 }
			
			
		 }
	   // 아이디/비밀번호 찾기 페이지로
	   @GetMapping("/find")
	   public String goFindIdPwdView() {
		   return "memeber/findUserInfo";
	   }
	// 2. 로그아웃 컨트롤러 (세션 만료)
	   @GetMapping("/logout")
	   public String logout(SessionStatus status) {
		   
		   status.setComplete();
		   return "redirect:/home";
	   }
}
