package com.kh.goodbuy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.town.model.service.TownService;
import com.kh.goodbuy.town.model.vo.Town;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "loginUser", "msg", "townInfo" })
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private TownService tService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 3_2. 일반 로그인 컨트롤러 (DB select)
	@PostMapping("/login") // 일반 로그인 post 방식
	public String userLogin(@ModelAttribute Member m, Model model) {
//		   System.out.println("m" + m);

		Member loginUser = mService.loginMember(m);
		
		// 일반 로그인이까 암호화 필요 o
		if (loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
			// System.out.println("loginUser : " + loginUser);
			model.addAttribute("loginUser", loginUser);
			saveUserTown(loginUser.getUser_id(), model);
			return "redirect:/home";
		} else {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return "redirect:/home";
		}
		
	}

	// 회원가입 페이지로
	@GetMapping("/join")
	public ModelAndView selectAllTown(ModelAndView mv) {
		List<Town> tlist1 = tService.selectAllTown1();
		List<Town> tlist2 = tService.selectAllTown2();
		List<Town> tlist3 = tService.selectAllTown3();

		if (tlist1 != null && tlist2 != null && tlist3 != null) {
			mv.addObject("tlist1", tlist1);
			mv.addObject("tlist2", tlist2);
			mv.addObject("tlist3", tlist3);
			mv.setViewName("member/memberJoin");
		} else {
			mv.setViewName("member/memberJoin");
		}
//		    System.out.println(tlist1);
//		    System.out.println(tlist2);
//		    System.out.println(tlist3);
		return mv;
	}

	// 회원가입(DB insert)
	@PostMapping("/join")
	public String memberJoin(@ModelAttribute Member m, 
							Model model, 
							RedirectAttributes rd,
							@RequestParam String address_3
							) {

		String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
		m.setUser_pwd(encPwd);
		
		System.out.println("회원가입 넘어온 값 : "+m);
		System.out.println("넘어온 주소 값: "+address_3);
		
		// 1) 넘어온 주소값에 해당하는 t_no 조회하기
		int t_no = tService.selectTownNo(address_3);
		System.out.println(address_3 + "의 t_no : " + t_no);
		
		// 3) MEMBER insert
		int result = mService.insertMember(m);
		System.out.println("회원가입 잘됐나? : " + result);
		
		// 2) MYTOWN insert
		MyTown mt = new MyTown(m.getUser_id(), t_no);
		int insertMytown = tService.insertMyTown(mt);
		System.out.println("마이타운 객체확인 : " + mt);
		System.out.println("마이타운 들어갔나? : " + insertMytown);
		
		// 4) MYTOWN & MEMBER insert 성공 시
		if (result > 0) {
			// * RedirectAttributes : Redirect시 데이터를 전달할 수 있는 객체
			rd.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요.");
			// redirect직전 모든 Flash 속성을 세션에 복사 -> redirect 직후 세션에서 다시 모델로 이동
			return "redirect:/home";

		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			return "common/errorpage";
		}

	}
	
	// 아이디 중복 체크 - "success or fail" - text 응답
	@PostMapping("/idCheck")
	public void userIdCheck(String user_id, HttpServletResponse response) {
		
		System.out.println("중복확인 할 아이디 넘어왔나" + user_id);
		
		int result = mService.userIdCheck(user_id);
		
		PrintWriter out;
		
		try {
			out = response.getWriter();
			
			if(result > 0) {
				out.print("fail");
			}else {
				out.print("success");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 회원 정보 수정
	@PostMapping("/update")
	public String updateMember( @ModelAttribute("loginUser") Member loginUser,
								Model model,
								RedirectAttributes rd,
								String nickname,
								String email,
								String phone,
								String address_3,
								String userNewPwd) {
		// 새롭게 바꿀 비번 암호화
		String encPwd = bcryptPasswordEncoder.encode(userNewPwd);
		loginUser.setUser_pwd(encPwd);
		
		loginUser.setNickname(nickname);
		loginUser.setEmail(email);
		loginUser.setPhone(phone);
		
		// USER_INFO update
		int result = mService.updateMember(loginUser);
		
		// MY_TOWN update 
		// 1) 넘어온 주소값에 해당하는 t_no 조회하기
		int t_no = tService.selectTownNo(address_3);
		MyTown mt = new MyTown(loginUser.getUser_id(), t_no);
		
		// 현재 마이타운 타입만 변경,insert,delete 밖에 없으므로 update따로 만들어야함..ㅎ
		int result2 = tService.updateMyTown(mt);
		
		// 바뀐 동네정보 다시 세션에 담아주기
		Town townInfo = tService.selectUserTown(loginUser.getUser_id());
		
		if(townInfo != null) {
			model.addAttribute("townInfo", townInfo);
			System.out.println("세션에 저장되는 타운 바뀌나 : " + townInfo);
		}
		
		// --------여기까지 함
		// 멤버매퍼랑 타운매퍼 작성하기
//		
//		// 마이페이지에 존재하는 수정 된 필드 값만 loginUser에 세팅 되므로
//		// 수정 페이지에서 다루지 않은 필드 값은 loginUser 안에 존재하지 않음
//		// 추후 사용해야 할 다른 필드값이 있다면 update 후 다시 select 해서 loginUser에 설정하는 로직 필요
//		
//		
//		
//		if(result > 0) {
//			rd.addFlashAttribute("msg", "수정이 성공적으로 되었습니다 :)");
//			return "redirect:/home";
//		} else {
//			model.addAttribute("msg","회원정보 수정에 실패하였습니다.");
//			return "common/errorpage";
//		}
		return"redirect:/mypage/updateMember";
		
	}
	
	@PostMapping("originPwdCheck")
	public void originPwdCheck(String originPwd, HttpServletResponse response,@ModelAttribute("loginUser") Member m) {
		
		// System.out.println("기존 비밀번호 넘어왔나 " + originPwd);
		
		PrintWriter out;
			
				try {
					out = response.getWriter();
					if(bcryptPasswordEncoder.matches(originPwd,m.getUser_pwd())) {
					out.print("success");
					System.out.println("기존 비밀번호 일치!");
					}else {
						out.print("fail");
						System.out.println("기존 비밀번호 불일치!");
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	// 아이디 비밀번호 찾기
	@GetMapping("/find")
	public String goFindIdPwdView() {
		return "member/findUserInfo";
	}

	// 로그아웃 컨트롤러 (세션 만료)
	@GetMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete();
		return "redirect:/home";
	}
	
	// 로그인 시 로그인 유저의 동네 정보 세션에 저장하기
	public void saveUserTown(String user_id,
							   Model model
							 ) {
		System.out.println(user_id + "  zzzzz");
		
		//HttpSession session = request.getSession();
		Town townInfo = tService.selectUserTown(user_id);
		 
		// System.out.println(townInfo);
		if(townInfo != null) {
			model.addAttribute("townInfo", townInfo);
		//	session.setAttribute("townInfo", townInfo);
			System.out.println("멤버 컨트롤러 townInfo" + townInfo);
		} 
		
	}
	
	// 탈퇴하기
	@GetMapping("/deleteMember")
	public String deleteMember(RedirectAttributes rd) {
		
		
		rd.addAttribute("msg", "탈퇴가 성공적으로 되었습니다. 다음에 또 이용해주세요 :)");
		
		return "redirect:/home";
	}
	
}
