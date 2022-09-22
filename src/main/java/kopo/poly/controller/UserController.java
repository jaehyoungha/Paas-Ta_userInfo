package kopo.poly.controller;

import kopo.poly.dto.MailDTO;
import kopo.poly.dto.UserDTO;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;


@Slf4j
@Controller
public class UserController {

    @Resource(name = "UserService")
    private IUserInfoService userInfoService;

    @Resource(name = "MailService")
    private IMailService mailService;


    @GetMapping(value = "/main")
    public String mainPage() {
        log.info(this.getClass().getName() + "mainPage start!!");
        log.info(this.getClass().getName() + "mainPage end!!");
        return "/notice/main";
    }
    @GetMapping(value = "logout")
    public String logout(HttpServletRequest request) throws Exception {

        log.info(this.getClass().getName() + ".logout Start!!");

        HttpSession session = request.getSession();

        session.invalidate();

        return "/user/login";
    }

    @GetMapping(value = "signUpPage")
    public String signUpPage() {
        log.info(this.getClass().getName() + "signUpPage Start!!");
        log.info(this.getClass().getName() + "signUpPage End!!");
        return "/user/signUp";
    }

    @PostMapping(value = "signUp")
    public String signUp(UserDTO uDTO,Model model) throws Exception {
        log.info(this.getClass().getName() + " signUp Start!!");

        String msg = "";
        String url = "";


        int res = userInfoService.insertUserInfo(uDTO);
        log.info("회원가입 결과는 :" + res);

        if (res == 1) {
            msg = "회원가입되었습니다.";
            url = "/loginPage";
        } else if (res == 2) {
            msg = "이미 가입된 이메일 주소입니다.";
            url = "/signUpPage";
        } else {
            msg = "회원가입에 실패했습니다.";
            url = "/signUpPage";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url",url);
        model.addAttribute("uDTO", uDTO);

        uDTO = null;
        log.info(this.getClass().getName() + "signUp End!!");
        return "/user/alert";
    }

    @GetMapping(value = "loginPage")
    public String loginPage() throws Exception {
        log.info(this.getClass().getName() + "loginPage Start!!");
        log.info(this.getClass().getName() + "loginPage End!!");

        return "/user/login";
    }
    @RequestMapping (value = "login",method = {RequestMethod.POST,RequestMethod.GET}
)
    public String login(HttpSession session,UserDTO uDTO, Model model)throws Exception{
        log.info(this.getClass().getName()+"login Start!");

        int res = 0;
        String msg = "";
        String url = "";

        try{
            res = userInfoService.login(uDTO);
            if (res ==1) {
                session.setAttribute("user_Id", uDTO.getUserId());
                log.info("user_Id :" + session);
                msg = "로그인되었습니다.";
                url = "/user/main";
            } else {
                msg = "아이디가 없거나 비밀번호를 잘못 입력하셨습니다.";
                url = "/user/login";
            }
        }catch (Exception e) {
            res = 2;
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName()+ " login end!");
            model.addAttribute("res",String.valueOf(res));
            model.addAttribute("url",url);
        }

        return "/user/alert";
        }


    @GetMapping(value = "updatePage")
    public String updatePage() {
        log.info(this.getClass().getName() + "updatePage Start!!");
        log.info(this.getClass().getName() + "updatePage End!!");
        return "/user/update";
    }

    @PostMapping(value = "doUpdate")
    public String doUpdate(UserDTO userDTO) throws Exception {
        log.info(this.getClass().getName() + "doUpdate Start!!");
        log.info("가져온 비밀번호는 : "+ userDTO.getUserPwd());

        log.info(this.getClass().getName() + "doUpdate End!!");
        return "/";
    }
    @ResponseBody
    @PostMapping(value = "sendmail")
    public Map<String, String> sendmail(HttpServletRequest request, UserDTO uDTO) throws Exception {
        log.info(this.getClass().getName() + "sendmail start!!");
        // 이메일 주소 확인
        log.info("email :" + uDTO.getUserEmail());

        Random random = new Random();
        int randomPin = random.nextInt(888888) + 111111; //인증번호

        String title = "반갑습니다. 환영합니다.";
        String contents = "(인증번호 :" + randomPin + ")";
        log.info("randomPIN: " + randomPin);

        MailDTO mDTO = new MailDTO();
        mDTO.setTomail(uDTO.getUserEmail());
        mDTO.setTitle(title);
        mDTO.setContents(contents);
        mDTO.setRandompin(randomPin);

        int res = mailService.doSendmail(mDTO);

        if (res == 1) {
            log.info(this.getClass().getName() + "메일 발송 성공!");
        } else {
            log.info(this.getClass().getName() + "메일 발송 실패!");
        }
//        jsp에서 실시간으로 res,randomPin값을 받기 위해서 Map형태로 변환
        Map<String , String> pMap = new HashMap<>();
        pMap.put("res", String.valueOf(res));
        pMap.put("ramdomPin", String.valueOf(randomPin));

        log.info(this.getClass().getName() + "sendmail end!!");
        return pMap;
    }
}