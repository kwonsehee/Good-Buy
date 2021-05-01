package com.kh.goodbuy.admin.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.admin.model.exception.NoticeException;
import com.kh.goodbuy.business.model.service.BusinessService;
import com.kh.goodbuy.business.model.vo.Payment;
import com.kh.goodbuy.center.model.service.NoticeService;
import com.kh.goodbuy.center.model.service.QnaService;
import com.kh.goodbuy.center.model.vo.Notice;
import com.kh.goodbuy.center.model.vo.QNA;
import com.kh.goodbuy.common.Pagination;
import com.kh.goodbuy.common.model.service.ReportService;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.goods.model.service.GoodsService;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;
import com.kh.goodbuy.town.model.service.TownService;
import com.kh.goodbuy.town.model.vo.Town;



@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberService mService;
	@Autowired
	private NoticeService nService;
	@Autowired
	private ReportService rService;
	@Autowired
	private QnaService qService;
	@Autowired
	private GoodsService gService;
	@Autowired
	private TownService tService;
	@Autowired
	private BusinessService bService;

	// 관리자 페이지 메인페이지 이동
	@GetMapping("/join")
	public String AdminMainView() {
		return "admin/admin_main";
	}

	// 공지사항
	// -------------------------------------------------------------------------------------------

	// 관리자 공지사항 메인페이지 이동
	@GetMapping("/notice")

	public ModelAndView NoticeMainView(ModelAndView mv) {
		List<Notice> list = nService.selectNoticeList();
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/notice_main");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;

	}

	// 공지사항 등록 화면이동
	@GetMapping("/write")
	public String NoticeWriteView() {
		return "admin/notice_create";
	}

	// 관리자 공지사항 작성버튼
	@PostMapping("/noticewrite")
	public String NoticeCreateView(@ModelAttribute Notice n, HttpServletRequest request) {
		System.out.println("공지사항 작성 내용 : " + n);

		// * 2) DB에 Notice 객체 insert
		int result = nService.insertNotice(n);
		if (result > 0) {
			return "redirect:/admin/notice";
		} else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}

	}

	// 공지사항 수정
	@PostMapping("/update")
	public String noticeUpdate(@ModelAttribute Notice n, HttpServletRequest request) {
		
		
		int result = nService.updateNotice(n);
		
		
		if (result > 0) {
			return "redirect:/admin/notice";
		} else {
			throw new NoticeException("공지사항 수정에 실패하였습니다.");
		}
		
	}

	// 공지사항 삭제
	@GetMapping("/delete")
	public String noticeDelete(int nt_no, HttpServletRequest request) {
		
		Notice n = nService.selectNotice(nt_no);
		int result = nService.deleteNotice(nt_no);

		if (result > 0) {
			return "redirect:/admin/notice";
		} else {
			throw new NoticeException("공지사항 삭제에 실패하였습니다.");
		}
	}

	// 관리자 공지사항 디테일페이지 이동
	@GetMapping("/noticedetail")
	public String NoticeDetailView(@RequestParam int nt_no, Model model) {

		Notice n = nService.selectNotice(nt_no);

		if (n != null) {
			model.addAttribute("notice", n);
			return "admin/notice_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
			return "common/errorpage";
		}
	}

	// 신고
	// -------------------------------------------------------------------------------------------
	// 신고 메인페이지 이동
	@GetMapping("/report")

	public ModelAndView ReportMainView(ModelAndView mv) {
		List<Report> list1 = rService.selectReport1List();
		List<Report> list2 = rService.selectReport2List();
		List<Report> list3 = rService.selectReport3List();
		if (list1 != null) {
			mv.addObject("list1", list1);
			mv.addObject("list2", list2);
			mv.addObject("list3", list3);
			mv.setViewName("admin/report_main");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;

	}

	// 신고 디테일페이지 이동
	@GetMapping("/reportdetail")
		public String ReportDetailView(@RequestParam int re_no, Model model) {

			Report r = rService.selectReport(re_no);
			
			if (r != null) {
				model.addAttribute("report", r);
				return "admin/report_detail";
			} else {
				model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
				return "common/errorpage";
			}
		}
	
	// 신고 상세페이지에서 처리하기
	@PostMapping("/reportupdate")
	public String reportUpdate(@ModelAttribute Report r, HttpServletRequest request) {
		
		//신고처리
		int result = rService.updateReport(r);
		int result3 = rService.insertAlarmproduct(r);
		
		System.out.println("신고당한사람 : " + r.getReported_id());
		System.out.println("r : " + r);
		// 신고 처리 시 유저인포 REPORTED 컬럼 +1
		int result2 = rService.addCountReported(r.getReported_id());
		int result4 = mService.selectReportedCount(r.getReport_id());
		
		System.out.println("유저인포 reported+1 됐나 : " + result2);
		
		if (result3 > 0) {
			return "redirect:/admin/report";
		} else {
			throw new NoticeException("신고처리에 실패하였습니다.");
		}
		
	}
	// 업데이트
		@GetMapping("/productreportupdate")
		public String productreportupdate(int gno, HttpServletRequest request) {
			
			System.out.println(gno);
			int result = gService.productreportupdate(gno);
			
			
			if (result > 0) {
				return "redirect:/admin/report";
			} else {
				throw new NoticeException("상품수정에 실패하였습니다.");
			}
			
		}
	// 회원 신고
	@GetMapping("/reportmemberupdate")
	public String reportmemberUpdate(String reported_id, HttpServletRequest request) {
		
		
		System.out.println("신고당한사람 : " + reported_id);
		// 신고 처리 시 유저인포 REPORTED 컬럼 +1
		int result = rService.insertAlarmMember(reported_id);
		int result2 = rService.addCountReported(reported_id);
		
		System.out.println("유저인포 reported+1 됐나 : " + result2);
		int result4 = mService.selectReportedCount(reported_id);
		if (result2 > 0) {
			return "redirect:/admin/report";
		} else {
			throw new NoticeException("신고처리에 실패하였습니다.");
		}
		
	}
	
	// 중고상품detail 페이지로
		@GetMapping("/goodsdetail")
		public String goGoodsDetailView(HttpServletRequest request,
				 @RequestParam(value="gno", required=false) int gno,
				 Model model) {
			//상품 정보셀렉
			Goods g = gService.Goodsdetail(gno);

			List<Reply>rlist = gService.selectReplyList(g);
			model.addAttribute("g", g);
			System.out.println(rlist);
			model.addAttribute("rlist", rlist);
			return "goods/goodsdetail";
		}

	// 상품관리
	// -------------------------------------------------------------------------------------------
	// 상품관리 메인페이지 이동
	@GetMapping("/product")

		public ModelAndView ProductMainView(ModelAndView mv, @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
			
			int listCount = mService.selectListCount();
			
			int boardLimit = 7;	// 한 페이지 보여질 게시글 개수
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			List<Goods> list = gService.selectGoodsList(pi);
			System.out.println(list);
			if (list != null) {
				mv.addObject("list", list);
				
				mv.addObject("pi", pi);
				mv.setViewName("admin/product_main");
			} else {
				mv.addObject("msg", "회원 목록 조회에 실패하였습니다.");
				mv.setViewName("common/error_page");
			}
			return mv;

	
	}

	// 상품관리 디테일 페이지 이동
	@GetMapping("/productdetail")
		
		public String ProductDetailView(@RequestParam int gno, Model model) {

			Goods g = gService.selectProduct(gno);
			System.out.println("g: " + g);
			if (g != null) {
				model.addAttribute("goods", g);
				return "admin/product_detail";
			} else {
				model.addAttribute("msg", "상품 상세보기에 실패했습니다.");
				return "common/errorpage";
			}
		
	}
	// 상품 삭제
		@GetMapping("/productdelete")
		public String productDelete(int gno, HttpServletRequest request) {
			
			
			int result = gService.updateProduct2(gno);

			if (result > 0) {
				return "redirect:/admin/product";
			} else {
				throw new NoticeException("상품 삭제에 실패하였습니다.");
			}
		}
	// 업데이트
	@GetMapping("/productupdate")
	public String productUpdate(int gno, HttpServletRequest request) {
		
		System.out.println(gno);
		int result = gService.updateProduct(gno);
		
		
		if (result > 0) {
			return "redirect:/admin/product";
		} else {
			throw new NoticeException("상품수정에 실패하였습니다.");
		}
		
	}
	// 상품관리 검색
	@GetMapping("/productsearch")
	public String procductSearch(@ModelAttribute Search search,
							   Model model) {
		
		List<Goods> searchList = gService.searchList(search);
		
		model.addAttribute("list", searchList);
		System.out.println(searchList);
		return "admin/product_main";
	}

	// 회원관리
	// -------------------------------------------------------------------------------------------
	// 회원관리 메인페이지 이동
	
	@GetMapping("/member")
	public ModelAndView MemberMainView(ModelAndView mv, @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = mService.selectListCount();

		int boardLimit = 7;	// 한 페이지 보여질 게시글 개수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Member> list = mService.selectMemberList(pi);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin/member_main");
		} else {
			mv.addObject("msg", "회원 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;

	}

	// 회원관리 디테일페이지 이동
		@GetMapping("/memberdetail")
		public String MemberDetailView(@RequestParam String user_id, Model model) {

			Member m = mService.selectMemberDetail(user_id);

			if (m != null) {
				model.addAttribute("member", m);
				return "admin/member_detail";
			} else {
				model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
				return "common/errorpage";
			}
		}
	
	// 회원정보 수정
		@PostMapping("/updatemember")
		   public String memberadminUpdate(Member m,
		                       HttpServletRequest request) {
		      

		      

		      int result = mService.updateadminmember(m);
		      System.out.println(m);
		      if(result > 0) {
		         return "redirect:/admin/member";
		      } else {
		         throw new NoticeException("게시물 수정에 실패하였습니다.");
		      }
		      
		   }
	
	// 검색 기능
	
		@GetMapping("/search")
		public String memberSearch(@ModelAttribute Search search,
								   Model model) {
			System.out.println("search : " + search);
			List<Member> searchList = mService.searchList(search);
			
			model.addAttribute("list", searchList);
			model.addAttribute("start", search.getDate1());
			model.addAttribute("end", search.getDate2());
			
			
			System.out.println(searchList);
			return "admin/member_main";
		}

	// FAQ 관리
	// -------------------------------------------------------------------------------------------
	// FAQ 메인페이지 이동
	@GetMapping("/FAQ")
		public ModelAndView FAQrMainView(ModelAndView mv, @RequestParam(value="cate", required=false, defaultValue="null") String cate) {
			List<QNA> list = qService.selectFAQList();
			List<QNA> list2 = qService.selectQNAList();
			List<QNA> list21 = qService.selectQNAList1();
			List<QNA> list22 = qService.selectQNAList2();
			List<QNA> list23 = qService.selectQNAList3();
			if (list != null) {
				mv.addObject("list", list);
				mv.addObject("list2", list2);
				mv.addObject("list21", list21);
				mv.addObject("list22", list22);
				mv.addObject("list23", list23);
				mv.setViewName("admin/FAQ_main");
			} else {
				mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
				mv.setViewName("common/error_page");
			}
			return mv;

		}

	// FAQ 디테일페이지 이동
	@GetMapping("/FAQdetail")
		public String FAQDetailView(@RequestParam int qa_no, Model model) {

			QNA q = qService.selectFAQ(qa_no);

			if (q != null) {
				model.addAttribute("QNA", q);
				return "admin/FAQ_detail";
			} else {
				model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
				return "common/errorpage";
			}
		}
	
	@GetMapping("/QNAdetail")
	public String QNADetailView(@RequestParam int qa_no, Model model) {

		QNA q = qService.selectQNA(qa_no);

		if (q != null) {
			model.addAttribute("QNA", q);
			return "admin/QNA_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
			return "common/errorpage";
		}
	}
	
	@PostMapping("/FAQupdate")
	public String FAQUpdate(@ModelAttribute QNA q, HttpServletRequest request) {
		
		
		int result = qService.updateFAQ(q);
		
		
		if (result > 0) {
			return "redirect:/admin/FAQ";
		} else {
			throw new NoticeException("공지사항 수정에 실패하였습니다.");
		}
		
	}
	
	@PostMapping("/QNAAwrite")
	public String QNAUpdate(@ModelAttribute QNA q, HttpServletRequest request) {
		
		
		int result = qService.updateQNAA(q);
		System.out.println(q);
		
		if (result > 0) {
			return "redirect:/admin/FAQ";
		} else {
			throw new NoticeException("공지사항 수정에 실패하였습니다.");
		}
		
	}
	
	
	@GetMapping("/FAQdelete")
	public String FAQDelete(int qa_no, HttpServletRequest request) {
		
		QNA q = qService.selectFAQ(qa_no);
		int result = qService.deleteFAQ(qa_no);

		if (result > 0) {
			return "redirect:/admin/FAQ";
		} else {
			throw new NoticeException("공지사항 삭제에 실패하였습니다.");
		}
	}
	
	// FAQ 등록 화면이동
		@GetMapping("/FAQwrite")
		public String FAQWriteView() {
			return "admin/FAQ_create";
		}
		
		// FAQ 작성버튼
		@PostMapping("/FAQwriteB")
		public String FAQCreateView(@ModelAttribute QNA q, HttpServletRequest request) {
			System.out.println("공지사항 작성 내용 : " + q);

			// * 2) DB에 Notice 객체 insert
			int result = qService.insertFAQ(q);
			if (result > 0) {
				return "redirect:/admin/FAQ";
			} else {
				throw new NoticeException("공지사항 등록에 실패하였습니다.");
			}

		}

	// 통계
	// -------------------------------------------------------------------------------------------
	// 통계1 페이지 이동
	@GetMapping("/stats")
		// 관리자 공지사항 디테일페이지 이동

		public ModelAndView stats1View(ModelAndView mv) {
			List<Town> Seoul = tService.selectSeoul();
			System.out.println(Seoul);   
			if (Seoul != null) {
				mv.addObject("Seoul", Seoul);
				
				mv.setViewName("admin/stats1");
			} else {
				mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
				mv.setViewName("common/error_page");
			}
			return mv;
		
	}

	// 통계2 페이지 이동
	@GetMapping("/stats2")
		public ModelAndView stats2View(ModelAndView mv) {
			List<Payment> busis = bService.selectBusis();
			List<Payment> revs = bService.selectRevs();
			List<Payment> sumbu = bService.selectSumBu();
			List<Payment> sumre = bService.selectSumRe();
			System.out.println("sumbu : " + sumbu);
			System.out.println("sumre : " + sumre);
			if (busis != null) {
				mv.addObject("busis", busis);
				mv.addObject("revs", revs);
				mv.addObject("sumbu", sumbu);
				mv.addObject("sumre", sumre);
				mv.setViewName("admin/stats2");
			} else {
				mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
				mv.setViewName("common/error_page");
			}
			return mv;
	}
	
	@RequestMapping(value = "/excelConvert", method = RequestMethod.GET)
	public ModelAndView excelConvert(Locale locale, Model model) {
		List<Town> Seoul = tService.selectSeoul();
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("Seoul", Seoul);
		mv.setViewName("admin/excelConvert");
		
		return mv;
		
	}
}
