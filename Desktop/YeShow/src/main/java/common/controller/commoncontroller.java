package common.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import upload.model.OwnerCheckVO;
import upload.model.flagVO;
import upload.model.leastmenupriceVO;
import upload.model.resReviewVO;
import upload.model.reservation2VO;
import upload.model.reservationVO;
import upload.model.resfileVO;
import upload.model.resviewVO;
import upload.model.tableup2VO;
import upload.model.tableupVO;
import upload.model.tableviewVO;
import upload.model.uploadVO;
import upload.model.uploadmenuVO;
import upload.model.yettableviewVO;
import upload.service.uploadService;
import upload.service.uploadmenuService;
import ye.model.MemberVO;



@Controller
public class commoncontroller {
	
	
	
	ArrayList<resfileVO> arr=new ArrayList<resfileVO>();//파일 이름을 담는 arr
	
	
	
	@Autowired
	private uploadService uploadService;
	
	@Autowired
	private uploadmenuService menuService;
	
	@RequestMapping("/Top.do")
	public String top(){
		return "Top";
	}
	
	
	
	
	
	
	//////////////////////////////////
	
/*	@RequestMapping("/main.do")
	public String listBoardPaging(Model model,
								HttpServletRequest req,
								HttpSession ses,
								@ModelAttribute("paging") Paging2VO paging, 
								@RequestParam(defaultValue="0") int pageSize){

		if(pageSize==0){
			Integer ps=(Integer)ses.getAttribute("pageSize");
			if(ps==null){
				pageSize=5;
				
			}else{
				pageSize=ps;
			}
			
		}
		//세션에 pageSize를 저장하자.
		ses.setAttribute("pageSize", pageSize);
		
		int totalCount=uploadService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.setPageSize(pageSize);
		paging.init();//페이징 관련
		
		//페이징 관련 연산을 수행하는 메소드 호출
		
		
		//페이징 네비게이션 문자열을 반환하는 메소드 호출
		String myctx=req.getContextPath();
		String loc="main.do";
		String pageNavi=paging.getPageNavi(myctx,loc);
		
		List<uploadVO> arr=uploadService.selectBoardAll(paging);
		
		model.addAttribute("boardList",arr);
		//model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi",pageNavi);
		
		return "restaurant/resup";
	}*/
	
	
	/////////////////////////////////
	@RequestMapping("/main.do")
	public String mainView(Model model, @RequestParam(defaultValue="1") int cpage,
										@RequestParam(defaultValue="30")int pageSize){
		
		if(cpage<0){
			cpage=1;
		}
		
		
		int totalCount=uploadService.getTotalCount();
		int pageCount=(totalCount-1)/pageSize+1;
		
		if(cpage>pageCount){
			cpage=pageCount;
		}
		
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		//메인정보 가져오기
		List<uploadVO> arr=uploadService.selectAllRes(map);
		
		//별점가져오기
		List<resviewVO> star=uploadService.selectStar();
		
		//최저가격 가져오기
		List<leastmenupriceVO> price=menuService.selectmenuprice();
		
		//List<uploadVO> arrview=uploadService.selectAllRes();//사진 및 정보 보여주기
		
		model.addAttribute("price", price);
		model.addAttribute("star",star);
		model.addAttribute("resArr",arr);
		//model.addAttribute("viewinfo",arrview);
		model.addAttribute("cpage",cpage);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		
		//System.out.println("star="+star);
		
		
		return "main";
	}
	
	
	
	@RequestMapping(value="/mainsearch.do", method=RequestMethod.POST)//메인 검색
	public String mainserch(Model model,
							@RequestParam("search") String search,
							@RequestParam(defaultValue="1") int cpage,
							@RequestParam(defaultValue="30")int pageSize){
		
		if(cpage<0){
			cpage=1;
		}
		
		
		int totalCount=uploadService.getTotalCount();
		int pageCount=(totalCount-1)/pageSize+1;
		
		if(cpage>pageCount){
			cpage=pageCount;
		}
		
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		
		//검색하기
		List<uploadVO> mainsearch=uploadService.selectSerchRes(map);
		
		//별점가져오기
		List<resviewVO> star=uploadService.selectStar();
		
		//최저가격 가져오기
		List<leastmenupriceVO> price=menuService.selectmenuprice();
		
		
		
		model.addAttribute("price", price);
		model.addAttribute("star",star);
		model.addAttribute("ms",mainsearch);
		model.addAttribute("cpage",cpage);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		
		return "mainserch";
	}
	

	@RequestMapping("/Foot.do")
	public String Foot(){
		return "Foot";
	}
	
	
	@RequestMapping("/resup.do")//업로드하는 컨트롤러
	public String rewup(){
		
		return "restaurant/resup";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/resupload.do", method=RequestMethod.POST)
	public String insertRes(Model model,
							HttpSession ses,
							@ModelAttribute("upload") uploadVO upload,
							@RequestParam("upiname") String resfile){
		
		
		
		
		ArrayList<resfileVO> fvo=(ArrayList<resfileVO>)ses.getAttribute("resimage");
		//System.out.println("fvo="+fvo);
		
		/*int n=uploadService.insertRes(upload);*/
		int n=uploadService.insertRes(upload, fvo);
		
		/*if(n>0){
			for(resfileVO f:fvo){
				
				int n2=uploadService.insertResfile(f.getUpiname());
			}
		}*/
		
		String msg=(n>0)?"업로드 성공":"업로드 실패";
		String loc="main.do";
		
		
		/*ses.invalidate();*///업로드를 누르면 무조건 지운다.
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "memo/message";
	}
	
	@RequestMapping(value="/fileup.do", method=RequestMethod.POST)
	public String resfileup(HttpSession ses, 
							@RequestParam("upfile") MultipartFile mupfile
							){
		
		
		/*System.out.println("mupfile="+mupfile);*/
		ServletContext app=ses.getServletContext();//wepapp까지
		String UP_DIR=app.getRealPath("/restaurant/Upload");
		
		String upfile=mupfile.getOriginalFilename();
		
		try{
			if(mupfile!=null){
			mupfile.transferTo(new File(UP_DIR,upfile));

			}
		}catch(IOException e){
			e.printStackTrace();
		}
		
		resfileVO vo=new resfileVO(null,upfile,null);
		arr.add(vo);
		
		ses.setAttribute("resimage",arr);
		
		
		return "restaurant/resup";
	}
	
	
	
	
	
	
/////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/resdetail.do")//식당 상세정보 보여주는 컨트롤러
	public String resdetail(Model model,
							
							@RequestParam("upnum") int upnum){
		
		//System.out.println("upnum="+upnum);
		uploadVO detailRes=uploadService.detailRes(upnum);
		List<uploadmenuVO> menu=menuService.selectAllMenu(upnum);
		List<resReviewVO> review=menuService.selectAllresReview(upnum);
		List<uploadVO> image=menuService.selectAllImg(upnum);
		List<tableupVO> tableQ=menuService.selectTableQ(upnum);
		
		//업로드한 회원 정보 가져오기
		
		
		model.addAttribute("tableq", tableQ);//테이블 수 보여주기
		model.addAttribute("detailRes",detailRes);//상세정보
		model.addAttribute("review",review);//리뷰
		model.addAttribute("menu",menu);//메뉴
		model.addAttribute("image",image);//업장 이미지
		
		return "restaurant/resdetail";
	}
	
	
	@RequestMapping(value="/resdel.do", method=RequestMethod.POST)//업로드한 식당 지우는 컨트롤러
	public String resdel(Model model,
						@RequestParam("updel") int upnum){
		
		//System.out.println("식당삭제="+upnum);
		int n=uploadService.deleteRes(upnum);
		
		//String msg=(n>0)?"삭제 성공":"삭제 실패";
		String loc=(n>0)?"main.do":"javascript:history.back()";
		
		//model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "memo/message";
	}
	
	
	
	@RequestMapping(value="/reRes.do")//업로드한 업장의 수정을 위한 폼
	public String reuploadRes(Model model, 
								@RequestParam("Rreupnum") int upnum){
		
		//업장 정보 가져오기
		uploadVO detailRes=uploadService.detailRes(upnum);
		//캐러셀 이미지 정볼 가져오기
		List<resfileVO> detailImg=uploadService.detailImg(upnum);
		
		
		model.addAttribute("detailImg",detailImg);
		model.addAttribute("detailRes",detailRes);//상세정보
		
		return "restaurant/Reresup";
	}
	
	
	@RequestMapping(value="redelImg.do", method=RequestMethod.POST)//캐러셀 이미지 삭제폼
	public String redelImg(Model model,
							@RequestParam("di") int di,
							@RequestParam("diupnum") int upnum){
		
		//System.out.println("di="+di+" upnum= "+upnum);
		int n=uploadService.deleteImg(di);
		
		//String loc="reRes.do?upnum="+upnum;
		
		/*return "memo/message";*/
		return "redirect:reRes.do?Rreupnum="+upnum;
	}
	
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)//업장 수정
	public String modify(Model model,
						 HttpSession ses,
						 @ModelAttribute("upload") uploadVO upload,	
						 @RequestParam("modiupnum") int upnum){
		
		ArrayList<resfileVO> fvo=(ArrayList<resfileVO>)ses.getAttribute("resimage2");
		
		
		int n=uploadService.updateRes(upload, fvo);
		
		
		String msg=(n>0)?"수정 성공":"수정 실패";
		String loc="resdetail.do?upnum="+upnum;
		
		
		//ses.invalidate();//업로드를 누르면 무조건 지운다.
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);

		
		return "memo/message";
	}
	
	
	//@ResponseBody
	@RequestMapping(value="/refileup.do", method=RequestMethod.POST)//
	public String reresfileup(HttpSession ses,
								Model model,
								@RequestParam("upfile") MultipartFile mupfile,
								@RequestParam("fupnum") int upnum){
		
		
		/*System.out.println("mupfile="+mupfile);*/
		ServletContext app=ses.getServletContext();//wepapp까지
		String UP_DIR=app.getRealPath("/restaurant/Upload");
		
		String upfile=mupfile.getOriginalFilename();
		
		try{
			if(mupfile!=null){
			mupfile.transferTo(new File(UP_DIR,upfile));

			}
		}catch(IOException e){
			e.printStackTrace();
		}
		
		resfileVO vo=new resfileVO(null,upfile,upnum);
		arr.add(vo);
		
		ses.setAttribute("resimage2",arr);
		
		return "redirect:reRes.do?Rreupnum="+upnum;
		
	
	}
	
///////////////////////////////////////////////////////////////////
	
	
	
//메뉴, 리뷰, 테이블 관련
	
	
	@RequestMapping(value="/resupreview.do", method=RequestMethod.POST)//식당리뷰 업로드
	public String resupreview(Model model,
							@RequestParam("upnum") int upnum,
							@ModelAttribute("resReview") resReviewVO resReview
							){
		
		//System.out.println("식당리뷰업로드="+upnum);
	    int n=menuService.insertresReview(resReview);
		
		//String msg=(n>0)?"업로드 성공":"업로드 실패";
		String loc="resdetail.do?upnum="+upnum+"#session2";
		
		//model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "memo/message";
	}
	
	
	@RequestMapping(value="/resdelreview.do", method=RequestMethod.POST)//식당리뷰삭제
	public String resdelreview(Model model,
							@RequestParam("upresnum") int upnum,
							@RequestParam("delReview") int delnum){
		
		//System.out.println("식당리뷰삭제="+upnum);
		int n=menuService.deleteresReview(delnum);
		
		//String msg=(n>0)?"삭제 성공":"삭제 실패";
		String loc="resdetail.do?upnum="+upnum+"#session2";
		
		//model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "memo/message";
	}
	
	@RequestMapping(value="/resupmenu.do", method=RequestMethod.POST)
	public String resupmenu(Model model,
							HttpSession ses,
							@ModelAttribute("upmenus") uploadmenuVO uploadmenu,
							@RequestParam("menuimg") MultipartFile menuimg,
							@RequestParam("upnum") int upnum){
		
		//System.out.println("uploadmenu"+uploadmenu);
		
		ServletContext app=ses.getServletContext();//wepapp까지
		String UP_DIR=app.getRealPath("/restaurant/Upload");
		
		String upfile=menuimg.getOriginalFilename();
		
		try{
			if(menuimg!=null){
				menuimg.transferTo(new File(UP_DIR,upfile));
				uploadmenu.setMenuimage(upfile);
			}
		}catch(IOException e){
			e.printStackTrace();
		}
		
		
		int n=menuService.insertMenu(uploadmenu);
		
		
		String msg=(n>0)?"업로드 성공":"업로드 실패";
		String loc="resdetail.do?upnum="+upnum+"#session1";
				
				model.addAttribute("msg",msg);
				model.addAttribute("loc",loc);
		
		return "memo/message";
	}
	
	@RequestMapping(value="/delmenu.do", method=RequestMethod.POST)
	public String delmenu(Model model,
							@RequestParam("upresnum2") int upnum,
							@RequestParam("menudel") int menudel){
		
		int n=menuService.deleteMenu(menudel);
		
		//String msg=(n>0)?"메 성공":"업로드 실패";
		String loc="resdetail.do?upnum="+upnum+"#session1";
		
		model.addAttribute("loc",loc);
		
		return "memo/message";
	}

	//테이블 업
		@RequestMapping(value="/uptable.do",method=RequestMethod.POST)
		public String uptable(Model model,
							@RequestParam("quantity") int quantity,
							@RequestParam("upresnum3") int upnum,	
							@ModelAttribute("tableup") tableupVO tableup){
		
		
			
		int n=0;	
		for(int i=1;i<=quantity;i++){	
			
			 n=menuService.insertTable(tableup);
			
			
		}
		
			String loc="resdetail.do?upnum="+upnum+"#session0";
			
			model.addAttribute("loc",loc);
			
			
			return "memo/message";
		}
		
	//테이블 삭제
		@RequestMapping(value="/deltable.do", method=RequestMethod.POST)
		public String deltable(Model model,
								@RequestParam("TableDelnum") int upnum){
			
			int n=menuService.delTable(upnum);
			
			String loc="resdetail.do?upnum="+upnum+"#session0";
			
			model.addAttribute("loc",loc);
			
			return "memo/message";
		}
		
///////////////////////////////////////////////////////////////////	
	
		@RequestMapping("fcal.do")
		public String fcal(HttpSession ses,
							Model model,
							@RequestParam("upnum") int upnum){
				
			
			uploadVO detailRes2=uploadService.detailRes(upnum);
			
				model.addAttribute("detailRes2",detailRes2);
				model.addAttribute("Resd",upnum);
								
				return "restaurant/firstCalendar";
								
			}
		
		
	//캘린더
		@RequestMapping(value="/cal.do",method=RequestMethod.POST)
		public String cal(Model model,
							HttpSession ses,
							@RequestParam("upnum2") int upnum,
							@RequestParam("fresdate") String fresdate){
			
			
			//테이블  보여주기
			List<tableupVO> table=uploadService.viewResTable(upnum);
			//테이블  Join보여주기
			List<tableup2VO> table2=uploadService.viewResTable2(upnum);
			//식당정보 보여주기
			uploadVO detailRes=uploadService.detailRes(upnum);
			//예약된 정보 보여주기
			List<reservationVO> reserv=uploadService.viewReserv(upnum);
			
			
			
			
			tableviewVO vo=new tableviewVO();
			ArrayList<tableviewVO> tarr=new ArrayList<tableviewVO>();//테이블 시간을 담는 arr
			
			/*yettableviewVO vo2=new yettableviewVO();
			ArrayList<yettableviewVO> tarr2=new ArrayList<yettableviewVO>();//예약된  시간을 담는 arr
*/			
			
			//opentime 쪼개기
		String hh="";//시작시간
		String mm="";//시작분
		String hh2="";//마감시간
		String mm2="";//마감분
		
		String hh3="";//시작시간
		String mm3="";//시작분
		String hh4="";//마감시간
		String mm4="";//마감분
		
	/*	String rhh="";//예약된 시간
		String rmm="";//예약된 분
*/		
		for(tableupVO ta:table){
			
			//테이블에 있는 정보를 테이블 을 1시간 간격으로 쪼갠다.
			//만약 1번 데이블이 11~13시 까지라면 11,12,13의 정보만 들어간다.

				String str=ta.getOpentime1();
				StringTokenizer st=new StringTokenizer(str,":");
				
				while(st.hasMoreTokens()){
					 hh=st.nextToken();
					 mm=st.nextToken();
					//System.out.println("hh="+hh+" mm="+mm);
					
				}//오픈시간 쪼개기 while
				
					//closetime 쪼개기
				String str2=ta.getClosetime1();
				//System.out.println("str2="+str2);
				StringTokenizer st2=new StringTokenizer(str2,":");
					
				while(st2.hasMoreTokens()){
						 hh2=st2.nextToken();
						 mm2=st2.nextToken();
						
						//System.out.println("hh="+hh+" mm="+mm+"hh2="+hh2+" mm2="+mm2);
					
				}//close시간 쪼개기 while
				
				
				//tableviewVO에 담기
				
				
				for(int a=Integer.parseInt(hh);a<Integer.parseInt(hh2);a++){
				
				
				 vo=new tableviewVO(a,ta.getTablenum(),ta.getTableuser(),Integer.parseInt(mm));
				 tarr.add(vo);
				 
				}
				
		}//전체  for
			
		
		//jsp대신 java에서 데이터를 뽑는다.
		
		for(tableviewVO t:tarr){
			//System.out.println("tarr="+t.toString());
		}
				
			//System.out.println("fresdate="+fresdate);
			
			ses.setAttribute("fresdate",fresdate);//예약할날짜정보 가져오기--
			model.addAttribute("resta",detailRes);//식당 정보 보여주기
			model.addAttribute("tarr",tarr);//시간 보여주기, 업장의 테이블 정보 보여주기--
			model.addAttribute("table",table);//테이블 보여주기--
			model.addAttribute("table2",table2);//테이블과 예약 조인, 예약된 테이블 번호, 시간, 일 가져오기--
			model.addAttribute("backupnum",upnum);//돌아가기 위한 upnum
			model.addAttribute("reserv",reserv);//예약된 테이블을 보여주기 위함
		
			
			
			return "restaurant/Calendar";
		}
		
		
		
		
		
////////////////////////////////////////////////////////예약확인			
		@RequestMapping(value="/reservation.do", method=RequestMethod.POST)
		public String reservation(Model model,
								HttpSession ses,
								@RequestParam("backupnum2") int upnum,
								@ModelAttribute("goreservation") reservationVO reservation,
								@RequestParam("re_restime") String restime,
								@RequestParam("resname") String resname,
								@RequestParam("resdate") String resdate,
								@RequestParam("phon") String phon,
								@RequestParam("location") String location
								){
			
			
			//System.out.println("reservation="+reservation.toString());
			
			//insert 예약
			int n=uploadService.insertReservation(reservation);
			
			String loc=(n>0)?"answerRes.do":"javascript:history.back()";
			
			
			ses.setAttribute("restime",restime);//예약시간
			ses.setAttribute("resname",resname);//가게이름
			ses.setAttribute("resdate",resdate);//예약 날짜
			ses.setAttribute("phon",phon);//가게 번호
			ses.setAttribute("location",location);//가게 위치
			ses.setAttribute("upnum2", upnum);//되돌아가기
			
			
			model.addAttribute("loc",loc);
			
			
			return "memo/message";
					
		}
	
		@RequestMapping("/answerRes.do")//에약확인
		public String viewres(){

			return "restaurant/answerRes";
		}
		
		@RequestMapping("/checkRes.do")//회원 예약정보 확인하기
		public String checkRes(Model model,
								@RequestParam("idx") int idx){
			
			List<reservation2VO> res=uploadService.selectResvervation(idx);
			
			model.addAttribute("res",res);//회원예약정보 가져오기
			
			return "login/checkRes";
		}
		
		@RequestMapping(value="/delResve.do", method=RequestMethod.POST)//회원이 예약 취소하기
		public String delResve(Model model,
								@RequestParam("resvnum") int num,
								@RequestParam("residx") int idx){
			
			int n=uploadService.delResve(num);
			
			String loc="checkRes.do?idx="+idx;
			
			model.addAttribute("loc",loc);
			
			return "memo/message";
		}
		
		@RequestMapping("/ownerCheckRes.do")//업주예약정보 확인하기
		public String ownerCheckRes(Model model,
								@RequestParam("idx") int idx){
			//예약 내역 찾아오기
			List<OwnerCheckVO> owner=uploadService.selectOwnerCheck(idx);
			
			//업주가 페널티 등록 여부
			List<flagVO> flag=uploadService.selectflag(idx);
			
			int nullflag=0;
			if(flag.size()==0){
				 nullflag=1;
			}
			//System.out.println("nullflag="+nullflag);
			
			model.addAttribute("owner",owner);//회원예약정보 가져오기
			model.addAttribute("flag",flag);//업주가 등록한 플래그 정보 가져오기 
			model.addAttribute("nullflag",nullflag);//사이즈가 0이면
			
			return "login/ownerCheckRes";
		}
		
		
		
		@RequestMapping(value="/deloResve.do", method=RequestMethod.POST)//업주가 예약취소하기
		public String deloResve(Model model,
								@RequestParam("oresvnum") int num,
								@RequestParam("oresidx") int idx){
			
			int n=uploadService.deloResve(num);
			
			String loc="ownerCheckRes.do?idx="+idx;
			
			model.addAttribute("loc",loc);
			
			return "memo/message";
		}
		
		
		
		@RequestMapping(value="/uppResve.do", method=RequestMethod.POST)//업주가 패널티 주기
		public String uppResve(Model model,
								@RequestParam("presvnum") int idx,
								@RequestParam("oresvnum") int oidx,
								@ModelAttribute("gopres") flagVO flag
								){
			
			//회원의 페널티 정보를 가져와서 +1을 해준다.
			List<MemberVO> mem=uploadService.selectMember(idx);
			
			int penalty=0;
			
			for(MemberVO vo: mem){
				
				if(vo.getPenalty()==null){
					
				    penalty=0;
				}else{
					
					penalty=vo.getPenalty()+1;
					
				}
			}

			
			Map<String, Integer> map=new HashMap<String, Integer>();
			map.put("idx", idx);
			map.put("penalty", penalty);
			
			int n=uploadService.uppenalty(map, flag);
			
			System.out.println("n="+n);
			
			String loc="ownerCheckRes.do?idx="+oidx;
			
			model.addAttribute("loc",loc);
			
			return "memo/message";
		}
		
}
