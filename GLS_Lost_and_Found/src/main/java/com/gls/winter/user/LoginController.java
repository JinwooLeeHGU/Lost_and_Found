package com.gls.winter.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gls.winter.BoardService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	UserServiceImpl service;
	@Autowired
	BoardService boardService;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "login";
//	}
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(String t, Model model) {

//		/* 구글code 발행 */
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//		System.out.println("구글:" + url);
//
//		model.addAttribute("google_url", url);

		return "login";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
	public String googleCallback(HttpSession session, Model model, @RequestParam(required = false) HttpServletRequest request)
			throws IOException {
		System.out.println("googleCallback: Google login success");
		model.addAttribute("list", boardService.getBoardList());
		
//		String username = request.getParameter("Given Name");
////		String username = request.getParameter("username");
//		
////		session.setAttribute("userid", userid);
//		session.setAttribute("username", username);
		return "list"; 
	}
	/**
	 * Authentication Code를 전달 받는 엔드포인트
	 **/
//	@GetMapping("google/auth")
//	public String googleAuth(Model model, @RequestParam(value = "code") String authCode)
//			throws JsonProcessingException {
//		
//		//HTTP Request를 위한 RestTemplate
//		RestTemplate restTemplate = new RestTemplate();
//
//		//Google OAuth Access Token 요청을 위한 파라미터 세팅
//		GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
//				.builder()
//				.clientId(clientId)
//				.clientSecret(clientSecret)
//				.code(authCode)
//				.redirectUri("http://localhost:8080/login/google/auth")
//				.grantType("authorization_code").build();
//
//		
//		//JSON 파싱을 위한 기본값 세팅
//		//요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
//		mapper.setSerializationInclusion(Include.NON_NULL);
//
//		//AccessToken 발급 요청
//		ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam, String.class);
//
//		//Token Request
//		GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
//		});
//
//		//ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
//		String jwtToken = result.getIdToken();
//		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
//		.queryParam("id_token", jwtToken).encode().toUriString();
//		
//		String resultJson = restTemplate.getForObject(requestUrl, String.class);
//		
//		Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
//		model.addAllAttributes(userInfo);
//		model.addAttribute("token", result.getAccessToken());
//
//
//
//		return "/google.html";
//
//	}

	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginCheck(HttpSession session, UserVO vo, HttpServletRequest request) {
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		session.setAttribute("userid", userid);
		session.setAttribute("username", username);
		System.out.println(username);
		
		UserVO loginvo = service.getUser(vo);
		if (loginvo != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("login", loginvo);
			
			returnURL = "redirect:/board/list";
		} else {
			System.out.println("로그인 실패!");
			returnURL = "redirect:/login/login";
		}
		return returnURL;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		session.removeAttribute("userid");
		session.removeAttribute("username");
		return "redirect:/login/login";
	}

}
