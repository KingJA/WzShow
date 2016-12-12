package com.controller.web;

import com.bean.*;
import com.dao.AccountDao;
import com.dao.PersonalDao;
import com.service.PersonalService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/personal")
public class PersonalController {
    private static Logger logger = Logger.getLogger(PersonalController.class);
    @Autowired
    PersonalDao personalDao;
    @Autowired
    AccountDao accountDao;

    @Autowired
    PersonalService personalService;


    /**
     * 个人中心主页
     * @param accountId
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}", method = RequestMethod.GET)
    public ModelAndView personal(@PathVariable long accountId, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personal");
        setWho(accountId, session, modelAndView);
        return modelAndView;
    }

    /**
     * 我的礼物(分页)
     * @param accountId
     * @param page
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}/myGift", method = RequestMethod.GET)
    public ModelAndView myGift(@PathVariable("accountId") long accountId,@RequestParam("page") int page,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personalMyGift");
        setWho(accountId, session, modelAndView);
        Page<MyGift> myGiftByPage = personalService.getMyGiftByPage(accountId, page, 8);
        modelAndView.addObject("pageInfo",myGiftByPage);
        return modelAndView;
    }


    /**
     * 我的问题(分页)
     * @param accountId
     * @param page
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}/myAsk", method = RequestMethod.GET)
    public ModelAndView myAsk(@PathVariable("accountId") long accountId, @RequestParam("page") int page,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personalMyAsk");
        setWho(accountId, session, modelAndView);
        Page<Question> questionPage = personalService.getMyAskByPage(accountId, page, Page.DEFAULT_PAGE_SIZE);
        modelAndView.addObject("pageInfo",questionPage);
        return modelAndView;

    }

    /**
     * 我的收藏(分页)
     * @param accountId
     * @param page
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}/myCollect", method = RequestMethod.GET)
    public ModelAndView myCollect(@PathVariable("accountId") long accountId, @RequestParam("page") int page,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personalMyCollect");
        setWho(accountId, session, modelAndView);
        Page<MyCollect> myCollectPage = personalService.getMyCollectByPage(accountId, page, Page.DEFAULT_PAGE_SIZE);
        modelAndView.addObject("pageInfo",myCollectPage);
        return modelAndView;

    }

    /**
     * 我的关注(分页)
     * @param accountId
     * @param page
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}/myAttention", method = RequestMethod.GET)
    public ModelAndView myAttention(@PathVariable("accountId") long accountId, @RequestParam("page") int page,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personalMyAttention");
        setWho(accountId, session, modelAndView);
        Page<MyAttention> myAttentionPage = personalService.getMyAttentionByPage(accountId, page, Page.DEFAULT_PAGE_SIZE);
        modelAndView.addObject("pageInfo",myAttentionPage);
        return modelAndView;
    }

    /**
     * 我的回答(分页)
     * @param accountId
     * @param page
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}/myAnswer", method = RequestMethod.GET)
    public ModelAndView myAnswer(@PathVariable("accountId") long accountId, @RequestParam("page") int page,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personalMyAnswer");
        setWho(accountId, session, modelAndView);
        Page<MyAnswer> myAnswerPage = personalService.getMyAnswerByPage(accountId, page, Page.DEFAULT_PAGE_SIZE);
        modelAndView.addObject("pageInfo",myAnswerPage);
        return modelAndView;
    }

    /**
     * 我的足迹(分页)
     * @param accountId
     * @param page
     * @param session
     * @return
     */
    @RequestMapping(value = "/{accountId}/myFootprint", method = RequestMethod.GET)
    public ModelAndView myFootprint(@PathVariable("accountId") long accountId, @RequestParam("page") int page,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("personal/personalMyFootprint");
        setWho(accountId, session, modelAndView);
        Page<MyFootprint> myFootprintPage = personalService.getMyFootprintByPage(accountId, page, Page.DEFAULT_PAGE_SIZE);
        modelAndView.addObject("pageInfo",myFootprintPage);
        return modelAndView;
    }

    private void setWho(long accountId, HttpSession session, ModelAndView modelAndView) {
        Account sessionAccount = (Account) session.getAttribute("account");
        Account account = accountDao.selectAccountById(accountId);
        modelAndView.addObject("account",account);
        if (sessionAccount.getAccountId() == accountId) {
            modelAndView.addObject("who", "我");
        }else{
            modelAndView.addObject("who", "TA");
        }
    }
}
