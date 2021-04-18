package com.kh.goodbuy.center.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.admin.model.exception.NoticeException;
import com.kh.goodbuy.center.model.service.NoticeService;
import com.kh.goodbuy.center.model.service.QnaService;
import com.kh.goodbuy.center.model.vo.Notice;
import com.kh.goodbuy.center.model.vo.QNA;
import com.kh.goodbuy.member.model.vo.Member;



@Controller
@RequestMapping("/center")
public class CenterController {
	
	@Autowired
	private NoticeService nService;
	@Autowired
	private QnaService qService;
	// 고객센터 페이지 이동
	@GetMapping("/join")
	public ModelAndView CenterMainView(ModelAndView mv) {
		       List<Notice> list = nService.selectNoticeList();
		       if(list != null) {
		          mv.addObject("list", list);
		          mv.setViewName("center/center_main");
		       } else {
		          mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
		          mv.setViewName("common/error_page");
		       }
		       return mv;
		
		
		
		
		
	}
	@GetMapping("/FAQ")
		public ModelAndView CenterFAQView(ModelAndView mv) {
		       List<QNA> list = qService.selectFAQList();
		       if(list != null) {
		          mv.addObject("list", list);
		          mv.setViewName("center/center_FAQ");
		       } else {
		          mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
		          mv.setViewName("common/error_page");
		       }
		       return mv;
	}
	@GetMapping("/QNA")
		public ModelAndView CenterQNAView(ModelAndView mv, HttpSession session) {
				Member loginUser = (Member)session.getAttribute("loginUser");
				String user_id= loginUser.getUser_id();
		       List<QNA> list = qService.selectQNAQList(user_id);
		       System.out.println("list : " + list);
		       if(list != null) {
		          mv.addObject("list", list);
		          mv.setViewName("center/center_QNA");
		       } else {
		          mv.addObject("msg", "QNA 목록 조회에 실패하였습니다.");
		          mv.setViewName("common/error_page");
		       }
		       return mv;
	}
	@GetMapping("/QNA_Q")
	public String CenterQNAQView() {
		return "center/center_QNA_Q";
	}
	@PostMapping("/write")
		public String NoticeCreateView(@ModelAttribute QNA q, HttpServletRequest request,
				@RequestParam(name="uploadFile") MultipartFile file) {
			System.out.println("공지사항 작성 내용 : " + q);
			System.out.println("업로드 된 파일명 : " + file.getOriginalFilename());

		      
		      
		      if(!file.getOriginalFilename().equals("")) { 
		         String saveFile = saveFile(file, request);
		         
		         if(saveFile != null) {
		            
		            q.setFile_path("/nuploadFiles/" + file.getOriginalFilename());
		         }
		      }

			int result = qService.insertQNA(q);
			if (result > 0) {
				return "redirect:/center/QNA";
			} else {
				throw new NoticeException("qna 등록에 실패하였습니다.");
			}

		}
	// 관리자 공지사항 디테일페이지 이동
		@GetMapping("/QNA_A")
		public String CenterQNAAView(@RequestParam int qa_no, Model model) {

			QNA q = qService.selectQNA(qa_no);

			if (q != null) {
				model.addAttribute("qna", q);
				return "center/center_QNA_A";
			} else {
				model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
				return "common/errorpage";
			}
		}
		 // 파일 저장 메소드
		   public String saveFile(MultipartFile file, HttpServletRequest request) {
		     
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      String savePath = root + "\\nuploadFiles";
		      
		      System.out.println("savePath : " + savePath);
		     
		      File folder = new File(savePath);
		      
		     
		      if(!folder.exists()) {
		         folder.mkdirs(); 
		      }
		      
		     
		      String file_path = folder + "\\" + file.getOriginalFilename();
		      // 실제 저장 될 파일 경로 + 넘어온 파일명
		      
		      try {
		         file.transferTo(new File(file_path)); // 이 때 파일이 저장 됨
		      } catch (IllegalStateException | IOException e) {
		         System.out.println("파일 저장 에러 : " + e.getMessage());
		      }
		      
		      return file_path;
		      
		   }
}
