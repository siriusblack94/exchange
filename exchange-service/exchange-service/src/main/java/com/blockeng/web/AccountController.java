package com.blockeng.web;

import com.blockeng.framework.http.Response;
import com.blockeng.framework.security.UserDetails;
import com.blockeng.service.AccountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 资产管理控制类
 * by crow
 * 2018年5月14日18:31:05
 */
@RestController
@RequestMapping("/account")
@Slf4j
@Api(value = "数字货币-资产管理", description = "数字货币-资产管理")
public class AccountController {

    @Autowired
    private AccountService accountService;

    /**
     * 资金账户列表
     *
     * @param userDetails
     * @return
     */
    @GetMapping(value = "/accounts")
    @ApiOperation(value = "资金账户列表", notes = "资金账户", httpMethod = "GET", authorizations = {@Authorization(value = "Authorization")})
    @PreAuthorize("isAuthenticated()")
    public Object accounts(@ApiIgnore @AuthenticationPrincipal UserDetails userDetails) {
        return Response.ok(accountService.countAssets(userDetails.getId()));
    }


}
