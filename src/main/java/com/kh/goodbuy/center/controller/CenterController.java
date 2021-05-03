package com.kh.goodbuy.center.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			

		      
		      
			if(!file.getOriginalFilename().equals("")) {
		         // 파일 저장 메소드 별도로 작성 - 리네임 리턴 
		         String renameFileName = saveFile(file, request);
		         // DB에 저장하기 위한 파일명 세팅
		         if(renameFileName != null) {
		            q.setOriginalFileName(file.getOriginalFilename());
		            q.setRenameFileName(renameFileName);
		         }
		         
		      }

			int result = qService.insertQNA(q);
			if (result > 0) {
				return "redirect:/center/QNA";
			} else {
				throw new NoticeException("qna 등록에 실패하였습니다.");
			}

		}
	// qna answer
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
			      String savePath = root + "/images/qnaupload";
			      File folder = new File(savePath); // 메모리상에서 객체 파일 만들기 
			      if(!folder.exists()) folder.mkdir(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
			      
			      // 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
			      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			      String originalFileName = file.getOriginalFilename();
			      String renameFileName = sdf.format(new Date()) + "_"
			                     + (int)(Math.random() * 100000)
			                     + originalFileName.substring(originalFileName.lastIndexOf("."));
			      
			      String renamePath = folder + "/" + renameFileName; // 저장하고자하는 경로 + 파일명
			      
			      try {
			         file.transferTo(new File(renamePath));
			         // => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
			      } catch (IllegalStateException | IOException e) {
			         System.out.println("파일 업로드 에러 : " + e.getMessage());
			      }
			      
			      return renameFileName;
			   }
		   // 파일 다운
		   @GetMapping("/download")
		      public @ResponseBody byte[] fileDownload(int qa_no,
		                         HttpServletRequest request,
		                         HttpServletResponse response) throws IOException {
			   QNA q = qService.selectQNA(qa_no);
		         // -> 파일의 원본명, 리네임명 조회해옴
		         
		         // 1. 다운로드 할 파일 객체생성
		         String root = request.getSession().getServletContext().getRealPath("/");
		         File downFile = new File(root + "/resources/images/qnaupload/" + q.getRenameFileName());
		         
		         // 2. 클라이언트 측으로 다운로드 처리
		         // 1) 파일 한글명 인코딩
		         String originName = new String(q.getOriginalFileName().getBytes("UTF-8"), "ISO-8859-1");
		         // 2) Content-Disposition : 파일 다운로드를 처리하는 HTTP 헤더
		         // -> 웹 서버 응답에 이 헤더를 포함하면 응답 내용을 웹 브라우저로 바로 보내거나 내려 받도록 설정할 수 있음
		         response.setHeader("Content-Disposition", "attachment; filename=\"" + originName + "\"");
		         // 3) 전송 크기 공간 확보 요청
		         response.setContentLength((int)downFile.length());
		            
		         // 파일 객체를 byte[]에 담아서 리턴
		         return Files.readAllBytes(downFile.toPath());
		      }
}
