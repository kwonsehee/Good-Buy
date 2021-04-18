package com.kh.goodbuy.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.board.model.service.BoardService;
import com.kh.goodbuy.board.model.vo.Board;




	@Controller
	@RequestMapping("/board")
	public class boardController {
	
		
		@PostMapping("write")
		public String write(Board vo) {
			BoardService.insertBoard(vo);
			return "redirect:/goodbuy/board/list?seq="+ vo.getSeq();
		}
		
	/*@Autowired 
	private boardService bService;
	/*
	@GetMapping("/list")
	public ModelAndView BoardList(ModelAndView mv,
			@RequestParam(value="page", required=false, defaultValue="1")int currentPage) {
	// --> 메뉴바 클릭 시 page라는 파라미터는 없으므로 requried=false, 넘어오는 값 없을 시 기본값 1로 설정 
		
		//게시글 개수 구하기 
		int listCount = bService.selectListCount();
		System.out.println(listCount);
		
		
		return mv;
	}
	*/
		
				
	/*리스트*/
	@GetMapping("/list")
	public String boardlistview() {
		return "board/boardList";
	}
	/*메인페이지*/
	@GetMapping("/main")
	public String boardmainview() {
		return "board/boardMain";
	}
	/*디테일 페이지*/		
@GetMapping("detail")
public String boarddetailview() {
	return"board/boardDetail";
}
/*작성페이지*/
@GetMapping("write")
public String boardWrite() {
  return "board/boardWrite";
}
	/*검색*/
	@GetMapping("/serch")
	public String Serchview() {
		return "board/boardSerch";
	}
	
	
	

	
	}



