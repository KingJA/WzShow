package com.controller;

import com.bean.Account;
import com.bean.AppResult;
import com.dao.DaoAccount;
import com.service.AccountService;
import com.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/account")
public class AccountController {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    DaoAccount daoAccount;

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public ModelAndView register() {
        logger.debug("register");
        ModelAndView modelAndView = new ModelAndView("register");
        return modelAndView;
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login() {
        logger.debug("login");
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @RequestMapping(value = "doRegister", method = RequestMethod.POST)
    public ModelAndView doRegister(Account account) {
        logger.debug("doRegister");
        logger.debug("account" + account.toString());
        ModelAndView modelAndView = new ModelAndView("register");
        accountService.register(account);
        return modelAndView;
    }

    @RequestMapping(value = "doLogin", method = RequestMethod.POST)
    public ModelAndView dologin(HttpServletRequest httpServletRequest) {
        String name = httpServletRequest.getParameter("name");
        String password = httpServletRequest.getParameter("password");
        ModelAndView modelAndView = new ModelAndView("login");
        Account account = accountService.login(name, password);
        if (account != null) {
            logger.error("登录成功:" + account.getName());
        } else {
            logger.error("登录失败");
        }
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping(value = "doLogin.json", method = RequestMethod.POST)
    public AppResult doApplogin(HttpServletRequest httpServletRequest) {
        String name = httpServletRequest.getParameter("name");
        String password = httpServletRequest.getParameter("password");
        Account account = accountService.login(name, password);
        AppResult<Account> accountAppResult = new AppResult<Account>();
        if (account != null) {
            String token = StringUtil.getUUID();
            account.setToken(token);
            daoAccount.insertToken(token,name);
            accountAppResult.setResultCode(0).setResultText("登录成功").setDate(account);
        }else{
            accountAppResult.setResultCode(4).setResultText("登录失败").setDate(account);
        }
        return accountAppResult;
    }

}
