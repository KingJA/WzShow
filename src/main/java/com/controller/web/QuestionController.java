package com.controller.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller
@RequestMapping(value = "/question")
public class QuestionController {
    private static Logger logger = Logger.getLogger(NewsController.class);

    @RequestMapping(value = "publish", method = RequestMethod.GET)
    public ModelAndView publish() {
        logger.debug("publish");
        ModelAndView modelAndView = new ModelAndView("publish");
        return modelAndView;
    }



}
