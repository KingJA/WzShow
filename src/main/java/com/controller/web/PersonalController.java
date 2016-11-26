package com.controller.web;

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

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/personal")
public class PersonalController {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView personal() {
        ModelAndView modelAndView = new ModelAndView("personal");
        return modelAndView;
    }

    /**
     * 我的问题
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "myAsk", method = RequestMethod.GET)
    public SingleValue myAsk() {
        SingleValue singleValue = new SingleValue("<div class=\"selectItem\">\n" +
                "                                <h3 class=\"selectTitle\">我提问的怎么提高支付宝芝麻分</h3>\n" +
                "                                <p class=\"selectContent\">\n" +
                "                                    多使用支付宝信用卡还款功能并及时还。及时还信用卡可以证明你的偿还能力没问题。关联的信用卡越多，信用额度越高，芝麻分越有可能提升。</p>\n" +
                "                            </div>");
        logger.debug("myAsk");
        return singleValue;
    }
    /**
     * 我的回答
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "myAnswer", method = RequestMethod.GET)
    public SingleValue myAnswer() {
        SingleValue singleValue = new SingleValue("<div class=\"selectItem\">\n" +
                "                                <h3 class=\"selectTitle\">我回答的怎么提高支付宝芝麻分</h3>\n" +
                "                                <p class=\"selectContent\">\n" +
                "                                    多使用支付宝信用卡还款功能并及时还。及时还信用卡可以证明你的偿还能力没问题。关联的信用卡越多，信用额度越高，芝麻分越有可能提升。</p>\n" +
                "                            </div>");
        logger.debug("myAnswer");
        return singleValue;
    }


}
