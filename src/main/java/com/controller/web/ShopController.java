package com.controller.web;

import com.bean.Gift;
import com.bean.SingleValue;
import com.dao.ShopDao;
import com.service.ShopService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/shop")
public class ShopController {
    @Autowired
    private ShopDao shopDao;
    @Autowired
    private ShopService shopService;
    private static Logger logger = Logger.getLogger(NewsController.class);

    /**
     * 获取所有礼品
     * @return
     */
    @RequestMapping(value = "/{currentPage}", method = RequestMethod.GET)
    public ModelAndView shop(@PathVariable int currentPage) {
        logger.error("==========================shop===========================");
        ModelAndView modelAndView = new ModelAndView("shop");
        Page<Gift> gitfPage = shopService.getGiftByPage(currentPage, 8);
        modelAndView.addObject("gitfPage",gitfPage);
        return modelAndView;
    }

    /**
     * 购买礼品
     * @return
     */

    @ResponseBody
    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public SingleValue buy(@RequestParam("giftId") long giftId, @RequestParam("giftCount") int giftCount, @RequestParam("giftCost") int giftCost, @RequestParam("accountId") long accountId) {
        logger.error("==========================giftId==========================="+giftId);
        logger.error("==========================giftCount==========================="+giftCount);
        logger.error("==========================giftCost==========================="+giftCost);
        logger.error("==========================accountId==========================="+accountId);
        logger.error("==========================accountId==========================="+accountId);
        SingleValue singleValue = shopService.buyGift(accountId, giftId, giftCount, giftCost);
        return singleValue;
    }


}
