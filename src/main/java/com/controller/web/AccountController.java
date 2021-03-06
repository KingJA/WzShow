package com.controller.web;

import com.bean.Account;
import com.bean.SingleValue;
import com.dao.AccountDao;
import com.service.AccountService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/account")
public class AccountController {
    private static Logger logger = Logger.getLogger(AccountController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;

    /**
     * 注册页面
     *
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView modelAndView = new ModelAndView("register");
        return modelAndView;
    }

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    /**
     * 退出逻辑
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/quit", method = RequestMethod.GET)
    public ModelAndView quit(HttpSession session) {
        session.removeAttribute("account");
        ModelAndView modelAndView = new ModelAndView("redirect:/account/login");
        return modelAndView;
    }

    /**
     * 注册逻辑
     *
     * @param account
     * @return
     */
    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public ModelAndView doRegister(Account account) {
        ModelAndView modelAndView = new ModelAndView("register");
        accountService.register(account);
        return modelAndView;
    }

    /**
     * 登录逻辑
     *
     * @param name
     * @param password
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public SingleValue dologin(@RequestParam("name") String name, @RequestParam("password") String password, HttpSession session) {
        Account account = accountService.login(name, password);
        if (account != null) {
            session.setAttribute("account", account);
            session.setAttribute("accountId", account.getAccountId());
            return new SingleValue(1, "登录成功");
        } else {
            logger.error("登录失败");
            return new SingleValue(0, "账号或密码错误，请重新登录");
        }
    }

}
