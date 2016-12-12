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
@Controller()
@RequestMapping(value = "/chat")
public class ChatController {
    private static Logger logger = Logger.getLogger(ChatController.class);

    /**
     * 获取所有礼品(分页)
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView chat() {
        ModelAndView modelAndView = new ModelAndView("chat/echo");
        return modelAndView;
    }



}
