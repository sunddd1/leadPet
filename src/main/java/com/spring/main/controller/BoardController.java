package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.ReplyDTO;
import com.spring.main.service.BoardService;

@RestController
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService service;
	
	///,@RequestParam String dog_cat
	@RequestMapping(value = "/BoardList", method = RequestMethod.GET)
	public ModelAndView BoardList(Model model) {
		logger.info("댕냥노하우 / 경험기 게시판 리스트 : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/Experience");
		return mav;
	}
	
	@RequestMapping(value = "/BoardTab/{dog_cat}", method = RequestMethod.GET)
	public HashMap<String, Object> BoardList(Model model,@PathVariable String dog_cat) {
		logger.info("댕냥노하우 / 경험기 게시판 리스트 : "+dog_cat);
		return service.BoardTab(dog_cat);
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public ModelAndView writeForm(Model model, HttpSession session,@RequestParam String id) {
		logger.info("댕냥노하우 / 경험기 게시판 글쓰기 폼 : "+id);
		//업로드할 파일 이름을 저장한 HashMap 을 생성해서 session 에 저장		
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return service.writeForm(id);
	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public ModelAndView uploadForm(Model model) {	
		ModelAndView mav = new ModelAndView();
		logger.info("사진 올리기 폼");
		mav.setViewName("/Board/uploadForm");
		return mav;
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {		
		logger.info("업로드 요청");			
		return service.fileUpload(file,session);
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView write(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("댕냥노하우 / 경험기 게시판 글작성 : " +params);
		return service.write(params,session);
	}
	
	@RequestMapping(value = "/fileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> fileDelete(
			@RequestParam String newfileName, HttpSession session) {		
		logger.info(newfileName+" 파일 삭제 요청");			
		return service.fileDelete(newfileName,session);
	}
	
	@RequestMapping(value = "/BoardDel", method = RequestMethod.GET)
	public ModelAndView BoardDel(Model model) {
		logger.info("댕냥노하우 / 경험기 게시판 삭제 : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/Experience");
		return mav;
	}

	
	@RequestMapping(value = "/BoardDetail", method = RequestMethod.GET)
	public ModelAndView BoardDetail(Model model, @RequestParam String bbs_idx) {
		logger.info("댕냥노하우 / 경험기 게시판 상세보기 : "+bbs_idx);
		return service.BoardDetail(bbs_idx);
	}
	
	@RequestMapping(value = "/recoConfirm", method = RequestMethod.GET)
	public Boolean recoConfirm(Model model, @RequestParam String id , String bbs_idx) {
		logger.info("추천여부 확인 : "+id+bbs_idx);
		return service.recoConfirm(id,bbs_idx);
	}
	
	@RequestMapping(value = "/recoUp", method = RequestMethod.GET)
	public Boolean recoUp(Model model, @RequestParam String id , String bbs_idx) {
		logger.info("추천 버튼(+1): "+id+bbs_idx);
		return service.recoUp(id,bbs_idx);
	}
	
	@RequestMapping(value = "/recoDown", method = RequestMethod.GET)
	public Boolean recoDown(Model model, @RequestParam String id , String bbs_idx) {
		logger.info("추천취소 버튼(-1): "+id+bbs_idx);
		return service.recoDown(id,bbs_idx);
	}
	
	@RequestMapping(value = "/replyList", method = RequestMethod.POST)
	public HashMap<String, Object> replyList(Model model, @RequestParam String id , String bbs_idx) {
		logger.info("댓글리스트 불러오기: "+id+bbs_idx);
		return service.replyList(id,bbs_idx);
	}
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public int replyWrite(@ModelAttribute ReplyDTO reply) {
		logger.info("댓글작성 불러오기: "+reply.getId()+reply.getReply_content()+reply.getBbs_idx());
		return service.replyWrite(reply);
	}
	@RequestMapping(value = "/replyUpdateForm", method = RequestMethod.GET)
	public HashMap<String, Object> replyUpdateForm(Model model, @RequestParam HashMap<String, Object> map ) {
		logger.info("댓글 수정 폼 불러오기: " + map);
		return service.replyUpdateForm(map);
	}
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public int replyUpdate(Model model, @ModelAttribute ReplyDTO reply ) {
		logger.info("댓글 수정 불러오기: " + reply);
		return service.replyUpdate(reply);
	}
	@RequestMapping(value = "/replyDel/{reply_idx}", method = RequestMethod.GET)
	public int replyDel(Model model,@PathVariable String reply_idx) {
		logger.info("블라인드 할 댓근  : "+reply_idx);
		return service.replyDel(reply_idx);
	}
	

	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.GET)
	public ModelAndView BoardUpdate(Model model, HttpSession session,@RequestParam String bbs_idx) {
		logger.info("댕냥노하우 / 경험기 게시판 수정하기 폼 이동 : ");
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return service.BoardUpdateForm(bbs_idx);
	}
	

	//메인으로 가야할까galTop3
	@RequestMapping(value = "/mainTop", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> bbsTop5(@RequestParam String type) {
		logger.info("타입  : " + type);

		return service.mainTop(type);
	}
}
