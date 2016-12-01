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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        logger.debug("register");
        ModelAndView modelAndView = new ModelAndView("register");
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        logger.debug("login");
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @RequestMapping(value = "/quit", method = RequestMethod.GET)
    public ModelAndView quit(HttpSession session) {
        session.removeAttribute("account");
        logger.debug("quit");
        ModelAndView modelAndView = new ModelAndView("redirect:/account/login");
        return modelAndView;
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public ModelAndView doRegister(Account account) {
        logger.debug("doRegister");
        logger.debug("account" + account.toString());
        ModelAndView modelAndView = new ModelAndView("register");
        accountService.register(account);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public SingleValue dologin(HttpServletRequest httpServletRequest, HttpSession session) {
        String name = httpServletRequest.getParameter("name");
        String password = httpServletRequest.getParameter("password");

//        ModelAndView modelAndView = new ModelAndView("redirect:/question/questionPage?page=1");
        Account account = accountService.login(name, password);
        if (account != null) {
            session.setAttribute("account", account);
            logger.error("登录成功:" + account.getName());
            return new SingleValue(1,"登录成功");
        } else {
            logger.error("登录失败");
            return new SingleValue(0,"账号或密码错误，请重新登录");
        }
    }

}
