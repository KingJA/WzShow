package com.controller.web;

import com.dao.AccountDao;
import com.service.AccountService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/home")
public class HomeController {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;


    @RequestMapping(value = "search", method = RequestMethod.POST)
    public ModelAndView search(@RequestParam("keyword") String keyword) {
        ModelAndView modelAndView = new ModelAndView();
        logger.debug("search");
        logger.debug("keyword==========="+keyword);
        return modelAndView;
    }

}
