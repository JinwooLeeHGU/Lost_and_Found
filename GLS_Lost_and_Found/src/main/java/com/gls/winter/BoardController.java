package com.gls.winter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String select() {
		return "select";
	}

	@RequestMapping(value = "/mylist", method = RequestMethod.GET)
	public String mylist() {
		return "mylist";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardlist(Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "list";
	}

	@RequestMapping(value = "/searchlist", method = RequestMethod.GET)
	public ModelAndView searchlist(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 레코드의 갯수 계산
		int count = boardService.countArticle(searchOption, keyword);

		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);

//		System.out.println("->" + searchOption + " " + keyword);
//		List<BoardVO> list = boardService.listAll(searchOption, keyword);

		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); // 검색키워드
		map.put("boardPager", boardPager);

		System.out.println("->" + count);

		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("searchlist"); // 뷰를 searchlist.jsp로 설정
		return mav; // searchlist.jsp로 list가 전달된다.
	}

	@RequestMapping(value = "/list_found", method = RequestMethod.GET)
	public String boardlist_found(Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "list_found";
	}

	@RequestMapping(value = "/list_lost", method = RequestMethod.GET)
	public String boardlist_lost(Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "list_lost";
	}

	@RequestMapping(value = "/my_page", method = RequestMethod.GET)
	public String myPage() {
		return "my_page";
	}

	@RequestMapping(value = "/log_out", method = RequestMethod.GET)
	public String logout() {
		return "log_out";
	}

	@RequestMapping(value = "/chat_page", method = RequestMethod.GET)
	public String chatpage() {
		return "chat_page";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addPost() {
		return "addpostform";
	}

	@RequestMapping(value = "/addok", method = RequestMethod.POST)
	public String addPostOK(BoardVO vo) {
		if (boardService.insertBoard(vo) == 0)
			System.out.println("데이터 추가 실패");
		else
			System.out.println("데이터 추가 성공!!");
		return "redirect:list";
	}

	@RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
	public String editPost(@PathVariable("id") int id, Model model) {
		BoardVO boardVO = boardService.getBoard(id);
		model.addAttribute("u", boardVO);
		return "editform";
	}

	@RequestMapping(value = "/editok", method = RequestMethod.POST)
	public String editPostOk(BoardVO vo) {
		if (boardService.updateBoard(vo) == 0)
			System.out.println("데이터 수정 실패 ");
		else
			System.out.println("데이터 수정 성공!!!");
		return "redirect:list";
	}

	@RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
	public String deletePost(@PathVariable("id") int id) {
		int i = boardService.deleteBoard(id);
		if (i == 0)
			System.out.println("데이터 삭제 실패 ");
		else
			System.out.println("데이터 삭제 성공!!!");
		return "redirect:../list";
	}

}
