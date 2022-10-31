package kopo.poly.controller.rest;

import kopo.poly.dto.MailDTO;
import kopo.poly.dto.UserDTO;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Slf4j
@RequestMapping("/user")
@RestController
@RequiredArgsConstructor
public class UserRestController {

    private final IUserInfoService userInfoService;
    private final IMailService mailService;
    private int res =0;
    @PostMapping(value = "sendmail") // 메일 발송하기
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

        res = mailService.doSendmail(mDTO);

        if (res == 1) {
            log.info(this.getClass().getName() + "메일 발송 성공!");
        } else {
            log.info(this.getClass().getName() + "메일 발송 실패!");
        }
//        jsp에서 실시간으로 res,randomPin값을 받기 위해서 Map형태로 변환
        Map<String, String> pMap = new HashMap<>();
        pMap.put("res", String.valueOf(res));
        pMap.put("ramdomPin", String.valueOf(randomPin));

        log.info(this.getClass().getName() + "sendmail end!!");
        return pMap;
    }
//    @PostMapping(value = "RandomPasswordSendMail")
//    public String RandomPasswordSendMail(HttpServletRequest request, UserDTO uDTO) throws Exception{
//        log.info(this.getClass().getName()+".RandomPasswordSendMail Start!!");
//
//        log.info("email" + uDTO.getUserEmail());
//
//        String RandomPassword = RandomStringUtil.getRamdomPassword(8);
//
//
//        log.info(this.getClass().getName()+".RandomPasswordSendMail End!!");
//    }
}
