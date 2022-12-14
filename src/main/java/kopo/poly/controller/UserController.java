package kopo.poly.controller;

import kopo.poly.dto.MailDTO;
import kopo.poly.dto.UserDTO;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.EncryptUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Slf4j
@RequestMapping("/user")
@RequiredArgsConstructor
@Controller
public class UserController {

    private final IUserInfoService userInfoService;
    private final IMailService mailService;

    private String alt_title = "";
    private String alt_state = "";
    private String msg = "";
    private String url = "";
    private int res = 0;
    @GetMapping(value = "signUpPage") //회원가입 페이지
    public String signUpPage() {
        log.info(this.getClass().getName() + "signUpPage Start!!");
        log.info(this.getClass().getName() + "signUpPage End!!");
        return "/user/signUp";
    }
    @PostMapping(value = "signUp")
    public String signUp(UserDTO uDTO, Model model) throws Exception {
        log.info(this.getClass().getName() + " signUp Start!!");

        log.info("userID: " +uDTO.getUserId() );
        log.info("userPWD : " +uDTO.getUserPwd());
        log.info("userEmail: " +uDTO.getUserEmail() );
        log.info("userName : " + uDTO.getUserName());
        log.info("addr1: " +uDTO.getAddr1() );
        log.info("addr2 : " +uDTO.getAddr2() );
        try {res = userInfoService.insertUserInfo(uDTO);
            log.info("회원가입 결과는 :" + res);
            if (res == 1) {
                alt_title = "회원가입";
                msg = "회원가입되었습니다.";
                alt_state = "success";
                url = "user/loginPage";
            } else {
                alt_title = "회원가입";
                msg = "회원가입에 실패했습니다.";
                alt_state = "error";
                url = "user/signUpPage";
            }
        } catch (Exception e ) {
            res = 2;
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            model.addAttribute("alt_title", alt_title);
            model.addAttribute("alt_state", alt_state);
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);

        }
        uDTO = null;
        log.info(this.getClass().getName() + "signUp End!!");
        return "/sweetalert";
    }
    @GetMapping(value = "loginPage") //로그인 페이지
    public String loginPage() {
        log.info(this.getClass().getName() + "loginPage Start!!");
        log.info(this.getClass().getName() + "loginPage End!!");

        return "/user/login";
    }

    @PostMapping(value = "login")
    public String login(HttpSession session, UserDTO uDTO, Model model, HttpServletResponse response) throws Exception {
        log.info(this.getClass().getName() + "login Start!");

        try {
            res = userInfoService.login(uDTO);
            if (res == 1) {
                session.setAttribute("userId", uDTO.getUserId());
                log.info("user_Id :" + uDTO.getUserId());
                msg = "로그인되었습니다.";
                alt_title = "로그인";
                alt_state = "success";
                url = "index";
            } else {
                msg = "아이디가 없거나 비밀번호를 잘못 입력하셨습니다.";
                alt_title = "로그인";
                alt_state = "error";
                url = "user/loginPage";
            }
        } catch (Exception e) {
            res = 2;
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName() + " login end!");
            model.addAttribute("alt_title", alt_title);
            model.addAttribute("alt_state", alt_state);
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);

        }

        return "/sweetalert";
    }
    @GetMapping(value = "findPassword")
    public String findPassword() {
        log.info(this.getClass().getName()+ ".findPassword Start!!");

        log.info(this.getClass().getName()+ ".findPassword End!!");
        return "/user/findPassword";
    }
    @PostMapping(value = "passwordChg")
    public String passwordChg (UserDTO uDTO, MailDTO mDTO, ModelMap model) throws Exception {
        log.info(this.getClass().getName()+".passwordChg Start!!");

        res = userInfoService.RandomPasswordSendMail(uDTO);
        log.info("비밀번호 찾기 결과는 : " + res);
        try{
            if (res ==1) {
                msg = "임시 비밀번호가 발급되었습니다.";
                alt_title = "메일 발송";
                alt_state = "success";
                url = "user/loginPage";
            }
            else {
                msg = "오류로 인해 임시비밀번호가 발급되지 않았습니다.";
                alt_title = "메일 발송";
                alt_state = "error";
                url = "user/loginPage";
            }
        } catch (Exception e) {
            res = 2;
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName()+".passwordChg End!!");
            model.addAttribute("alt_title", alt_title);
            model.addAttribute("alt_state", alt_state);
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);

        }

        return "sweetalert";
    }
    @GetMapping(value = "myPage") //회원정보 수정 페이지
    public String updatePage(HttpSession session,Model model) throws Exception {
        log.info(this.getClass().getName() + "updatePage Start!!");
        String userId = (String) session.getAttribute("userId");

        UserDTO uDTO = userInfoService.getUserInfo(userId);


        uDTO.setUserEmail(EncryptUtil.decAES128CBC(uDTO.getUserEmail()));
        log.info("잘 가져왔니? : " + uDTO.getUserId());
        model.addAttribute("uDTO",uDTO);
        log.info(this.getClass().getName() + "updatePage End!!");
        return "/user/myPage";
    }
    @PostMapping(value = "doUpdate")
    public String doUpdate(UserDTO uDTO, HttpSession session, Model model) throws Exception {
        log.info(this.getClass().getName() + "doUpdate Start!!");
        res = userInfoService.updateUserInfo(uDTO);
        log.info("userName : " +uDTO.getUserName() );
        if (res == 1) {
            log.info("user_Id :" + uDTO.getUserId());
            msg = "수정되었습니다.";
            alt_title = "수정";
            alt_state = "success";
            url = "user/myPage";
        } else {
            msg = "수정에 실패했습니다.";
            alt_title = "수정";
            alt_state = "error";
            url = "user/updatePage";
        }
        log.info(this.getClass().getName() + " doUpdate end!");
        model.addAttribute("alt_title", alt_title);
        model.addAttribute("alt_state", alt_state);
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "/sweetalert";
    }

    @GetMapping(value = "logout") //로그아웃
    public String logout(HttpServletRequest request,HttpSession session) {

        log.info(this.getClass().getName() + ".logout Start!!");


        session.invalidate();

        log.info(this.getClass().getName() + ".logout End!!");
        return "/user/login";
    }
    @GetMapping(value ="/index")
    public String index() throws Exception {
        return "/index";
    }
}