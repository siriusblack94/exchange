package com.blockeng.web.event;

import com.blockeng.api.IpLocApi;
import com.blockeng.dto.UserDetailsMapper;
import com.blockeng.entity.IpInfo;
import com.blockeng.framework.security.UserDetails;
import com.blockeng.framework.utils.IpUtil;
import com.blockeng.repository.UserLoginLog;
import com.blockeng.repository.UserLoginLogRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

/**
 * @author qiang
 */
@Component
@Log4j2
public class LoginSuccessHandler {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private UserLoginLogRepository userLoginLogRepository;

    @EventListener({AuthenticationSuccessEvent.class, InteractiveAuthenticationSuccessEvent.class})
    public void processAuthenticationSuccessEvent(AbstractAuthenticationEvent event) {
        //用户名密码认证
        if (event.getSource() instanceof UsernamePasswordAuthenticationToken) {
            UserDetails userDetails = (UserDetails) event.getAuthentication().getPrincipal();
            UserLoginLog userLoginLog = UserDetailsMapper.INSTANCE.toUserLoginLog(userDetails);
            String ip = IpUtil.getIpAddr(request);
            IpInfo ipInfo = IpLocApi.getIpInfo(ip);
            userLoginLog.setUserId(userDetails.getId())
                    .setUserAgent(request.getHeader(HttpHeaders.USER_AGENT))
                    .setLoginIp(ip);
            if (Optional.ofNullable(ipInfo).isPresent()) {
                userLoginLog.setLoginAddress(ipInfo);
            }
            userLoginLogRepository.save(userLoginLog);
        }
    }
}
