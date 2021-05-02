package com.kh.goodbuy.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.goodbuy.board.model.service.BoardService;
import com.kh.goodbuy.board.model.vo.Board;

import com.kh.goodbuy.common.Pagination;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.PageInfo;

@Controller
@RequestMapping("/board")
public class boardController {

	@Autowired
	private BoardService bService;


	

	
	@GetMapping("/list")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {
		// -> 메뉴바 클릭 시 page라는 파라미터는 없으므로 required=false, 넘어오는 값 없을 시 기본 값 1로 설정

		// 게시글 개수 구하기
		int listCount = bService.selectListCount();
		System.out.println(listCount);

		// 요청 페이지에 맞는 게시글 리스트 조회
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 4);
		List<Board> list = bService.selectList(pi);

		System.out.println(list);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardList");
		} else {
			mv.addObject("msg", "게시글 전체 조회에 실패하였습니다.");
			mv.setViewName("common/errorpage");
		}

		return mv;
	}

	@GetMapping("/write")
	public String boardWriteview() {
		return "board/boardwrite";
	}

	/*
	 * 작성페이지
	 * 
	 * @GetMapping("/write") public ModelAndView boardWriteview(ModelAndView mv) {
	 * List<BoardCate> list = bService.selectCate(); for(BoardCate a :list) {
	 * System.out.println(a); } mv.addObject("list", list);
	 * mv.setViewName("board/boardWrite"); return mv; }
	 */

	
	
	
	// 게시글 작성
	@PostMapping("/insert")
	public String BoardInsert(@ModelAttribute Board b, MultipartFile fileup, HttpServletRequest request) {

		System.out.println("fileup" + fileup);
		System.out.println("board" + b);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		System.out.println("loginuser" + loginUser.getUser_id());

		b.setUserid(loginUser.getUser_id());
		String renameFileName = saveFile(fileup, request);
		System.out.println(renameFileName);
		b.setBfile(renameFileName);
		System.out.println(b);

		int result = bService.insertBoard(b);
		if (result > 0) {

			return "redirect:/board/list";
		} else {
			return "common/errorpage";
		}

	}

	private String saveFile(MultipartFile fileup, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/boardupload";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성

		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = fileup.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_" + (int) (Math.random() * 100000)
				+ originalFileName.substring(originalFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명

		try {
			fileup.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}

		return renameFileName;
	}

	/* 메인페이지 */
	@GetMapping("/main")
	public String boardmainview() {
		return "board/boardMain";
	}

	/* 디테일 페이지 */
	@GetMapping("/detail")
	public String boarddetailview(HttpServletRequest request, @RequestParam(value = "bno", required = false) int bno,
			Model model) {
		System.out.println("왜안오니"+bno);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Board b = bService.BoardDetail(bno);
		model.addAttribute("b", b);
		
		List<Reply>rlist = bService.selectReplyList(b);
		model.addAttribute("b", b);
		System.out.println(rlist);
		model.addAttribute("rlist", rlist);
		return "board/boardDetail";
	}

	

	/* 검색 */
	@GetMapping("/serch")
	public String Serchview() {
		return "board/boardSerch";
	}
	

	@GetMapping("/delete")
	public String DeleteBoard(int bno, String pageName) {
		
		System.out.println("넘어온 bno : " + bno);
		
		System.out.println("넘어온 페이지 : " + pageName);
		
		int result = bService.deleteBoard(bno);
		
		if(pageName.equals("mypage")) {
			return "redirect:/mypage/myBoardList";
		}else {
			return "board/list";
		}
	

		 
		
		
	}

	


	//추천수 증가 insert
	@PostMapping("/count")
	public @ResponseBody int likecount(int bno, HttpSession session){
		System.out.println(bno+"bno");
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println(loginUser.getUser_id());
		int result = bService.insertlike(bno,loginUser.getUser_id());
		
		return result;
	}


	
	//추천수 삭제 
	@PostMapping("/countCancel")
	public @ResponseBody int deletecount(int bno,HttpSession session) {
		System.out.println(bno+"bno");
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println(loginUser.getUser_id());
		int result = bService.deletelike(bno,loginUser.getUser_id());
		return result;
	}

	
	
	
	// 댓글 작성
	@PostMapping(value = "/insertReply", produces = "application/json; charset= utf-8")
	public @ResponseBody String insertReply(Reply r,Board b, HttpSession session, HttpServletRequest request) {

		System.out.println("b : "+b);
		Member loginUser =(Member)request.getSession().getAttribute("loginUser");
		System.out.println("loginUser : " + loginUser );
		
		r.setRno(b.getBno());
		r.setUser_id(loginUser.getUser_id());
		
		List<Reply> rlist =bService.insertReply(r,b);
		System.out.println("rlist : " + rlist);
		Gson gson = new GsonBuilder()
				.setDateFormat("yyyy-MM-dd")
				.create();
		
		//응답작성 
		return gson.toJson(rlist);
	}
	 
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

